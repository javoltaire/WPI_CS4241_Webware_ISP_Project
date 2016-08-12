class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.string :title
      t.text :content
      t.boolean :is_user_note
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end