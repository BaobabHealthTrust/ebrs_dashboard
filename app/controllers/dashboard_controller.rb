class DashboardController < ApplicationController
 def index

 end

 def get_counts
  scores = {}

  districts = District.by_name.all.collect{|x| [x.name, x.id]}

  (districts || []).each do |name, code|

   counts = Child.by_district_code.keys(["#{code}"])
   if counts.rows.count > 0
    scores[name] = {"DC OPEN" => 0, "FACILITY OPEN" => 0,"HQ OPEN" => 0,
                    "GRANTED"=> 0,"DC_ASK"=> 0,"PRINTED" => 0 }
    (counts || []).each do |child|
     scores[name][child.record_status] +=1
    end
   end
  end

  render :text => scores.to_json
 end
end
