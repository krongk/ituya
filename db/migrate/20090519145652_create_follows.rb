class CreateFollows < ActiveRecord::Migration
  def self.up
    create_table :follows do |t|
      t.references :user
      t.integer :the_followed_id

      t.timestamps
    end
  end

  def self.down
    drop_table :follows
  end
end
