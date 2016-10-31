require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:bucket_lists) }
  it { should have_many(:tokens) }

  it { should validate_presence_of(:firstname) }
  it { should validate_presence_of(:lastname) }

  it { should validate_presence_of :password }
  it { should have_secure_password }
  it { should validate_length_of(:password).is_at_least(5) }

  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }
  it { should_not allow_value('examp@le@test.com').for(:email) }
end
