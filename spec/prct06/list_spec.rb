include Prct06::Bundler

RSpec.describe List do

	context "with empty list" do
		before(:each) do
			@l = List.new
		end

		it "should exists the methods to get head and tail and length" do
			expect(List.method_defined? :head).to eq true
			expect(List.method_defined? :tail).to eq true
			expect(List.method_defined? :length).to eq true
		end

		it "should have a length of 0" do
			expect(@l.length).to eq 0
		end

		it "should be able to add a node" do
			expect(@l.length).to eq 0
			@l.push(1)
			expect(@l.length).to eq 1
		end

		it "head and tail should be nil" do
			expect(@l.head == nil).to eq true
			expect(@l.tail == nil).to eq true
		end
	end


end