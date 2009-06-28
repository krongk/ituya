class CreateSubjects < ActiveRecord::Migration
  def self.up
    create_table :subjects do |t|
      t.references :user
      t.string :name
      t.integer :art_amount

      t.timestamps
    end
  end

  def self.down
    drop_table :subjects
  end
end
