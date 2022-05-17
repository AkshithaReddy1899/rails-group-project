require 'rails_helper'

RSpec.describe User, type: :model do
    subject { described_class.new(name: 'User Name') }
    before { subject.save }

    it 'User name should not be null' do
        subject.name = nil
        expect(subject).to_not be_valid
    end

    it 'User name should not be too short' do
        subject.name = 'a' * 3
        expect(subject).to_not be_valid
    end

    it 'User name should not be more than 20 character' do
        subject.name = 'a' * 21
        expect(subject).to_not be_valid
    end
end