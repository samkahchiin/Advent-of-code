require 'rspec'
require 'byebug'
require_relative 'solution'

describe 'File' do

end

describe 'Helper' do
  let(:helper) { Helper.new('abc') }
  shared_examples_for 'is_three_vowels?' do
    it 'will return the correct results' do
      test_strings.each do |string|
        helper.string = string
        expect(helper.is_three_vowels?).to eq expected_result
      end
    end
  end

  describe '#is_three_vowels?' do
    describe 'when there are three vowels' do
      let(:test_strings) {['aei', 'xazegov', 'aeiouaeiouaeiou','eee']}
      let(:expected_result) { true }
      it_behaves_like 'is_three_vowels?'
    end

    describe 'when there are less than three vowels' do
      let(:test_strings) { ['ari', 'xazgov', 'hee'] }
      let(:expected_result) { false }
      it_behaves_like 'is_three_vowels?'
    end
  end

  describe '#has_repeat_letters?' do
    shared_examples_for 'has_repeat_letters?' do
      it 'will return the correct results' do
        test_strings.each do |string|
          helper.string = string
          expect(helper.has_repeat_letters?).to eq expected_result
        end
      end
    end

    describe 'when there are two letters appear in a row' do
      let(:test_strings) { ['xx', 'abcdde', 'aabbccdd'] }
      let(:expected_result) { true }
      it_behaves_like 'has_repeat_letters?'
    end

    describe 'when there are no two letters appear in a row' do
      let(:test_strings) { ['aba','dx', 'abcded', 'adbacbcd'] }
      let(:expected_result) { false }
      it_behaves_like 'has_repeat_letters?'
    end
  end

  describe '#has_illegal_substring?' do
    shared_examples_for 'has_illegal_substring?' do
      it 'will return the correct results' do
        test_strings.each do |string|
          helper.string = string
          expect(helper.has_illegal_substring?).to eq expected_result
        end
      end
    end

    describe 'when there are no illegal substring' do
      let(:test_strings) { ['afb', 'cad', 'pasdfq', 'xxxxby','adbc'] }
      let(:expected_result) { false }
      it_behaves_like 'has_illegal_substring?'
    end

    describe 'when there are no illegal substring' do
      let(:test_strings) { ['ab', 'cd', 'pq', 'xy','abc','cab','asdfgab'] }
      let(:expected_result) { true }
      it_behaves_like 'has_illegal_substring?'
    end
  end

  describe '#check_all' do
    it 'will return true if it fulfill all the conditions' do
      ['ugknbfddgicrmopn', 'aaa'].each do |string|
        helper.string = string
        expect(helper.string_is_nice?).to eq true
      end
    end

    it 'will return false if it didn\'t fulfill all the conditions' do
      ['jchzalrnumimnmhp', 'haegwjzuvuyypxyu', 'dvszwmarrgswjxmb'].each do |string|
        helper.string = string
        expect(helper.string_is_nice?).to eq false
      end
    end
  end

  describe '#calculate_nice_string' do
    let(:contents) { 'jchzalrnumimnmhp
                     haegwjzuvuyypxyu
                     dvszwmarrgswjxmb
                     ugknbfddgicrmopn
                     aaa' }
    let(:helper) { Helper.new(contents) }

    it 'returns the number of nice strings' do
      expect(helper.calculate_nice_string).to eq 2
    end
  end
end
