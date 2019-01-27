require "linked_list"
require "linked_list/node"

RSpec.describe LinkedList do
  let!(:linked_list) { LinkedList.new }
  let(:node_1) { LinkedList::Node.new("String1") }
  let(:node_2) { LinkedList::Node.new("String2") }
  let(:node_3) { LinkedList::Node.new("String3") }

  it "create new linked list" do
    expect(linked_list.head).to eq(nil)
  end

  describe "append!" do
    it 'appends a node to linked list' do
      expect(linked_list.append!(node_1).head).to eq(node_1)
    end

    it "appends a node to the end of the list" do
      linked_list.append!(node_1)
      expect(linked_list.append!(node_2).head).to eq(node_1)
      expect(linked_list.tail).to eq(node_2)
    end
  end

  describe "#find" do
    it "finds a node based on value" do
      linked_list.append!(node_1)
      linked_list.append!(node_2)
      linked_list.append!(node_3)
      expect(linked_list.find { |value| value == "String2" }).to eq(node_2)
    end

    it "returns nil if doesn't find a matching node" do
      linked_list.append!(node_1)
      expect(linked_list.find { |value| value == "String2" }).to eq(nil)
    end
  end

  describe "#delete!" do
    before do
      linked_list.append!(node_1)
      linked_list.append!(node_2)
      linked_list.append!(node_3)
    end

    it "deletes a node from the list" do
      linked_list.delete! { |value| value == "String2" }
      expect(linked_list.find { |value| value == "String2" }).to eq(nil)
    end
    
    it "deletes last node" do
      linked_list.delete! { |value| value == "String3" }
      expect(linked_list.find { |value| value == "String3" }).to eq(nil)
    end

    it "deletes first node" do
      linked_list.delete! { |value| value == "String1" }
      expect(linked_list.find { |value| value == "String1" }).to eq(nil)
    end

    it "deletes all nodes" do
      linked_list.delete! { |value| value == "String1" }
      expect(linked_list.head).to eq(node_2)
      linked_list.delete! { |value| value == "String2" }
      expect(linked_list.head).to eq(node_3)
      linked_list.delete! { |value| value == "String3" }
      expect(linked_list.head).to eq(nil)
    end
  end

  describe "#get_next!" do
    before do
      linked_list.append!(node_1)
      linked_list.append!(node_2)
      linked_list.append!(node_3)
    end

    it "retrieves next node and updates current node" do
      expect(linked_list.current).to eq(node_1)
      expect(linked_list.get_next!).to eq(node_2)
      expect(linked_list.current).to eq(node_2)
    end

    it "returns nil if current reaches the last node" do
      linked_list.get_next!
      linked_list.get_next!
      expect(linked_list.get_next!).to eq(nil)
      expect(linked_list.current).to eq(node_3)
    end
  end

  describe "#get_previous!" do
    before do
      linked_list.append!(node_1)
      linked_list.append!(node_2)
      linked_list.append!(node_3)
    end

    it "retrieves previous node and updates current node" do
      linked_list.get_next!
      linked_list.get_next!
      expect(linked_list.current).to eq(node_3)
      expect(linked_list.get_previous!).to eq(node_2)
      expect(linked_list.current).to eq(node_2)
    end

    it "returns nil if current reaches the first node" do
      expect(linked_list.get_previous!).to eq(nil)
      expect(linked_list.current).to eq(node_1)
    end
  end
end
