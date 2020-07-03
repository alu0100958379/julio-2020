RSpec.describe Alimento do
	before(:all) do
		@chocolate = Alim.new("chocolate",20,2)
 	 	@cocacola = Alim.new("cocacola",50,3)
		@leche = Alim.new("leche",10,10)

		@lista1 = List.new
		@lista1.push(@chocolate)
		@lista1.push(@cocacola)
		@gramos1 = [100,150]

		@lista2 = List.new
		@lista2.push(@leche)
		@lista2.push(@chocolate)
		@gramos2 = [200,120]

		@plato1 = Plato.new("guarradaMix", @lista1, @gramos1)
		
		@platohijo = PlatoHijo.new("mismoQuePlato1", @lista1, @gramos1)
		@platohijo2 = PlatoHijo.new("maximaGuarrada", @lista2, @gramos2)

		@menu1 = Array.new
		@menu1.push(@platohijo)
		@menu1.push(@platohijo2)

		@menu2 = Array.new
		@menu2.push(@platohijo)

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

	context "Existe Plato" do
		it "obtener nombre del plato" do
			expect(@plato1.name).to eq("guarradaMix")
		end

		it "existe un conjunto de alimentos" do
			expect(@plato1.al.collect{|x| x}).to eq([@cocacola, @chocolate])
		end

		it "existe un conjunto de gramos" do
			expect(@plato1.gr.collect{|x| x}).to eq([100,150])
		end

		it "valor calorico del conjunto de alimentos del plato" do
			expect(@plato1.valorCalorico).to eq(490)
		end
	end

	context "Jerarquia de clases" do
		it "existe la clase hija" do
			expect(@platohijo.class).to eq(PlatoHijo)
		end

		it "emisiones de gases" do
			expect(@platohijo.valorGases).to eq(5)
		end

# TODO:
		
#		it "plato hijo formateado" do
#			expect(@platohijo.to_s).to eq(@platohijo)
#		end
		
		it "comprobar clase, tipo y jerarquia" do
			expect(@platohijo.class).to eq(PlatoHijo)
			expect(@platohijo.kind_of? PlatoHijo).to eq(true)
#			expect(@platohijo.super).to eq(Plato)
		end

	end

	context "Platos Hijos comparables" do
		it "Comparables" do
			expect(@platohijo == @platohijo2).to eq(false)
			expect(@platohijo < @platohijo2).to eq(false)
		end

		it "Eficiencia energetica formateada" do
			expect(@platohijo.to_s).to eq("Eficiencia energética: 490")
		end 
	end

	context "Existe Menu" do
		it "existe un menu" do
			expect(@menu1.class).to eq(Array)
		end

		it "los menus son enumerables" do
			expect(@menu1.collect{|x| x.gr.collect{|y| y+1}}).to eq([[101, 151],[201, 121]])
			expect(@menu1.select{|x| x.valorCalorico < 260}).to eq([@platohijo2])
			expect(@menu1.max).to eq(@platohijo)
			expect(@menu1.min).to eq(@platohijo2)
			expect(@menu1.sort{|x,y| x <=> y}).to eq([@platohijo2,@platohijo])
		end
	end
end
