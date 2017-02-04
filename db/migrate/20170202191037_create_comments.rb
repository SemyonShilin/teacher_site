class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.belongs_to :post, forign_key: { on_delete: :cascade}
      t.belongs_to :user, forign_key: { on_delete: :cascade}
      t.text :body

      t.timestamps
    end
  end
end
