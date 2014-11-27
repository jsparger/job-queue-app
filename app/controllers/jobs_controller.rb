require 'job_common'
class JobsController < ApplicationController
  load_and_authorize_resource
  include JobCommon
  
  def new
  end
  
  def create
    job = Job.create!(job_params)
    respond_to do |format|
      format.html { redirect_to job }
      format.json { render json: { :message => "success", :url => request.url } }
    end
  end
  
  def index
    @jobs = Job.all
  end
  
  def show
    @job = Job.find(params[:id])
    @job = Job.first
  end
    
end