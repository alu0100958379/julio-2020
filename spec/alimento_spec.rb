RSpec.describe Alimento do
	before(:all) do
		@chocolate = Alim.new("chocolate",20)
 	 	@cocacola = Alim.new("cocacola",50)
		@lista1 = List.new
		@lista1.push(@chocolate)
		@lista1.push(@cocacola)
	end

	context "Exista Alimento" do
		it "exista clase alimento" do
			expect(@chocolate.class).to eq(Alim)
		end

		it "sean comparables" do
			expect(@chocolate < @cocacola).to eq(true)
			expect(@chocolate > @cocacola).to eq(false)
			expect(@chocolate == @cocacola).to eq(false)
		end
	end

	context "Exista Lista" do
		it "exista la clase lista" do
			expect(@lista1.class).to eq(List)
		end

		it "sea enumerable" do
			expect(@lista1.collect{|x| x}).to eq([@cocacola, @chocolate])
			expect(@lista1.select{|x| x.energia < 40}).to eq([@chocolate])
			expect(@lista1.max).to eq(@cocacola)
			expect(@lista1.min).to eq(@chocolate)
			expect(@lista1.sort{|x,y| x <=> y}).to eq([@chocolate, @cocacola])
		end
	end

end
