module Api
  class RacesController < ApplicationController
  	rescue_from Mongoid::Errors::DocumentNotFound do |exception|
  		render :status=>:not_found, :template=>"api/error_msg",
			   :locals=>{ :msg=>"woops: cannot find race[#{params[:id]}]"}
	end

	rescue_from ActionView::MissingTemplate do |exception|
      render plain: "woops: we do not support that content-type[#{request.accept}]", :status => 415
    end

  	def index
      if !request.accept || request.accept == "*/*"
		render plain: "/api/races, offset=[#{params[:offset]}], limit=[#{params[:limit]}]"
	  else
			#TBD
	  end
    end

    def show
      if !request.accept || request.accept == "*/*"
		    render plain: "/api/races/#{params[:id]}"
	   else
		  @race = Race.find(params[:id])
		  render @race
	   end
    end

    def create	
      if !request.accept || request.accept == "*/*"
		render plain: "#{params[:race][:name]}", status: :ok
	  else
		@race = Race.new(race_params)
		if @race.save
			render plain: race_params[:name], status: :created 
		end
	  end
    end

    def update
      Rails.logger.debug("method=#{request.method}")
      @race = Race.find(params[:id])
      if @race.update(race_params)
      	render json: @race
      end
    end

    def destroy
      @race = Race.find(params[:id])
      @race.destroy
      render :nothing=>true, :status=> :no_content
    end

    private

	  	def race_params
	      params.require(:race).permit(:name, :date)
	  	end

    protect_from_forgery with: :null_session
  end
end