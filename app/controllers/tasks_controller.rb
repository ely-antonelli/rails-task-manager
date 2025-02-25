class TasksController < ApplicationController
  # before_action :task_params, only: [:name, :details, :completed]

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
    # @status = @task.completed?
    # if @status == false
    #   @message = 'This task is not completed'
    # else
    #   @message = 'This task is completed'
    # end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to tasks_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :details, :completed)
  end

end
