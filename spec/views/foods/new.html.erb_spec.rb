require 'rails_helper'

RSpec.describe 'Food', type: :system do
  user = User.create(name: 'Benjamin', email: 'benkis@gmail.com', password: '123456')

  subject do
    Food.new(name: 'Sugar', meadurement_unit: 'kg', price: 10, quantity: 1, user_id: user.id)
  end
  before { subject.save }

  describe 'index page' do
    it 'I can see the button.' do
      visit foods_index_path
      page.has_button?('Add Food')
    end
  end
end
