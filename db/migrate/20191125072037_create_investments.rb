class CreateInvestments < ActiveRecord::Migration[5.2]
  def change
    create_table :investments do |t|
      t.integer :investment_amount,   null: false
      t.references :user,              foreign_key: true
      t.references :project,           foreign_key: true

      t.timestamps
    end
  end
end
