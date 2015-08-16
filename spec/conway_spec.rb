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
    it "should have only dead cells." do
      @conway.grid.each do |row|
        row.each do |cell|
          expect(cell.dead?)
        end
      end
    end
  end

  describe "when a game is started" do
    it "should have at least 50 cells that are alive" do
      @conway.start
      number_of_alive_cells = 0
      @conway.grid.each do |row|
        row.each do |cell|
          number_of_alive_cells += 1 if cell.alive?
        end
      end
      expect(number_of_alive_cells).to be >= 50
    end
  end
end

