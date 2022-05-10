class Api::V1::ProfilesController < ApplicationController

	before_action :authenticate_user!
	before_action :set_profile, only: [:show, :edit, :update, :destroy]

	def index
		@profiles = current_user.profiles.all
	end

	def show
		if authorized?
            respond_to do |format|
              format.json { render :show }
            end
        else
            handle_unauthorized
        end
	end

	def create
		@profile = current_user.profiles.build(profile_params)
        if authorized?
          	respond_to do |format|
            	if @profile.save
              		format.json { render :show, status: :created, location: api_v1_profile_path(@profile) }
            	else
              		format.json { render json: @profile.errors, status: :unprocessable_entity }
            	end
          	end
      	else
        	handle_unauthorized
      	end
	end

	def update
		if authorized?
         	respond_to do |format|
            	if @profile.update(profile_params)
              		format.json { render :show, status: :ok, location: api_v1_profile_path(@profile) }
            	else
              		format.json { render json: @profile.errors, status: :unprocessable_entity }
            	end
          	end
      	else
        	handle_unauthorized
      	end
	end

	def destroy
		if authorized?
        	@profile.destroy
         	respond_to do |format|
            	format.json { head :no_content }
          	end
      	else
          	handle_unauthorized
      	end
	end

	private 

		def set_profile
			@profile = Profile.find_by_id(params[:id])
		end

		def authorized?
	        return true if @profile != nil and @profile.user == current_user
	        return false
	    end

	    def handle_unauthorized
	        unless authorized?
	          respond_to do |format|
	            format.json { render :unauthorized, status: 401 }
	          end
	        end
	    end
end
