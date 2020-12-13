class CreateAccountUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :account_users do |t|
      t.references :user, foreign_key: true
      t.references :account, foreign_key: true
      t.jsonb :roles, default: []

      t.timestamps
    end

    add_index :account_users, %i[user_id account_id], unique: true
  end
end
