class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.belongs_to :post, forign_key: { on_delete: :nullify}
      t.string :photo

      t.timestamps
    end
  end
end
