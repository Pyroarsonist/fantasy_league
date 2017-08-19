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

  def self.get_from_json_matches_to_array(gamer)
    string_array_json=gamer[:match_all]
    array=[]
    string_array_json.each do |s_j|
      array+=JSON.parse(s_j)
    end
    array
  end

end
