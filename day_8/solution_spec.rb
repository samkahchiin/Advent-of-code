require_relative 'solution'
require 'byebug'

describe 'Decoder' do
  it 'can detect empty string and return zero' do
    expect(Decoder.decode("")).to eq 0
    expect(Decoder.decode("abc")).to eq 3
    expect(Decoder.decode("aaa\"aaa")).to eq 7
    expect(Decoder.decode("\x27")).to eq 1
    expect(Decoder.decode("\\")).to eq 1
    expect(Decoder.decode("\\")).to eq 1
  end
end
