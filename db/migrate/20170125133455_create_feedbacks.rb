class CreateFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feedbacks do |t|
      t.belongs_to :user, index: true, foreign_key: { on_delete: :cascade }
      t.belongs_to :admin_user, index: true, foreign_key: { on_delete: :cascade }
      t.string :user_email
      t.string :subject
      t.text :body
      t.string :status, default: 'new'
      t.text :admin_message

      t.timestamps
    end
  end
end
