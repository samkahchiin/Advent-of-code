require_relative 'solution'
require 'byebug'

describe 'BitConverter' do
  let(:instructions) {
    ['123 -> x', 'NOT x -> h']
  }
  let(:bit_converter) { BitConverter.new(instructions) }

  it '#convert_to_bit' do
    expect(bit_converter.convert_to_bit(123)).to eq '0000000001111011'
    expect(bit_converter.convert_to_bit(456)).to eq '0000000111001000'
  end

  describe '#process' do
    describe 'return value' do
      it 'return vale if there are value return' do
        expect(bit_converter.process('123 -> x')).to eq 123
      end

      it 'return nil if no value return' do
        expect(bit_converter.process('a -> y')).to eq nil
      end
    end

    describe 'process the instructions' do
      it 'set the variables with the value' do
        bit_converter.process('123 -> x')
        expect(bit_converter.data).to eq({'x' => 123})
        bit_converter.process('x -> a')
        expect(bit_converter.data).to eq({'x' => 123, 'a' => 123})
      end

      it 'process NOT value' do
        bit_converter.process('123 -> x')
        bit_converter.process('NOT x -> h')
        expect(bit_converter.data).to eq({'x' => 123, 'h' => 65412})
      end

      it 'process AND' do
        bit_converter.process('123 -> x')
        bit_converter.process('456 -> y')
        bit_converter.process('x AND y -> d')
        expect(bit_converter.data).to eq({'x' => 123, 'y' => 456, 'd' => 72})
        bit_converter.process('123 AND y -> e')
        expect(bit_converter.data).to eq({'x' => 123, 'y' => 456, 'd' => 72, 'e' => 72})
      end

      it 'process OR' do
        bit_converter.process('123 -> x')
        bit_converter.process('456 -> y')
        bit_converter.process('x OR y -> d')
        expect(bit_converter.data).to eq({'x' => 123, 'y' => 456, 'd' => 507})
        bit_converter.process('x OR 456 -> e')
        expect(bit_converter.data).to eq({'x' => 123, 'y' => 456, 'd' => 507, 'e' => 507})
      end

      it 'process LSHIFT' do
        bit_converter.process('123 -> x')
        bit_converter.process('456 -> y')
        bit_converter.process('x LSHIFT 2 -> f')
        expect(bit_converter.data).to eq({'x' => 123, 'y' => 456, 'f' => 492})
      end

      it 'process RSHIFT' do
        bit_converter.process('123 -> x')
        bit_converter.process('456 -> y')
        bit_converter.process('y RSHIFT 2 -> g')
        expect(bit_converter.data).to eq({'x' => 123, 'y' => 456, 'g' => 114})
      end
    end
  end
end

describe 'String' do
  let(:integer) { '1' }
  let(:non_integer) { 'ab' }
  describe 'is_integer?' do
    it 'return true if the string is integer' do
      expect(integer.is_integer?).to eq true
    end

    it 'return false if the string is not an integer' do
      expect(non_integer.is_integer?).to eq false
    end
  end
end
