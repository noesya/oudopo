class AddFieldsToItem < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :name, :string
    add_column :items, :date, :date
  end
end
