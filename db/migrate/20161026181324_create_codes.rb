class CreateCodes < ActiveRecord::Migration[5.0]
  def change
    create_table :codes do |t|
      t.string :title
      t.text :code

      t.timestamps
    end
  end
end
