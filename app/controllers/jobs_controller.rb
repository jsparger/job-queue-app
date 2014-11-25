require 'job_common'
class JobsController < ApplicationController
  load_and_authorize_resource
  include JobCommon
  
  def new
  end
  
  def create
      # render plain: params[:job].inspect
      @job = Job.create!(job_params)
      redirect_to @job
  end
  
  def index
    @jobs = Job.all
  end
  
  def show
    @job = Job.find(params[:id])
  end
    
end