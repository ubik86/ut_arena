class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.references :game

      t.string :ut_name
      t.integer :team_id

      t.integer :score

      t.timestamps
    end
  end
end
