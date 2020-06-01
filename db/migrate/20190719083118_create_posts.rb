class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :content

      t.integer :status, null: false, default: 1

      t.timestamps
    end
  end
end
