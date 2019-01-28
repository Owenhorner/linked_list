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
linked_list.append!(node)

# Find a node with a specific value in the linked list
linked_list.find { |value| value == "string value" }

# Delete a node from the linked list
linked_list.delete! { |value| value == "string value" }

# Retrieve next element in list, this modifies state to store next item in state
linked_list.get_next!

# Retrieve previous element in list, this modifies state to store previous item in state
linked_list.get_previous!

# Retrieve current item stored in state
linked_list.current
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Owenhorner/linked_list.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
