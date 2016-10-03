class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.references :players

      t.string :name
      t.string :ut_map
      t.datetime :date

      t.timestamps
    end
  end
end
