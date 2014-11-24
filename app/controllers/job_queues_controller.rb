require 'job_common'
class JobQueuesController < ApplicationController
  load_and_authorize_resource
  include JobCommon
  
  def new
  end
  
  def create
    item = Job.create!(job_params)
    JobQueue.push(item)
    redirect_to action: "index"
  end
  
  def pop
    item = JobQueue.pop
    render json: item.to_json(:only => [:id, :file])
  end
  
  def show
    @item = JobQueueItem.find(params[:id])
  end
  
  def index
    @items = JobQueue.all
  end
  
end
