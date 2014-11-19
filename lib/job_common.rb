module JobCommon
  def job_params
    puts "----------OH SNAP JOB PARAMS!"
    params.require(:job).permit(:file,:status)
  end
end