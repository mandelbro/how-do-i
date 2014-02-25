class StepsController < ApplicationController

   before_filter :get_step,     :only => [:show, :edit, :update, :destroy]
   before_filter :get_subject,  :only => [:index, :show, :edit, :update, :new, :create, :destroy]

  def index
    @steps = @subject.steps
  end

  def show
  end

  def new
    @step = Step.new
  end

  def create
    @step = Step.new(step_params)
    @subject.steps << @step

    if @step.save
      flash[:notice] = "Step was successfully created."
      redirect_to @subject
    else
      # we'll get to this in a bit
    end
  end

  def edit
  end

  def update
    @step.update_attributes(step_params)
    if @step.save
      flash[:notice] = "Step was successfully updated."
      redirect_to [@subject, @step]
    else
      # we'll get to this in a bit
    end
  end

  def destroy
    if @step.destroy
      flash[:notice] = "Step was successfully deleted."
      redirect_to @subject
    else
      # we'll get to this in a bit
    end
  end

  private

  def get_step
    @step = Step.find(params[:id])
  end

  def get_subject
    @subject = Subject.find(params[:subject_id])
  end

  def step_params
    params.require(:step).permit(:title, :description, :weight)
  end

end
