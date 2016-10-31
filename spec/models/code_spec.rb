require 'rails_helper'

RSpec.describe Code, type: :model do
  describe "validations" do
    it 'requires title to be present' do
      c = build(:code, title: nil)
      c.valid?
      expect(c.errors).to have_key(:title)
    end
    
    it 'requires title to be unique' do
      create(:code, title: "ABC")
      c = build( :code, title: "ABC")
      c.valid?
      expect(c.errors).to have_key(:title)
    end
    
    it 'requires code to be present' do
      c = build(:code, title: 'Test', code: nil)
      c.valid?
      expect(c.errors).to have_key(:code)
    end
  end
end
