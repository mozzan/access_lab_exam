class CreateVoteOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :vote_options do |t|
      t.integer :vote_id, null: false
      t.string :option_uid, null: false
      t.string :name, null: false
      t.timestamps
    end

    add_index :vote_options, :vote_id
    add_index :vote_options, :option_uid, unique: true
  end
end
