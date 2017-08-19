class Match < ApplicationRecord
  def self.get_sites
    sites=Parse.parse_from_page
    sites.each do |site|
      Match.create(site: site)
    end
    sites
  end


end

