class CreateTours < ActiveRecord::Migration[7.1]
  def change
    create_table :tours do |t|
      t.string :title
      t.string :description
      t.integer :duration
      t.integer :max_spots
      t.integer :price_per_person
      t.date :date
      t.references :category, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :language
      t.string :location

      t.timestamps
    end
  end
end
