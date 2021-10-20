class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :category
      t.float :reading_percentage, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
