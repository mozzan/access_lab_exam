class CreateVoteRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :vote_records do |t|
      t.integer :vote_id, null: false
      t.integer :vote_token_id, null: false
      t.integer :vote_option_id, null: false
      t.timestamps
    end
    add_index :vote_records, :vote_id
    add_index :vote_records, :vote_token_id, unique: true
  end
end
