require 'job_common'
class JobQueueController < ApplicationController
  load_and_authorize_resource
  include JobCommon
  
  def new
  end
  
  def create
    item = Job.create!(job_params)
    JobQueue.push(item)
    respond_to do |format|
      format.html { redirect_to action: :index }
      format.json { render json: { :message => "success", :url => request.url } }
    end
  end
  
  def pop
    item = JobQueue.pop
    respond_to do |format|
      format.html { redirect_to item }
      format.json { render json: item.to_json(:only => [:id, :file]) }
    end
  end
  
  def show
    @item = JobQueueItem.find(params[:id])
  end
  
  def index
    @items = JobQueue.all
  end
  
end
