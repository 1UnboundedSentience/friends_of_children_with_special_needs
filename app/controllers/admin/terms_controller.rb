class Admin::TermsController < ApplicationController
  def index
    @terms = Term.all
  end

  def new
    @term = Term.new
  end

  def create
    @term = Term.new(term_params)
    if @term.save
      flash[:success] = "Successfully created term"
      redirect_to terms_path
    else
      flash[:alert] = @term.errors.full_messages.to_sentence
      render action: "new"
    end

    #       @course = Course.new(course_params)
      # if @course.save
      #   flash[:success] = "Successfully created course"
      #   redirect_to courses_path
      # else
      #   flash[:alert] = @course.errors.full_messages.to_sentence
      #   render action: "new"
      # end
  end

  def show
    @term = Term.where(id: params[:id])
    binding.pry
  end

  def edit

  end

  def delete

  end

  private

    def term_params
      params.require(:term).permit(
          :name, :description, :start_date, :end_date)
    end
end
