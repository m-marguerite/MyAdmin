class CreateSteps < ActiveRecord::Migration[8.1]
  def change
    create_table :steps do |t|
      t.text :description
      t.boolean :checked
      t.references :checklist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
