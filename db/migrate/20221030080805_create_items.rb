class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

      t.integer :genre_id,      null: true
      t.string  :name,          null: true
      t.text    :introduction,  null: true
      t.integer :price,         null: true

      t.timestamps
    end
  end
end
