class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.belongs_to :list, foreign_key: true
      t.string :name
      t.boolean :top
      t.boolean :done

      t.timestamps
    end
  end
end
