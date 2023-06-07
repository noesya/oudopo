class CreateOrganisations < ActiveRecord::Migration[7.0]
  def change
    create_table :organisations do |t|
      t.string :name
      t.string :slug
      t.string :website

      t.timestamps
    end
  end
end
