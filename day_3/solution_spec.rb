require 'rspec'
require 'byebug'
require_relative 'solution'

describe 'GPS' do
  let(:santa) { Santa.new }
  let(:santa_gps) { GPS.new(santa, robot) }

  shared_examples_for '#draw_map' do
    it 'can draw map' do
      expect(santa_gps.draw_map).to eq Array.new(expected_y) { Array.new(expected_x, 0) }
    end
  end

  shared_examples_for 'initialize_with_correct_starting_point' do
    it 'return correct value' do
      expect(santa_gps.x_starting_point).to eq expected_x_starting_point
      expect(santa_gps.y_starting_point).to eq expected_y_starting_point
    end
  end

  before do
    santa.smallest_x_coord = -2
    santa.smallest_y_coord = -2
    santa.largest_x_coord = 2
    santa.largest_y_coord = 2
  end

  describe 'without robot' do
    let(:robot) { nil }
    let(:expected_x_starting_point) { 2 }
    let(:expected_y_starting_point) { 2 }
    let(:expected_x) { 5 }
    let(:expected_y) { 5 }

    it_behaves_like 'initialize_with_correct_starting_point'
    it_behaves_like '#draw_map'
  end

  describe 'with robot' do
    let(:robot) { Santa.new }
    let(:expected_x_starting_point) { 3 }
    let(:expected_y_starting_point) { 3 }
    let(:expected_x) { 6 }
    let(:expected_y) { 6 }

    before do
      robot.smallest_x_coord = -3
      robot.smallest_y_coord = -3
      robot.largest_x_coord = 2
      robot.largest_y_coord = 2
    end

    it_behaves_like 'initialize_with_correct_starting_point'
    it_behaves_like '#draw_map'
  end
end

describe 'Santa' do
  let(:santa) { Santa.new }
  let(:robot) { Santa.new }
  let(:map) {
    [[1,0,0,0],
     [0,0,0,0],
     [0,0,0,0],
     [0,0,0,0],
     [0,0,0,0]]
  }

  it 'initialize with the correct value' do
    expect(santa.x_coord).to eq 0
    expect(santa.y_coord).to eq 0
    expect(santa.largest_x_coord).to eq 0
    expect(santa.largest_y_coord).to eq 0
    expect(santa.smallest_x_coord).to eq 0
    expect(santa.smallest_y_coord).to eq 0
  end

  describe '#listen to radio' do
    before do
      santa.x_coord          = 0
      santa.y_coord          = 0
      santa.largest_x_coord  = 0
      santa.largest_y_coord  = 0
      santa.smallest_x_coord = 0
      santa.smallest_y_coord = 0
    end

    describe '#determine_distance' do
      it 'return correct distance' do
        santa.listen_to_radio '>', nil
        expect(santa.largest_x_coord).to eq 1
        santa.listen_to_radio 'v', nil
        expect(santa.largest_y_coord).to eq 1
        santa.listen_to_radio '<', nil
        santa.listen_to_radio '<', nil
        expect(santa.smallest_x_coord).to eq -1
        santa.listen_to_radio '^', nil
        santa.listen_to_radio '^', nil
        expect(santa.smallest_y_coord).to eq -1
      end
    end

    describe 'give_present' do
      it 'gives out present' do
        santa.go_back_home 0, 0
        santa.listen_to_radio '>', map
        expect(map[0][1]).to eq 1
        santa.listen_to_radio '<', map
        expect(map[0][0]).to eq 2
        santa.listen_to_radio 'v', map
        expect(map[1][0]).to eq 1
        santa.listen_to_radio '^', map
        expect(map[0][0]).to eq 3
      end
    end
  end

  # it '#go_back_home' do
  #   santa.go_back_home
  #   expect(santa.x_coord).to eq 0
  #   expect(santa.y_coord).to eq 0
  #   expect(santa.x_starting_point).to eq 0
  #   expect(santa.y_starting_point).to eq 0
  # end
end

describe 'Elf' do
  let(:file_content) { '<<>>' }
  let!(:elf) { Elf.new file_content }
  let(:santa) { Santa.new }
  let(:santa_gps) { GPS.new(santa)}
  let(:map) { santa_gps.draw_map }

  before do
    santa.smallest_x_coord = -2
    santa.smallest_y_coord = -2
    santa.largest_x_coord = 2
    santa.largest_y_coord = 2
  end

  it 'gives presents to the first house' do
    elf.give_first_present(map, santa_gps.y_starting_point, santa_gps.x_starting_point)
    expect(map[2][2]).to eq 2
  end

  describe 'count present' do
    before do
      map[1][1] = 3
      map[1][2] = 2
      map[1][3] = 5

      map[2][1] = 2
      map[2][3] = 2
      map[2][4] = 1

      map[3][1] = 2
    end
    it 'returns the correct value' do
      expect(elf.count_presents(map)).to eq '7 houses receive at least one present'
    end
  end
end

describe 'overall test' do

  shared_examples_for 'it_should_give_the_correct_final_answer' do
    let(:file_content) { '^v^v^v^v^v' }
    let!(:elf) { Elf.new file_content }
    let(:santa) { Santa.new }
    let(:map) { nil }

    before do
      elf.give_instructions map, santa, robot
      @santa_gps = GPS.new santa, robot
      @map = @santa_gps.draw_map
      santa.go_back_home @santa_gps.x_starting_point, @santa_gps.y_starting_point
      robot.go_back_home @santa_gps.x_starting_point, @santa_gps.y_starting_point if robot
      elf.give_first_present @map, @santa_gps.y_starting_point, @santa_gps.x_starting_point
      elf.give_instructions @map, santa, robot
    end

    it 'returns the correct final value' do
      expect(elf.count_presents @map).to eq expected_result
    end
  end

  describe 'without robot' do
    let(:robot) { nil }
    let(:expected_result) { "2 houses receive at least one present" }

    it_behaves_like 'it_should_give_the_correct_final_answer'
  end

  describe 'with robot' do
    let(:robot) { Santa.new }
    let(:expected_result) { "11 houses receive at least one present" }

    it_behaves_like 'it_should_give_the_correct_final_answer'
  end
end

# part_2 = 2631
# part_1 = 2572
