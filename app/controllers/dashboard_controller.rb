class DashboardController < ApplicationController
 def index

 end

 def get_counts

  file_name = Rails.root.join('docs', 'statistics.txt')
  file = YAML.load_file(file_name)
  scores = {}

  (file || []).each do |district, statistics|
    scores[district]= {}
    (statistics || []).each do |type, statistic|
      scores[district][type] = statistic
    end
  end

  render :text => scores.to_json
 end
end
