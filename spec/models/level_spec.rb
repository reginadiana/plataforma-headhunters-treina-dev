require 'rails_helper'

RSpec.describe Level, type: :model do
  context '#successfully' do
    let(:level) { build(:level) }
    it 'and must be valid' do
      expect(level).to be_valid
    end
  end
end
