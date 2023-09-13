class AddSlugToSeasons < ActiveRecord::Migration[7.0]
  def change
    add_column :seasons, :slug, :string
    add_index :seasons, :slug, unique: true
  end
end
