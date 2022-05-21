require 'rails_helper'

RSpec.describe Food, type: :model do
  before do
    @food = Food.new(name: 'Apple', measurement_unit: 20, price: 1, user_id: 1)
  end
  it 'name should not be null' do
    @food.name = nil
    expect(@food).to_not be_valid
  end

  it 'measurement unit should not be null' do
		@food.measurement_unit = nil
    expect(@food).to_not be_valid
  end

	it 'measurement unit should be greater than zero' do
		expect(@food.measurement_unit).to be >= 1
  end

	it 'price should not be null' do
		@food.price = nil
    expect(@food).to_not be_valid
  end

	it 'price should be greater than zero' do
		expect(@food.price).to be >= 1
  end
end
