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

  describe "append" do
    it 'appends a node to linked list' do
      expect(linked_list.append(node_1).head).to eq(node_1)
    end

    it "appends a node to the end of the list" do
      linked_list.append(node_1)
      expect(linked_list.append(node_2).head).to eq(node_1)
      expect(linked_list.tail).to eq(node_2)
    end
  end

  describe "#find" do
    it "finds a node based on value" do
      linked_list.append(node_1)
      linked_list.append(node_2)
      linked_list.append(node_3)
      expect(linked_list.find(node_2.value)).to eq(node_2)
    end

    it "returns nil if doesn't find a matching node" do
      expect(linked_list.find(node_2.value)).to eq(nil)
    end
  end

  describe "#delete" do
    before do
      linked_list.append(node_1)
      linked_list.append(node_2)
      linked_list.append(node_3)
    end

    it "deletes a node from the list" do
      linked_list.delete(node_2.value)
      expect(linked_list.find(node_2.value)).to eq(nil)
    end
    
    it "deletes last node" do
      linked_list.delete(node_3.value)
      expect(linked_list.find(node_3.value)).to eq(nil)
    end

    it "deletes first node" do
      linked_list.delete(node_1.value)
      expect(linked_list.find(node_1.value)).to eq(nil)
    end

    it "deletes all nodes" do
      linked_list.delete(node_1.value)
      expect(linked_list.head).to eq(node_2)
      linked_list.delete(node_2.value)
      expect(linked_list.head).to eq(node_3)
      linked_list.delete(node_3.value)
      expect(linked_list.head).to eq(nil)
    end
  end
  
  describe "#insert_after" do
    let(:new_node) { LinkedList::Node.new("new node string") }

    before do
      linked_list.append(node_1)
      linked_list.append(node_2)
      linked_list.append(node_3)
    end

    it "inserts a new node after the node_1 and before node_2" do
      linked_list.insert_after(node_1.value, new_node)
      expect(linked_list.find(new_node.value).next).to eq(node_2)
      expect(linked_list.find(new_node.value).previous).to eq(node_1)
    end

    it "appends if last node on the list" do
      linked_list.insert_after(node_3.value, new_node)
      expect(linked_list.find(new_node.value).next).to eq(nil)
      expect(linked_list.find(new_node.value).previous).to eq(node_3)
      expect(linked_list.tail).to eq(new_node)
    end
  end
end
