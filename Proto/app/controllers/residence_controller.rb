class ResidenceController < ApplicationController
	
	before_filter :verify_active_session,  :except => [:create, :login]

	def create
		#TODO criar dados
		redirect_to :back
	end
end
