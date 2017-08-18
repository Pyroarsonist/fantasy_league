class CreatePlayerMatches < ActiveRecord::Migration[5.1]
  def up
    create_table :player_matches do |t|
      t.string :url
      t.string :name
      t.string :name_id
      t.string :team
      t.integer :team_id
      t.integer :kills
      t.integer :heads
      t.integer :assists
      t.integer :deaths
      t.float :adr
      t.float :fantasy_points

      t.timestamps

    end
  end

  def down
    change_table :player_matches do |t|
      t.string :url
      t.string :name
      t.string :name_id
      t.string :team
      t.integer :team_id
      t.integer :kills
      t.integer :heads
      t.integer :assists
      t.integer :deaths
      t.float :adr
      t.float :fantasy_points
    end
  end
end
