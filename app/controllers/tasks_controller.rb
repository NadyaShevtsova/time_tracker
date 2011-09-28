class TasksController < ApplicationController
  before_filter :authenticate_user!

  def index
    @tasks = Task.all
  end

end
