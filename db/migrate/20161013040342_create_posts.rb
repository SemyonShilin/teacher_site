class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.integer :admin_user_id
      t.string :title
      t.text :content

      t.timestamps
    end

    # reversible do |dir|
    #   dir.up do
    #     Post.create_translation_table! title: :string, content: :text
    #     change_column_null :post_translations, :title, false
    #     add_foreign_key :post_translations, :posts, on_delete: :cascade
    #     add_index :post_translations, [:post_id, :locale], unique: true,
    #               name: 'index_unique_post_translations'
    #   end
    #
    #   dir.down do
    #     Post.drop_translation_table!
    #   end
    # end

    add_index :posts, [:admin_user_id, :created_at]
  end
end
