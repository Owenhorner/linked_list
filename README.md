# LinkedList

A ruby implmentation of linked_list

## Installation

TODO: Add installation steps

## Usage

```
require 'linked_list'
require 'linked_list/node'

# Create a new linked list object
linked_list = LinkedList.new

# Create a Node and give it a value
node = LinkedList::Node.new("string value")

# Append a node to the linked_list object
linked_list.append(node)

# Find a node with a specific value in the linked list
linked_list.find("string value")

# insert a new node in a after a known item in the list
second_node = LinkedList::Node.new("lorem")
linked_list.insert_after(node.value, second_node)

# Delete a node from the linked list
linked_list.delete(second_node.value)

```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Owenhorner/linked_list.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
