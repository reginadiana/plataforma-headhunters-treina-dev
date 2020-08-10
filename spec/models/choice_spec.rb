require 'rails_helper'

RSpec.describe Choice, type: :model do
  context '#successfully' do
    let(:choice) { build(:choice) }
    it 'and must be valid' do
      expect(choice).to be_valid
    end
  end
end
