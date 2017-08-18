class CreateMatches < ActiveRecord::Migration[5.1]
  def up
    create_table :matches do |t|

      t.string :site

      t.timestamps

    end
  end

  def down
    change_table :matches do |t|
      t.string :site
    end
  end
end
