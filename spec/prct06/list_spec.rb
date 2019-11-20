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

		it "should raise an exception when trying to get_at" do
			expect { @l.get_at 2 }.to raise_error(RuntimeError)
		end

		it "should have a length of 0" do
			expect(@l.length).to eq 0
		end

		it "should be able to add a node" do
			@l.push(1)

			expect(@l.length).to eq 1
		end

		it "head and tail should be nil" do
			expect(@l.head == nil).to eq true
			expect(@l.tail == nil).to eq true
		end

		it "should raise an error when trying to pop" do
			expect { @l.pop }.to raise_error(RuntimeError)
		end
	end

	context "with list of one element" do
		before(:each) do
			@l = List.new
			@l.push 1
		end

		it "should be able to retrieve the element using get_at 0" do
			expect(@l.get_at(0).value).to eq 1
		end

		it "should have a length of 1" do
			expect(@l.length).to eq 1
		end

		it "the node should have prev and next set to null" do
			expect(@l.head.prev).to be nil
			expect(@l.head.next).to be nil
		end

		it "should be able to add a node" do
			@l.push(2)

			# (1    ;    2)
			# (head ; tail)
			expect(@l.length).to eq 2

			expect(@l.head.value).to eq 1
			expect(@l.head.next.value).to eq 2

			expect(@l.tail.prev.value).to eq 1
			expect(@l.tail.value).to eq 2
			expect(@l.tail.next).to eq nil

			expect(@l.head.next).to eq @l.tail
			expect(@l.tail.prev).to eq @l.head
		end

		it "should be able to remove the node" do
			@l.pop

			expect(@l.length).to eq 0
			expect(@l.head).to eq nil
			expect(@l.tail).to eq nil
		end

		it "head and tail should be the only node in the list with value 1" do
			expect(@l.head.value).to eq 1
			expect(@l.tail.value).to eq 1
		end
	end

	context "with list of two element" do
		before(:each) do
			@l = List.new
			@l.push 1
			@l.push 2
		end

		it "should have a length of 2" do
			expect(@l.length).to eq 2
		end

		it "should be able to retrieve the elements using get_at X" do
			expect(@l.get_at(0).value).to eq 1
			expect(@l.get_at(1).value).to eq 2
		end

		it "the head should have prev set to null and next set to 2" do
			expect(@l.head.prev).to be nil
			expect(@l.head.next.value).to be 2
		end

		it "should be able to add a node" do
			@l.push(3)

			# (1    ;    2   ;     3)
			# (head ;        ; tail)
			expect(@l.length).to eq 3

			expect(@l.head.value).to eq 1
			expect(@l.head.next.value).to eq 2

			expect(@l.head.next.prev.value).to eq 1
			expect(@l.head.next.next.value).to eq 3

			expect(@l.tail.prev.value).to eq 2
			expect(@l.tail.value).to eq 3
			expect(@l.tail.next).to eq nil
		end

		it "should be able to remove the node" do
			@l.pop

			expect(@l.length).to eq 1
			expect(@l.head.value).to eq 1
			expect(@l.tail.value).to eq 1
			expect(@l.tail.next).to eq nil
		end

		it "head should have a value of 1 while tail should have a value of 2" do
			expect(@l.head.value).to eq 1
			expect(@l.tail.value).to eq 2
		end
	end

	context "with list of three element" do
		before(:each) do
			@l = List.new
			@l.push 1
			@l.push 2
			@l.push 3
		end

		it "should have a length of 3" do
			expect(@l.length).to eq 3
		end

		it "should be able to retrieve the elements using get_at X" do
			expect(@l.get_at(0).value).to eq 1
			expect(@l.get_at(1).value).to eq 2
			expect(@l.get_at(2).value).to eq 3
		end

		it "the head should have prev set to null and next set to 2 and tail set to 3" do
			expect(@l.head.prev).to be nil
			expect(@l.head.next.value).to be 2
			expect(@l.tail.value).to be 3
		end

		it "should be able to add a node" do
			@l.push(4)

			# (1    ;    2   ;     3;    4)
			# (head ;        ;      ; tail)
			expect(@l.length).to eq 4

			expect(@l.head.value).to eq 1
			expect(@l.head.next.value).to eq 2

			expect(@l.head.next.prev.value).to eq 1
			expect(@l.head.next.next.value).to eq 3

			expect(@l.tail.prev.value).to eq 3
			expect(@l.tail.value).to eq 4
			expect(@l.tail.next).to eq nil
		end

		it "should be able to remove the node" do
			@l.pop

			expect(@l.length).to eq 2
			expect(@l.head.value).to eq 1
			expect(@l.tail.value).to eq 2
			expect(@l.tail.next).to eq nil
		end

		it "head and tail should be the only node in the list with value 1" do
			expect(@l.head.value).to eq 1
			expect(@l.tail.value).to eq 3
		end
	end
end