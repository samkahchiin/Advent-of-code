require_relative 'solution_1'

describe 'File' do
  let(:expected_result) {
    ["turn on 877,32 through 978,815",
    "turn off 950,438 through 974,746",
    "toggle 426,30 through 609,917"]
  }

  it 'can return an array of instructions' do
    expect(File.new('test.txt').contents).to eq expected_result
  end
end

describe 'Light Controller' do
  let(:contents) {
    ["turn on 0,0 through 2,2",
    "turn off 0,0 through 1,1",
    "toggle 1,1 through 2,2"]
  }
  let!(:christmas_tree) { ChristmasTree.new(3) }
  let(:expected_result) {
    [
      [0,0,1],
      [0,1,0],
      [1,0,0]
    ]
  }
  let(:light_controller) { LightController.new contents, christmas_tree.grid }

  it 'can read the commands' do
    expect(light_controller.grid).to eq expected_result
  end

  it 'can calculate the lighted bulb' do
    expect(light_controller.calculate).to eq 3
  end
end

describe 'Christmas Tree' do
  let(:christmas_tree) { ChristmasTree.new 3 }
  let(:expected_result) {
    [
      [0,0,0],
      [0,0,0],
      [0,0,0]
    ]
  }

  it 'can create a grid based on the number entered' do
    # The warning 'block supersedes default value argument' is because of the default value
    # is set to 0 and therefore passing in an extra value
    expect(christmas_tree.grid).to eq expected_result
  end
end
