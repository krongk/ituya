class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.references :art
      t.integer :user_id
			t.string :user_mail
      t.text :message
      t.integer :digg

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
