# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AwnserProposal, type: :model do
  context '#awnser_message' do
    context 'create successfully' do
      it 'return message to apply job' do
        awnser_proposal = create(:awnser_proposal, awnser_message: 'Ola, me interessei pela vaga sim, pode me passar mais informações?')
        expect(awnser_proposal.awnser_message).to eq 'Ola, me interessei pela vaga sim, pode me passar mais informações?'
        expect(awnser_proposal).to be_valid
      end
     end
     context 'can be blank' do
       let(:awnser_proposal) { build(:awnser_proposal, awnser_message: '') }
       it 'and can not be valid' do
         expect(awnser_proposal).to be_valid
       end
     end
     context 'can not be bigger than 500 caracters' do
      let(:awnser_proposal) { build(:awnser_proposal, awnser_message: SecureRandom.base64(500)) }
      it 'and can not be valid' do
        expect(awnser_proposal).to_not be_valid
      end
    end
  end
end
