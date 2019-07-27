class InterviewsController < ApplicationController
  def index
    @interviews = Interview.all
  end

  def show
    @interview = Interview.find(params[:id])
  end


  def new
    @interview = Interview.new
    if params[:candidate_id].present?
      @candidate = Candidate.find(params[:candidate_id])
    end
    @interview.managers.build
  end

  def create
    @interview = Interview.new(new_interview_params)

    if @interview.save
      redirect_to candidates_path
    else
      # persisting information about candidates on refresh
      @candidate = @interview.candidate
      render 'new'
    end
  end

  def edit
    @interview = Interview.find(params[:id])
  end

  def update
    @interview = Interview.find(params[:id])

      if @interview.update(interview_params)
        redirect_to interviews_path
      else
        render 'edit'
      end
  end

  def destroy
    @interview = Interview.find(params[:id])
    @interview.destroy

    redirect_to interviews_path
  end

  private
    def interview_params
      params.require(:interview).permit(:candidate_id, :location, :start_datetime, :end_datetime, manager_ids: [])
    end

    def new_interview_params
      params.require(:interview).permit(:candidate_id, manager_ids: [])
    end
end
