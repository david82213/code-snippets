require 'rails_helper'

RSpec.describe Language, type: :model do
  describe "validation" do
    it 'requires a unique language name' do
      create(:language, name: 'Ruby')
      l = build(:language, name: 'Ruby')
      l.valid?
      expect(l.errors).to have_key(:name)
    end
  end
end
