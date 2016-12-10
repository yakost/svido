class AddSenderAndReceiverToFeedbacks < ActiveRecord::Migration
  def change
    add_column :feedbacks, :sender_id, :integer, index: true, foreign_key: true
    add_column :feedbacks, :receiver_id, :integer, index: true, foreign_key: true
  end
end
