class CreateLandmarks < ActiveRecord::Migration
  create_table :landmarks do |t|
    t.belongs_to :figure
    t.string :name
    t.timestamps
  end 
end
