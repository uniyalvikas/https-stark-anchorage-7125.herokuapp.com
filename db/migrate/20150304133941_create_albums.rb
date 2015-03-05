class CreateAlbums < ActiveRecord::Migration
 def self.up
    create_table :albums do |t|
      t.string :caption, :limit => 40, :null => false
      t.text :description
      t.references :user, :null => false
      t.integer :pictures_count, :default => 0
      t.timestamps
    end
    add_index :albums, [:user_id], :name => :albums_user_index
  end

  def self.down
    remove_index :albums, :name => :albums_user_index
    drop_table :albums
  end
end
