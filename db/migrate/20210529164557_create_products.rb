class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table "products", force: :cascade do |t|
      t.string   "name"
      t.decimal  "price",      default: 0.0
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.timestamps
    end
  end
end
