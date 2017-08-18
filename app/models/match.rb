class Match < ApplicationRecord
  #@games=Parse.parsefrompage
  #puts @games

  # @games.each do |game|
  #   game_s = GameS.new(params[:id])
  #   game_s.site = game
  # end

  def self.get_sites
    sites=Parse.parse_from_page
    sites.each do |site|
      Match.create(site: site)
    end
    sites
  end


end
