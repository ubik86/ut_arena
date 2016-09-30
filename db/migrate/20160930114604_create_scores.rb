class CreateScores < ActiveRecord::Migration[5.0]
  def change
    create_table :scores do |t|
      t.references :game
      t.references :player

      t.integer :points
      t.datetime :game_at

      t.timestamps
    end
  end
end
