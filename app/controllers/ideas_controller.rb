class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]



  def index
    @ideas = Idea.order("RANDOM()").where(user_id: 1)
    @results = Iteration.all.sort { |p2, p1| p2.created_at <=> p1.created_at }
    @users = User.order("RANDOM()").limit(12)
    @count = User.all.count
  end

  def show
    @count = User.all.count
  end

  def new
    @idea = current_user.ideas.build
  end

  def edit
  end

  def create
    @idea = current_user.ideas.build(idea_params)

    respond_to do |format|
      if @idea.save
        format.html { redirect_to @idea }
        format.json { render :show, status: :created, location: @idea }
      else
        format.html { render :new }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @idea.update(idea_params)
        format.html { redirect_to @idea }
        format.json { render :show, status: :ok, location: @idea }
      else
        format.html { render :edit }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @idea.destroy
    respond_to do |format|
      format.html { redirect_to ideas_url, notice: 'Sometimes maybe there are bad ideas :)' }
      format.json { head :no_content }
    end
  end

  private
    def set_idea
      @idea = Idea.find(params[:id])
    end

    def correct_user
      @idea = current_user.ideas.find_by(id: params[:id])
      redirect_to ideas_path, notice: "Hey! Pick on your own idea :)" if @idea.nil?
    end
    
    def idea_params
      params.require(:idea).permit(:description, :image, :about, :outcome)
    end

end
