class CreatePictures < ActiveRecord::Migration
   def self.up
    create_table :pictures do |t|
      t.string :caption, :limit => 40
      t.text :description
      t.references :user, :null => false
      t.references :album, :null => false
      t.string :content_type, :null => false
      t.integer :width, :null => false
      t.integer :height, :null => false
      t.timestamps
    end
    add_index :pictures, [:user_id], :name => :pictures_user_index
    add_index :pictures, [:album_id], :name => :pictures_album_index
  end

  def self.down
    remove_index :pictures, :name => :pictures_album_index
    remove_index :pictures, :name => :pictures_user_index
    drop_table :pictures
  end
end
