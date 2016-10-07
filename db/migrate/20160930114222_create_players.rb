class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|

      t.string :name
      t.string :ut_nick

      t.timestamps
    end
  end
end
