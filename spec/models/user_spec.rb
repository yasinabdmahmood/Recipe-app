require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom') }
  before { subject.save }
  it 'Name must not be blank' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
