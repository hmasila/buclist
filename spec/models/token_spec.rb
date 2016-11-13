require "rails_helper"

RSpec.describe Token, type: :model do
  it { is_expected.to validate_presence_of(:token) }
  it { is_expected.to validate_uniqueness_of(:token) }
  it { is_expected.to belong_to(:user) }
end
