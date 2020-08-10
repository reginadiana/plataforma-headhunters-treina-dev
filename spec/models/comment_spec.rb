require 'rails_helper'

RSpec.describe Comment, type: :model do
  context '#message' do
    context 'create successfully' do
      it 'return message to apply job' do
        comment = create(:comment, content: 'Ola, gostei do seu perfil')
        expect(comment.content).to eq 'Ola, gostei do seu perfil'
        expect(comment).to be_valid
      end
    end
    context 'can not be blank' do
      let(:comment) { build(:comment, content: '') }
      it 'and can not be valid' do
        expect(comment).to_not be_valid
      end
    end
    context 'can not be bigger than 500 caracters' do
      let(:comment) { build(:comment, content: SecureRandom.base64(500)) }
      it 'and can not be valid' do
        expect(comment).to_not be_valid
      end
    end
  end
end
