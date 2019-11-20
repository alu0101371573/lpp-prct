include Prct06::Bundler

RSpec.describe List do
	context "with empty list" do
		it "should exists the methods to get head and tail" do
			expect(List.method_defined? :head).to eq true
			expect(List.method_defined? :tail).to eq true
		end
	end
end