class AddLanguageToCodes < ActiveRecord::Migration[5.0]
  def change
    add_reference :codes, :language, foreign_key: true
  end
end
