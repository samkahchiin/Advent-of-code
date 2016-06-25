require 'rspec'
require 'byebug'
require_relative 'solution'

describe 'PasswordDigestor' do
  let(:password_digestor) { PasswordDigestor.new(5) }

  describe '#combine' do
    let(:secret_key) { 'abcdef' }
    let(:num) { 1 }

    it 'returns the secret key and number' do
      expect(password_digestor.combine(secret_key, num)).to eq 'abcdef1'
    end
  end

  describe '#digest' do
    it 'return the correct answer' do
      expect(password_digestor.digest('abcdef')).to eq 609043
      expect(password_digestor.digest('pqrstuv')).to eq 1048970
    end
  end

  describe '#fulfill condition' do
    it 'returns the correct value' do
      md5_hash = '00012345'
      expect(password_digestor.meet_condition(md5_hash,5)).to eq false
      md5_hash = '00000345'
      expect(password_digestor.meet_condition(md5_hash,5)).to eq true
      md5_hash = '000000345'
      expect(password_digestor.meet_condition(md5_hash,6)).to eq true
    end
  end
end

