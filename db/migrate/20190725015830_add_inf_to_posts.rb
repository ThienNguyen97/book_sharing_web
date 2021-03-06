class AddInfToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :user_id, :integer
    add_column :posts, :book_name, :string
    add_column :posts, :title, :string
    add_column :posts, :subject, :string
    add_column :posts, :semester, :string
    add_index :posts, [:user_id, :created_at]
  end
end
