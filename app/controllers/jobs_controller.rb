require 'job_common'
class JobsController < ApplicationController
  load_and_authorize_resource
  include JobCommon
  
  def new
    puts "--------BOB MAN------------------"
  end
  
  def create
    puts "--------OH MY GOSH------------------"
    item = Job.create!(job_params)
    # redirect_to action: "index"
    puts "woah baby"
    respond_to do |format|
      format.html do
        redirect_to @job
      end
        format.json { render json: { :message => "success", :url => request.url } }
    end

    puts "--------OH MY GOSH------------------"
  end
  
  def index
    @jobs = Job.all
  end
  
  def show
    @job = Job.find(params[:id])
    @job = Job.first
  end
    
end