class PlayerMatch < ApplicationRecord
  @COEF=60.to_f

  def calculate_fantasy_points (kills, deaths, assists, heads, adr)
    fantasy_points=(kills.to_f-deaths.to_f+assists.to_f/2+heads.to_f/4)*adr.to_f/@COEF
    fantasy_points
  end

  def self.get_stats
    Match.all.each do |match|
      stats=Parse.parse_stats_from_match(match.site)
      stats.each do |stat| # TODO delete fantasy_points and add it on site, coz it static now
        fantasy_points=calculate_fantasy_points(stat[:kills], stat[:deaths], stat[:assists], stat[:heads], stat[:adr])
        PlayerMatch.create(url: stat[:url], name: stat[:name], name_id: stat[:name_id],
                           team: stat[:team], team_id: stat[:team_id], kills: stat[:kills], heads: stat[:heads],
                           assists: stat[:assists], deaths: stat[:deaths], adr: stat[:adr], fantasy_points: fantasy_points)
      end

    end
  end

  def self.get_max_fantasy_points
    player_match_all=PlayerMatch.all
    player_match=player_match_all.first

    player_match_all.each do |pl_m|
      player_match=pl_m if player_match.fantasy_points<pl_m.fantasy_points
    end
    player_match
  end

  def self.get_min_fantasy_points
    player_match_all=PlayerMatch.all
    player_match=player_match_all.first

    player_match_all.each do |pl_m|
      player_match=pl_m if player_match.fantasy_points>pl_m.fantasy_points
    end
    player_match
  end

  def self.get_avg_fantasy_points

    fant_p_sum=0
    counter=0

    PlayerMatch.all.each do |pl_m|
      fant_p_sum+=pl_m.fantasy_points
      counter=counter.next
    end
    fant_p=fant_p_sum/counter
    fant_p

  end


end
