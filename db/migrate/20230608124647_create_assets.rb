class CreateAssets < ActiveRecord::Migration[7.0]
  def change
    create_table :assets, id: :uuid do |t|
      t.references :archive, null: false, foreign_key: true, type: :uuid
      t.string :original_id
      t.text :original_url
      t.text :path
      t.jsonb :data

      t.timestamps
    end
  end
end
