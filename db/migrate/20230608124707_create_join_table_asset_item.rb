class CreateJoinTableAssetItem < ActiveRecord::Migration[7.0]
  def change
    create_join_table :items, :assets, column_options: {type: :uuid} do |t|
      t.index [:asset_id, :item_id]
      t.index [:item_id, :asset_id]
    end
  end
end
