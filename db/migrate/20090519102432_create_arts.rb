class CreateArts < ActiveRecord::Migration
  def self.up
    create_table :arts do |t|
      t.references :subject
      t.integer :user_id
      t.string :image
      t.text :describe

      t.timestamps
    end
  end

  def self.down
    drop_table :arts
  end
end
