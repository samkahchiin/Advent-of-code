require_relative 'solution_2'

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
      [0,2,3],
      [1,3,3]
    ]
  }
  let(:light_controller) { LightController.new contents, christmas_tree.grid }

  it 'can read the commands' do
    expect(light_controller.grid).to eq expected_result
  end

  it 'can calculate the lighted bulb' do
    expect(light_controller.calculate).to eq 13
  end
end
