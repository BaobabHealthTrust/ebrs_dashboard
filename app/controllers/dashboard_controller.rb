class DashboardController < ApplicationController
 def index

 end

 def get_counts
  scores = {}

  children = Child.by_birth_district_and_record_status

  (children || []).each do |child|
   scores[child.birth_district] = Hash.new(0) if scores[child.birth_district].blank?
   scores[child.birth_district][child.record_status] += 1
  end

=begin
  districts = District.by_name.all.collect{|x| [x.name, x.id]}

  (districts || []).each do |name, code|

   counts = Child.by_district_code.keys(["#{code}"])

    if counts.rows.count > 0
     scores[name] = Hash.new(0)
     (counts || []).each do |child|
      scores[name][child.record_status] +=1
     end
    end

  end
=end
  render :text => scores.to_json
 end
end
