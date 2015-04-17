require 'couchrest_model'
require 'thread'

class NationalIdNumberCounter < CouchRest::Model::Base

  use_database "local"

  cattr_accessor :mutex

  property :auto_increment_count, Integer, :default => 0

  timestamps!

  def self.assign_serial_number(child, gender, citizenship_mother, citizenship_father = nil)

    return false if (child.class.name.to_s.downcase != "child" rescue true)

    return false if gender.blank?

    return false if (citizenship_mother.blank? and citizenship_father.blank?)

    return false if child.district_id_number.blank?

    @mutex = Mutex.new if @mutex.blank?

    t = Thread.new do

      @mutex.lock

      counter = self.by_last_assigned.each.first

      counter = self.create(:auto_increment_count => 0) if counter.nil?

      next_number = counter.auto_increment_count + 1

      @mutex.unlock if !child.national_serial_number.blank?

      return false if !child.national_serial_number.blank?

      counter.update_attributes(:auto_increment_count => next_number)

      id = "%010d" % next_number

      infix = ""

      if gender.match(/^F/i) 

        infix = "1"

      elsif gender.match(/^M/i) 

        infix = "2"

      end

      npid = "#{id[0, 5]}#{infix}#{id[5, 9]}"

      NationalIdNumber.create(:national_serial_number_value => next_number, :district_id_number => child.district_id_number, :national_serial_number => npid)

      child.update_attributes(:national_serial_number => npid, :record_status => "PRINTED", :request_status => "CLOSED")

      @mutex.unlock

      return true

    end

  end

  design do
    view :by_last_assigned,
         :map => "function(doc) {
                  if ((doc['type'] == 'NationalIdNumberCounter')) {
                    emit(doc['auto_increment_count'], 1);
                  }
                }"
  end

end
