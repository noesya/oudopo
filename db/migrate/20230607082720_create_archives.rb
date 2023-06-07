class CreateArchives < ActiveRecord::Migration[7.0]
  def change
    create_table :archives, id: :uuid do |t|
      t.references :organisation, null: false, foreign_key: true, type: :uuid
      t.string :secret
      t.string :url
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
