class MatchesController < ApplicationController

  # GET /matches
  # GET /matches.json
  def index
    # Match.all.delete_all
    #major_krakow_id='2720'
    #Match.get_sites major_krakow_id
    @matches = Match.all
    #@values=[4,3,2,3,1,5,3,4,2,0]
    #PlayerMatch.all.delete_all
    #PlayerMatch.get_stats
    @stats=PlayerMatch.all
    #Gamer.all.delete_all
    #Gamer.insert_from_all_matches
    @gamers=Gamer.all
    @max=PlayerMatch.get_max_fantasy_points
    @min=PlayerMatch.get_min_fantasy_points
    @avg=sprintf "%.3f", PlayerMatch.get_avg_fantasy_points
  end
end
