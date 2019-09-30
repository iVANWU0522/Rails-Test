class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :species
      t.string :gender
      t.references :location, foreign_key: true
      t.references :affiliation, foreign_key: true
      t.string :weapon
      t.string :vehicle

      t.timestamps
    end
  end
end
