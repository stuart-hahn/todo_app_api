class CreateTodos < ActiveRecord::Migration[7.2]
  def change
    create_table :todos do |t|
      t.string :content
      t.date :date

      t.timestamps
    end
  end
end
