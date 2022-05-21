require 'rails_helper'

RSpec.describe Food, type: :model do
  subject do
    described_class.new(name: 'Apple', measurement_unit: 20, price: 1, user_id: 1)
  end
  before { subject.save }

  it 'Food name should not be null' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Food measurement unit should not be null' do
    subject.measurement_unit = nil
    expect(subject).to_not be_valid
  end
end
