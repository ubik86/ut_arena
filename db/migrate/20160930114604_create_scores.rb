class CreateScores < ActiveRecord::Migration[5.0]
  def change
    create_table :scores do |t|
      t.references :game
      t.references :player
      t.references :team

      t.integer :points

      t.timestamps
    end
  end
end
