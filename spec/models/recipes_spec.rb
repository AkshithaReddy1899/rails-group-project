require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject do
    described_class.new(name: 'Recipe Name', preparation_time: '2 hours', cooking_time: '1 hour',
                        description: 'Recipe Description', public: false, user_id: 1)
  end
  before { subject.save }

  it 'Recipe name should not be null' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Recipe preparation time should not be null' do
    subject.preparation_time = nil
    expect(subject).to_not be_valid
  end

  it 'Recipe cooking time should not be null' do
    subject.cooking_time = nil
    expect(subject).to_not be_valid
  end

  it 'Recipe description should not be null' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it 'Recipe public should not be null' do
    subject.public = nil
    expect(subject).to_not be_valid
  end

  it 'Recipe user_id should not be null' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it 'Recipe name should not be too short' do
    subject.name = 'a'
    expect(subject).to_not be_valid
  end

  it 'Recipe name should be too long' do
    subject.name = 'a' * 51
    expect(subject).to_not be_valid
  end

  it 'Recipe description should not be more than 2000 characters' do
    subject.description = 'a' * 2001
    expect(subject).to_not be_valid
  end

  it 'Recipe public should only be true or false' do
    subject.public = 'a'
    expect(subject).to_not be_valid
  end
end
