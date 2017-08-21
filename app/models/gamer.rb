require 'json'
class Gamer < ApplicationRecord
  serialize :match_all, Array

  def self.matches(player_match)
    matches=[]
    matches.push(
        url: player_match[:url],
        kills: player_match[:kills],
        heads: player_match[:heads],
        assists: player_match[:assists],
        deaths: player_match[:deaths],
        adr: player_match[:adr],
        fantasy_points: player_match[:fantasy_points]
    )
    matches
  end

  def self.insert_gamer(player_match)
    gamer= Gamer.where(name_id: player_match[:name_id]).first_or_initialize
    if gamer.new_record?
      matches_1=matches(player_match)
      json_1 = matches_1.to_json
      Gamer.create(name: player_match[:name], name_id: player_match[:name_id], team: player_match[:team],
                   team_id: player_match[:team_id], match_all: [json_1])
    else
      matches_2=matches(player_match)
      json_2 = matches_2.to_json
      old =gamer.match_all
      new = old + [json_2]
      Gamer.find_by(name_id: player_match[:name_id]).update(match_all: new)
    end

  end

  def self.insert_from_all_matches
    PlayerMatch.all.each do |player_match|
      insert_gamer(player_match)
    end
  end

  def self.get_from_json_matches_to_array(gamer) # array of hashes of player's matches
    string_array_json=gamer[:match_all]
    array=[]
    string_array_json.each do |s_j|
      array+=JSON.parse(s_j)
    end
    array
  end

  def self.get_avg_stats(gamer)
    matches = get_from_json_matches_to_array gamer
    kills=0
    heads=0
    assists=0
    deaths=0
    adr=0
    fantasy_points=0
    matches.each do |m|
      kills+=m['kills'].to_f
      assists+=m['assists'].to_f
      heads+=m['heads'].to_f
      deaths+=m['deaths'].to_f
      adr+=m['adr'].to_f
      fantasy_points+=m['fantasy_points'].to_f
    end
    num_of_m=matches.size
    kills/=num_of_m
    heads/=num_of_m
    assists/=num_of_m
    deaths/=num_of_m
    adr/=num_of_m
    fantasy_points/=num_of_m
    {kills: kills, heads: heads, assists: assists, deaths: deaths, adr: adr, fantasy_points: fantasy_points}
  end

end
