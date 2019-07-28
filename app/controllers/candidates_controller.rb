class CandidatesController < ApplicationController
  def index
    # if position parameter passed, candidates only for this position
    if params[:position_id].present?
      @candidates = Candidate.where(position_id: params[:position_id])
    else # otherwise, list all candidates
      @candidates = Candidate.all
    end
  end

  def show
    @candidate = Candidate.find(params[:id])
  end

  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(candidate_params)

    if @candidate.save
      redirect_to candidates_path
    else
      render 'new'
    end
  end

  def edit
    @candidate = Candidate.find(params[:id])
  end

  def update
    @candidate = Candidate.find(params[:id])

      if @candidate.update(candidate_params)
        redirect_to candidates_path
      else
        render 'edit'
      end
  end

  def destroy
    @candidate = Candidate.find(params[:id])
    @candidate.destroy

    redirect_to candidates_path
end

  private
    def candidate_params
      params.require(:candidate).permit(:first_name, :last_name, :email, :all_skills, :position_id)
    end
end
