class AddSlugToArchives < ActiveRecord::Migration[7.0]
  def change
    add_column :archives, :slug, :string
  end
end
