class CreateFeedbacks < ActiveRecord::Migration[5.2]
  def change
    create_table :feedbacks do |t|
      t.text :text,           null: false
      t.references :project,  foreign_key: true

      t.timestamps
    end
  end
end
