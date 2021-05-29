class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table "orders", force: :cascade do |t|
      t.string   "name"
      t.string   "email"
      t.text     "address"
      t.string   "pay_method"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.timestamps
    end
  end
end
