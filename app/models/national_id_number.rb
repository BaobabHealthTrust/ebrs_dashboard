require 'couchrest_model'

class NationalIdNumber < CouchRest::Model::Base

  use_database "local"

  before_save      EncryptionWrapper.new("national_serial_number_value")
  after_save       EncryptionWrapper.new("national_serial_number_value")
  after_initialize EncryptionWrapper.new("national_serial_number_value")

  before_save      EncryptionWrapper.new("national_serial_number")
  after_save       EncryptionWrapper.new("national_serial_number")
  after_initialize EncryptionWrapper.new("national_serial_number")

  before_save      EncryptionWrapper.new("district_id_number")
  after_save       EncryptionWrapper.new("district_id_number")
  after_initialize EncryptionWrapper.new("district_id_number")

  property :national_serial_number_value, String
  property :national_serial_number, String
  property :district_id_number, String

  timestamps!

  design do
    view :by_district_id_number,
         :map => "function(doc) {
                  if ((doc['type'] == 'NationalIdNumber')) {
                    emit(doc['district_id_number'], 1);
                  }
                }"
  end

end