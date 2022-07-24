class LinkedList
  attr_reader :head, :tail
  def initialize
    @head = nil
    @tail = nil
  end

  def prepend(value)
    case
    when !@head
      @head = Node.new(value)
    when !@head.next
      @tail = @head
      @head = Node.new(value, @tail)
    else
      # temp_node points to previous head
      temp_node = @head 
      @head = Node.new(value,temp_node)
    end
  end

  # def append(value)
  #   case
  #   when !@head
  #     @head = Node.new(value)
  #   when !@head.next
  #     @tail = 
  #     @head = Node.new(value, @tail)
  #   else
  #     # temp_node points to previous head
  #     temp_node = @head 
  #     @head = Node.new(value,temp_node)
  #   end
  # end
end

class Node
  attr_accessor :value, :next

  def initialize(value = nil, next_node = nil)
    @value = value
    @next = next_node
  end
end

my_list = LinkedList.new
my_list.prepend("hello")
my_list.prepend("world")
my_list.prepend("goodbye")
my_list.prepend("all")

puts
