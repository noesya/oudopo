class AddDateToAssets < ActiveRecord::Migration[7.0]
  def change
    add_column :assets, :date, :datetime
  end
end
