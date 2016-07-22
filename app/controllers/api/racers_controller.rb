module Api
  class RacersController < ApplicationController
    def index
      if !request.accept || request.accept == "*/*"
		render plain: "/api/racers"
	  else
			#TBD
	  end
    end
    def show
      if !request.accept || request.accept == "*/*"
		render plain: "/api/racers/#{params[:id]}"
	  else
			#TBD
	  end
    end
  end
end