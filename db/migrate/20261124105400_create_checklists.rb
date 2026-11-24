class CreateChecklists < ActiveRecord::Migration[8.1]
  def change
    create_table :checklists do |t|
      t.string :name
      t.text :description
      t.references :procedure, null: false, foreign_key: true

      t.timestamps
    end
  end
end
