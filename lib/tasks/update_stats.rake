require 'yaml'

namespace :ebrs do
  task :cron => :environment do
    def start
      puts "starting"
      results = get_tallies
      puts "received stats"
      save_tallies(results)
      puts "saved stats"
    end

    def get_tallies
      scores = {}

      children = Child.by_birth_district_and_record_status
      begin
        (children || []).each do |child|
          scores[child.birth_district] = Hash.new(0) if scores[child.birth_district].blank?
          scores[child.birth_district][child.record_status] += 1
        end
      rescue RestClient::ResourceNotFound => nfe
        scores
      end

      return scores
    end


    def save_tallies(tallies)

      file_name = Rails.root.join('docs', 'statistics.txt')
      File.open(file_name, 'w') do |f|
        f.write tallies.to_yaml
      end

    end
    start
  end
end



