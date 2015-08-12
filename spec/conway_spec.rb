require 'conway'

describe Conway do

  before(:each) do
    @conway = Conway.new
  end

  describe "when initialized" do
    it "should have the correct field dimensions" do
      expect(@conway.grid.width).to eq 53
      expect(@conway.grid.heigth).to eq 7
    end
    it "should have only empty cells." do
      @conway.grid.each do |row|
        row.each do |cell|
          expect(cell.empty?)
        end
      end
    end
  end

  describe "when a game is started" do
    it "should have X cells that are alive" do
      # TODO add test condition
    end		
  end 
end

