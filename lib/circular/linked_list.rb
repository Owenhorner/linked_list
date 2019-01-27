module Circular
  class LinkedList
    attr_accessor :current

    def initialize()
      @current = nil
    end

    def append!(node)
      if(@current)
        @current.previous.next = node
        node.previous = @current.previous
        
        @current.previous = node
        node.next = @current
      else
        node.previous = node
        node.next = node
        @current = node
      end
      self
    end

    def find(&block)
      node = @current.next
      loop do
        if(node == nil || block.call(node.value))
          break
        elsif(node == @current)
          node = nil
          break
        else
          node = node.next 
        end
      end
      node
    end

    def delete!(&block)
      node = find(&block)

      if(node != nil)
        if(node == @current)
          if(@current == @current.next) 
            @current = nil
            return
          else
            @current = @current.next
          end
        end
        next_node = node.next
        previous_node = node.previous

        next_node.previous = previous_node
        previous_node.next = next_node

        node = nil
      end
      self
    end

    def get_next!
      @current = @current.next
    end

    def get_previous!
      @current = @current.previous
    end
  end
end
