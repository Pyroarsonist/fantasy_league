class MatchesController < ApplicationController

  # GET /matches
  # GET /matches.json
  def index
    #Match.all.delete_all
    #Match.get_sites
    @matches = Match.all
    #@values=[4,3,2,3,1,5,3,4,2,0]
   # PlayerMatch.all.delete_all
   # PlayerMatch.get_stats
    @stats=PlayerMatch.all

  end

end
