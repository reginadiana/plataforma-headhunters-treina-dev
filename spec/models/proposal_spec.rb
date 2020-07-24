require 'rails_helper'

RSpec.describe Proposal, type: :model do
  context '#successfully' do
    let(:proposal) { build(:proposal) }
    it 'and must be valid' do
      expect(proposal).to be_valid
    end
  end
end
