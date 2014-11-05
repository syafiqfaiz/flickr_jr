class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.string :source
      t.integer :album_id

      t.timestamp
    end
  end
end
