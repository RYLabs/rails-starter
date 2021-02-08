class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :name, null: false
      t.string :type
      t.string :slug, unique: true
      t.references :user, unique: true

      t.timestamps
    end
  end
end
