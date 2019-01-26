class LinkedList
  attr_accessor :head

  def initialize()
    @head = nil
  end

  def append(node)
    if(@head)
      node.previous = tail
      tail.next = node
    else
      @head = node
    end
    self
  end

  def find(node_value)
    node = @head
    loop do
      if(node == nil || node_value == node.value)
        break
      else
        node = node.next 
      end
    end
    node
  end
  
  def delete(node_value)
    node = find(node_value)
    if(node.next)
      node.next.previous = node.previous
    end

    if(node.previous)
      node.previous.next = node.next
    else
      @head = node.next
    end
    node = nil
    self
  end

  def insert_after(node_value, new_node)
    previous_node      = find(node_value)
    next_node          = previous_node.next
    previous_node.next = new_node
    next_node.previous = new_node if next_node
    new_node.next      = next_node
    new_node.previous  = previous_node
    self
  end

  def tail
    node = @head
    while(node.next != nil)
      node = node.next
    end
    node
  end
end
