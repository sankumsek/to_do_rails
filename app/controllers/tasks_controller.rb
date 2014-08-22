class TasksController < ApplicationController
  def index
    @tasks = Task.all
    render('tasks/index.html.erb')
  end

  def show
    @task = Task.find(params[:id])
    render('tasks/show.html.erb')
  end

  def new
    @task = Task.new
    render('tasks/new.html.erb')
  end

  def create
    @task = Task.new(:name => params[:name],
                     :status => params[:status])
    if @task.status == nil
      @task.status = false
    end
    if @task.save
      render('tasks/success.html.erb')
    else
      render('tasks/new.html.erb')
    end
  end

  def edit
    @task = Task.find(params[:id])
    render('tasks/edit.html.erb')
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(:name => params[:name],
                    :status => params[:status])
      render('tasks/success.html.erb')
    else
      render('tasks/edit.html.erb')
    end
  end
end
