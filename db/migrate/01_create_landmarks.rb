class CreateLandmarks < ActiveRecord::Migration
  def change
    create_table :landmarks do |t|
      t.belongs_to :figure
      t.string :name
      t.timestamps
      t.integer  :year_completed
    end 
  end
end