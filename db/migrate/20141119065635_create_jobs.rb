class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.text :file
      t.string :status

      t.timestamps
    end
  end
end
