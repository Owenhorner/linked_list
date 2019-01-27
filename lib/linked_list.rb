class LinkedList
  attr_accessor :head, :current

  def initialize()
    @head = nil
    @current = nil
  end

  def append!(node)
    if(@head)
      node.previous = tail
      tail.next = node
    else
      @head = node
      @current = node
    end
    self
  end

  def find(&block)
    node = @head
    loop do
      if(node == nil || block.call(node.value))
        break
      else
        node = node.next 
      end
    end
    node
  end
  
  def delete!(&block)
    node = find(&block)
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

  def tail
    node = @head
    while(node.next != nil)
      node = node.next
    end
    node
  end

  def get_next!
    @current = @current.next unless @current.next.nil?
  end

  def get_previous!
    @current = @current.previous unless @current.previous.nil?
  end
end
