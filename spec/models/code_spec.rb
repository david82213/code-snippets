require 'rails_helper'

# this file is generated through the following command:
# rails g rspec:model code

RSpec.describe Code, type: :model do
  describe 'validations' do
    it 'requires a unique title' do
      FactoryGirl.create :code, title: 'testing'
      c = Code.new title: 'testing'
      
      c.valid?
      expect(c.errors).to have_key(:title)
    end

    it 'requires code' do
      c = Code.new
      c.valid?
      expect(c.errors).to have_key(:code)
    end
  end
end
