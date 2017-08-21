class MatchesController < ApplicationController

  # GET /matches
  # GET /matches.json
  def index
    major_krakow_id='2720'
    custom_id='2700'
    #parsing_from_event major_krakow_id
    @matches = Match.all
    #@values=[4,3,2,3,1,5,3,4,2,0]
    @stats=PlayerMatch.all
    @gamers=Gamer.all
    @max=PlayerMatch.get_max_fantasy_points
    @min=PlayerMatch.get_min_fantasy_points
    @avg=sprintf "%.3f", PlayerMatch.get_avg_fantasy_points
  end

  def wipe_all_data_from_event
    Match.all.delete_all
    PlayerMatch.all.delete_all
    Gamer.all.delete_all
  end

  def parsing_from_event event_id
    wipe_all_data_from_event
    Match.get_sites event_id #get matches
    PlayerMatch.get_stats #take stats from current all matches
    Gamer.insert_from_all_matches #generate gamers from matches
  end
end
