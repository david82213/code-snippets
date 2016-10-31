require 'rails_helper'

RSpec.describe Language, type: :model do
  describe 'validations' do
    it 'requires unique names for languages' do
      FactoryGirl.create :language, name: 'Python'
      c = Language.new name: 'Python'

      c.valid?
      expect(c.errors).to have_key(:name)
    end
  end
end
