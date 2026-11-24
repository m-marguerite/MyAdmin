class CreateDocuments < ActiveRecord::Migration[8.1]
  def change
    create_table :documents do |t|
      t.string :name
      t.boolean :checked
      t.references :checklist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
