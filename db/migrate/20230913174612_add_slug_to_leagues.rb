class AddSlugToLeagues < ActiveRecord::Migration[7.0]
  def change
    add_column :leagues, :slug, :string
    add_index :leagues, :slug, unique: true
  end
end
