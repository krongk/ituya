class CreateNotes < ActiveRecord::Migration
  def self.up
    create_table :notes do |t|
      t.references :user
      t.integer :from_user_id
      t.string :from_user_mail
      t.text :message

      t.timestamps
    end
  end

  def self.down
    drop_table :notes
  end
end
