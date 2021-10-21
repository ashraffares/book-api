class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :author, null: false
      t.string :category, null: false
      t.integer :pagesTotal, null: false
      t.integer :reading_percentage, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
