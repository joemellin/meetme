class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!


  def index
    @ideas = Idea.all
    @results = Iteration.all.sort { |p2, p1| p1.created_at <=> p2.created_at }

  end

  def show
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
        format.html { redirect_to @idea, notice: 'This idea is officially in progress! Way to do it!' }
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
        format.html { redirect_to @idea, notice: 'Idea improved!' }
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
      params.require(:idea).permit(:description, :image, :about)
    end

end
