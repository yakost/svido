class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :user_name
      t.integer :sender_id, index: true, foreign_key: true
      t.integer :receiver_id, index: true, foreign_key: true
      t.string :email
      t.text :body

      t.timestamps null: false
    end
  end
end
