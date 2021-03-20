class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.string :uid, null: false
      t.string :topic, null: false
      t.timestamps
    end
    add_index :votes, :uid, unique: true
  end
end
