require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_valid(:first_name).when('John', 'Sally') }
  it { should_not have_valid(:first_name).when(nil, '') }

  it { should have_valid(:last_name).when('Smith', 'Swansom') }
  it { should_not have_valid(:last_name).when(nil, '') }

  it { should have_valid(:email).when('user@example.com',
    'another@another.com') }
  it { should_not have_valid(:email).when(nil, '', 'ururu',
    'users@com', 'genie.com') }

  it 'has a matching passwords' do
    user = User.new
    user.password = 'password'
    user.password_confirmation = 'dsafsadfg'

    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to_not be_blank
  end
end
