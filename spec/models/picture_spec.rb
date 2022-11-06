require 'rails_helper'

RSpec.describe Picture, type: :model do
  subject do
    @user = User.new(name: 'Roland', email: 'roland@gmail.com')
    @picture = Picture.new(title: 'Basketball', description: 'ARENA stadium for basketball', user: @user)
  end

  before { subject.save }

  it 'Picture Title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'Picture Description should be present' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it 'The Picture Should be associated to a user' do
    expect(subject).to respond_to(:user)
  end
end
