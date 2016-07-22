module Api
  class EntriesController < ApplicationController
    def index
      if !request.accept || request.accept == "*/*"
		render plain: "/api/racers/#{params[:racer_id]}/entries"
	  else
			#TBD
	  end
    end
    def show
      if !request.accept || request.accept == "*/*"
		render plain: "/api/racers/#{params[:racer_id]}/entries/#{params[:id]}"
	  else
			#TBD
	  end
    end
  end
end