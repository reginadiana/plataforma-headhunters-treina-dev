# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Headhunter, type: :model do

	context '#successfully' do
		let(:headhunter) { build(:headhunter, email: 'diana@gmail.com', password: 'senha123')}

		it 'and must be valid' do
			expect(headhunter).to be_valid
		end
	end

	context 'can not be blank' do
		context '#email' do
			let(:headhunter) { build(:headhunter, email: '')}

			it 'and can not be valid' do
				expect(headhunter).to_not be_valid
			end
		end

		context '#password' do
			let(:headhunter) { build(:headhunter, password: '')}

			it 'and can not be valid' do
				expect(headhunter).to_not be_valid
			end
		end
	end
end
