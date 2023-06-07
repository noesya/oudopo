class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items, id: :uuid do |t|
      t.references :archive, null: false, foreign_key: true, type: :uuid
      t.string :original_id
      t.jsonb :data

      t.timestamps
    end
  end
end
