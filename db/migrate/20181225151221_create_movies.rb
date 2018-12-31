class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :trailer
      t.string :starring
      t.text :info
      t.string :genre
      t.integer :rating

      t.timestamps
    end
  end
end
