class Match < ApplicationRecord
  def self.get_sites(event_id)
    sites=Parse.parse_from_page event_id
    sites.each do |site|
      Match.create(site: site)
    end
    sites
  end


end

