class SubjectsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_filter :get_subject, :only => [:show, :edit, :update, :destroy]

  def index
    @subjects = Subject.all
  end

  def show
    @steps = @subject.steps.order('weight asc')
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      flash[:notice] = "Subject was successfully created."
      redirect_to @subject
    else
      # we'll get to this in a bit
    end
  end

  def edit
  end

  def update
    @subject.update_attributes(subject_params)
    if @subject.save
      flash[:notice] = "Subject was successfully updated."
      redirect_to @subject
    else
      # we'll get to this in a bit
    end
  end

  def destroy
    if @subject.destroy
      flash[:notice] = "Subject was successfully deleted."
      redirect_to subjects_path
    else
      # we'll get to this in a bit
    end
  end

  private

  def get_subject
    @subject = Subject.find(params[:id])
  end

  def subject_params
    params.require(:subject).permit(:title, :description)
  end

end
