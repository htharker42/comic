class CreateComics < ActiveRecord::Migration[5.1]
  def change
    create_table :comics do |t|
      t.string :title
      t.text :main_image
      t.text :thumb_image

      t.timestamps
    end
  end
end
