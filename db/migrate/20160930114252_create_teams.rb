class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :ut_name
      t.integer :score

      t.timestamps
    end
  end
end
