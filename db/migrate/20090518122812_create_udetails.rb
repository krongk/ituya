class CreateUdetails < ActiveRecord::Migration
  def self.up
    create_table :udetails do |t|
      t.references :user
      t.string :nike_name
      t.string :image
      t.text :about_me
      t.integer :art_amount
      t.integer :login_amount

      t.timestamps
    end
  end

  def self.down
    drop_table :udetails
  end
end
