class CreateVoteTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :vote_tokens do |t|
      t.integer :vote_id, null: false
      t.string :token, null: false
      t.timestamps
    end

    add_index :vote_tokens, :vote_id
  end
end
