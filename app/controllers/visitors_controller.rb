class VisitorsController < ApplicationController
	def index
		@users = User.order("RANDOM()").limit(8)
		@ideas = Idea.order("RANDOM()").limit(8)
	end
end
