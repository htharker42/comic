class AddStatusToComics < ActiveRecord::Migration[5.1]
  def change
    add_column :comics, :status, :string
    add_column :comics, :description, :text
    add_column :comics, :order, :integer
  end
end
