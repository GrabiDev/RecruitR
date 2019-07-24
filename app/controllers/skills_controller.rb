class SkillsController < ApplicationController
  def index
      @skills = Skill.all
  end

  def new
      @skill = Skill.new
  end

  def edit
      @skill = Skill.find(params[:id])
  end

  def create
      @skill = Skill.new(skill_params)

      if @skill.save
          redirect_to skills_path
      else
          render 'new'
      end
  end

  def update
      @skill = Skill.find(params[:id])

      if @skill.update(skill_params)
          redirect_to skills_path
      else
          render 'edit'
      end
  end

  def destroy
      @skill = Skill.find(params[:id])
      @skill.destroy

      redirect_to skills_path
  end

  private
      def skill_params
          params.require(:skill).permit(:name)
      end
end