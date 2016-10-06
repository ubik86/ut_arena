class CreateImportGames < ActiveRecord::Migration[5.0]
  def change
    create_table :import_games do |t|
      t.datetime :ut_date
      t.string :game_logs

      t.timestamps
    end
  end
end
