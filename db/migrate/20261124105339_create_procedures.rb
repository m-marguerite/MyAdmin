class CreateProcedures < ActiveRecord::Migration[8.1]
  def change
    create_table :procedures do |t|
      t.string :name
      t.text :system_prompt
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
