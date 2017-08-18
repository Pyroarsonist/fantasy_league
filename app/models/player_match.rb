class PlayerMatch < ApplicationRecord
  @COEF=60.to_f

  def self.get_stats()
    Match.all.each do |match|
      stats=Parse.parse_stats_from_match(match.site)
      stats.each do |stat|
        fantasy_points=(stat[:kills].to_f-stat[:deaths].to_f+stat[:assists].to_f/2+stat[:heads].to_f/4)*stat[:adr].to_f/@COEF
        PlayerMatch.create(url: stat[:url], name: stat[:name], name_id: stat[:name_id],
                           team: stat[:team], team_id: stat[:team_id], kills: stat[:kills], heads: stat[:heads],
                           assists: stat[:assists], deaths: stat[:deaths], adr: stat[:adr], fantasy_points: fantasy_points)
      end

    end
  end


end
