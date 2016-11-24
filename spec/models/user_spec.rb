require "rails_helper"

RSpec.describe User, type: :model do
  it { is_expected.to have_many(:bucketlists) }
  it { is_expected.to have_many(:tokens) }

  it { is_expected.to validate_presence_of(:firstname) }
  it { is_expected.to validate_presence_of(:lastname) }

  it { is_expected.to validate_presence_of :password }
  it { is_expected.to have_secure_password }
  it { is_expected.to validate_length_of(:password).is_at_least(5) }

  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_uniqueness_of :email }
  it { is_expected.to_not allow_value("wrong@email@test.com").for(:email) }
end
