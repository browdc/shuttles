class CreateShuttles < ActiveRecord::Migration
  def change
    create_table :shuttles do |t|
      t.string :name

      t.timestamps
    end
  end
end
