class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.belongs_to :album
      t.string :file


      t.timestamp
    end
  end
end
