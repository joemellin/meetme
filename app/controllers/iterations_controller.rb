class IterationsController < ApplicationController
	before_action :set_iteration, only: [:show, :edit, :update, :destroy]
	before_filter :load_idea

	# GET /iterations
	# GET /iterations.json
	def index
		@iterations = @idea.iterations.all
		respond_to do |format|
			format.html # index.html.erb
			format.json { render json: @iterations }
		end
	end

	# GET /iterations/1
	# GET /iterations/1.json
	def show
		@iteration = @idea.iterations.find(params[:id])

		respond_to do |format|
			format.html # show.html.erb
			format.json { render json: @iteration }
		end
	end

	# GET /iterations/new
	def new
		@iteration = @idea.iterations.new
		 respond_to do |format|
			format.html # new.html.erb
			format.json { render json: @iteration }
		end
	end

	# GET /iterations/1/edit
	def edit
		@iteration = @idea.iterations.find(params[:id])
	end

	# POST /iterations
	# POST /iterations.json
	def create
		@iteration = @idea.iterations.new(iteration_params)

		respond_to do |format|
			if @iteration.save
				format.html { redirect_to idea_path(@idea) }
				format.json { render :show, status: :created, location: @iteration }
			else
				format.html { render :new }
				format.json { render json: @iteration.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /iterations/1
	# PATCH/PUT /iterations/1.json
	def update
		respond_to do |format|
			if @idea.iterations.update(iteration_params)
				format.html { redirect_to idea_path(@idea) }
				format.json { render :show, status: :ok, location: @iteration }
			else
				format.html { render :edit }
				format.json { render json: @iteration.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /iterations/1
	# DELETE /iterations/1.json
	def destroy
		@iteration.destroy
		respond_to do |format|
			format.html { redirect_to ideas_path, notice: 'Iteration was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_iteration
			@iteration = Iteration.find(params[:id])
		end

		def load_idea
			@idea = Idea.find(params[:idea_id]) 
			rescue ActiveRecord::RecordNotFound
			flash[:alert] = "The course you were looking for could not be found."
			redirect_to ideas_path
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def iteration_params
			params.require(:iteration).permit(:title, :idea_id, :image, :description, :feedback, :pop, :popword)
		end
end
