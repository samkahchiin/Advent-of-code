require 'byebug'
class File
  attr_accessor :contents

  def initialize file_name
    @contents = File.read(file_name).split("\n")
    @contents = @contents.sort_by(&:length)
  end
end

class BitConverter
  attr_accessor :data

  def initialize instructions
    @instructions = instructions
    @data = {}
  end

  def convert
    # will keep on looping until the instructions becoming an empty array
    while @instructions.count > 0
      @instructions.each do |instruction|
        success = process instruction
        @instructions.delete instruction if success
      end
    end
  end

  def process instruction
    instruction = instruction.split(' ')
    identifier = instruction[-1]
    length = instruction.length
    case length
    when 3
      # 123 -> x
      if instruction[0].is_integer?
        signal = instruction[0].to_i
        # if identifier == 'b'
        #   signal = 46065
        # end
      else
        signal = @data[instruction[0]]
      end
      # NOTE: alternative -> set it as a class variable and assign a integer signal to it
      # instance_variable_set("@#{instruction[-1]}",instructions[1].to_i)
    when 4
    # NOT x -> h
      num = @data[instruction[1]]
      if num
        bit = convert_to_bit num
        signal = bit.gsub!(/[10]/,'1' => '0', '0' => '1').to_i(2)
      end
    when 5
      operator = instruction[1]
      identifier = instruction[-1]
      val_one = process_data instruction[0]
      val_two = process_data instruction[2]
      case operator
      when 'AND'
        # x AND y -> d
        operator_symbol = '&'
      when 'OR'
        # x OR y -> e
        operator_symbol = '|'
      when 'LSHIFT'
        # x LSHIFT 2 -> f
        operator_symbol = '<<'
      when 'RSHIFT'
        # y RSHIFT 2 -> g
        operator_symbol = '>>'
      end

      signal = val_one.method(operator_symbol).(val_two).to_s(2).to_i(2) if val_one && val_two
    end

    @data[identifier] = signal if signal
  end

  def process_data data
    if data.is_integer?
      data.to_i
    else
      @data[data]
    end
  end

  def convert_to_bit num
    num = num.to_s(2)
    length = num.length
    if length != 16
      num = '0' * (16 - length) + num
    end
    num
  end
end

class String
  def is_integer?
    self.to_i.to_s == self
  end
end
