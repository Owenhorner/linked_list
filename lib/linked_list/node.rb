class LinkedList::Node
  attr_accessor :next, :previous
  attr_reader :value

  def initialize(value)
    @value = value
    @next = nil
    @previous = nil
  end

  def to_s
    @value.to_s
  end
end
