class CreatePlayerMatches < ActiveRecord::Migration[5.1]
  def up
    create_table :gamers do |t|
      t.string :name
      t.string :name_id
      t.string :team
      t.string :team_id
      t.string :match_all
      t.timestamps

    end
  end

  def down
    create_table :gamers do |t|
      t.string :name
      t.string :name_id
      t.string :team
      t.string :team_id
      t.string :match_all

      t.timestamps
    end
  end
end
