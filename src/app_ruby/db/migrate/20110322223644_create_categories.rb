class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.integer :category_id, :default => 0, :null => false
      t.integer :user_id, :default => 0, :null => false
      t.string :name, :limit =>100, :null => false
      t.text :description
      t.string :url, :limit =>100
      t.bolean :verified, :null => false, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :categories
  end
end
