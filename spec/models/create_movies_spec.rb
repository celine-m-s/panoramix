require 'rails_helper'

RSpec.describe Movie, type: :model do 
  let(:movie) { build(:movie) }
  let(:empty_movie) { build(:movie, :empty) }

  context 'when no video link is provided' do
    it 'should not be valid' do
      expect(empty_movie).not_to be_valid
    end
  end

  context 'when content is provided' do
    it 'should be valid' do
      expect(movie).to be_valid
    end
  end
end