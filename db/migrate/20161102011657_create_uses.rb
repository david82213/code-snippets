class CreateUses < ActiveRecord::Migration[5.0]
  def change
    create_table :uses do |t|
      t.references :user, foreign_key: true, index: true
      t.references :language, foreign_key: true, index: true

      t.timestamps
    end
  end
end
