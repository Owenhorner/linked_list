require "circular/linked_list"
require "linked_list/node"

RSpec.describe ::Circular::LinkedList do
  let!(:linked_list) { Circular::LinkedList.new }
  let(:node_1) { LinkedList::Node.new("String1") }
  let(:node_2) { LinkedList::Node.new("String2") }
  let(:node_3) { LinkedList::Node.new("String3") }

  it "create new linked list" do
    expect(linked_list.current).to eq(nil)
  end

  describe "append" do
    it 'appends a node to linked list' do
      expect(linked_list.append(node_1).current).to eq(node_1)
    end

    it "appends a node to the current item in the list" do
      linked_list.append(node_1)
      expect(linked_list.append(node_2).current).to eq(node_1)
      expect(linked_list.current.previous).to eq(node_2)
      expect(linked_list.current.next).to eq(node_2)
    end
    
    it "appends two nodes to the current item in the list" do
      linked_list.append(node_1)
      linked_list.append(node_2)
      linked_list.append(node_3)
      expect(linked_list.current.next).to eq(node_2)
      expect(linked_list.current.previous).to eq(node_3)
    end
  end

  describe "#find" do
    it "finds a node based on value" do
      linked_list.append(node_1)
      linked_list.append(node_2)
      linked_list.append(node_3)
      expect(linked_list.find { |value| value == "String2" }).to eq(node_2)
    end

    it "returns nil if doesn't find a matching node" do
      linked_list.append(node_1)
      linked_list.append(node_3)
      expect(linked_list.find { |value| value == "String2" }).to eq(nil)
    end
  end
  
  describe "#delete" do
    before do
      linked_list.append(node_1)
      linked_list.append(node_2)
      linked_list.append(node_3)
    end

    it "deletes a node from the list" do
      linked_list.delete { |value| value == "String2" }
      expect(linked_list.find { |value| value == "String2" }).to eq(nil)
    end

    it "does nothing if value does not exist in the list" do
      expect { linked_list.delete { |value| value == "Bling Blong" } }.to_not change { linked_list }
    end

    it "deletes all nodes" do
      linked_list.delete { |value| value == "String1" }
      expect(linked_list.current).to eq(node_2)
      linked_list.delete { |value| value == "String2" }
      expect(linked_list.current).to eq(node_3)
      linked_list.delete { |value| value == "String3" }
      expect(linked_list.current).to eq(nil)
    end
  end
end
