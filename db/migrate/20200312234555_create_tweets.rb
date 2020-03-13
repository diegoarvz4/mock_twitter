class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.integer :author_id, index: true
      t.text :content
      t.timestamps
    end
    add_foreign_key :tweets, :users, column: :author_id
  end
end
