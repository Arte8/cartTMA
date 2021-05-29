class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table "carts", force: :cascade do |t|
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
