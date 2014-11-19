require 'rail_q'
class JobQueue < ActiveRecord::Base
  belongs_to :Job
  include RailQ
  
  def self.queue_type
    return :Job
  end
  
  def get_item
    return self.Job
  end
end