class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string  :name
      t.integer :album_id
      t.text    :url

      t.timestamps
    end
  end
end
