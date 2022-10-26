class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name,             null: false
      t.integer :category_id,      null: false
      t.integer :let_go_way_id,    null: false
      t.integer :let_go_reason_id, null: false
      t.integer :result_id,        null: false
      t.text    :comment
      t.references :user,          null: false, foreign_key: true

      t.timestamps
    end
  end
end
