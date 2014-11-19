class CreateJobQueues < ActiveRecord::Migration
  def change
    create_table :job_queues do |t|
      t.references :Job, index: true, unique: true

      t.timestamps
    end
  end
end