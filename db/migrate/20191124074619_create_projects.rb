class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string    :title,           null: false
      t.text      :content,         null: false
      t.integer   :goal_amount,     null: false
      t.date      :limit,           null: false

      t.timestamps
    end
  end
end
