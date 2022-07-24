class LinkedList
  attr_reader :head, :tail
  def initialize
    @head = nil
    @tail = nil
  end

  def prepend(value)
    if @head == nil
      @head = Node.new(value)
    elsif @head.next == nil
      @tail = @head
      @head = Node.new(value, @tail)
    else
      # temp_node points to previous head
      temp_node = @head 
      @head = Node.new(value,temp_node)
    end
  end

  def append(value)
    if @head == nil
      @head = Node.new(value)
    elsif @head.next == nil
      @tail = Node.new(value)
      @head.next = @tail
    else
      # temp_node points to previous tail
      temp_node = @tail
      @tail = Node.new(value)
      # makes temp_node's next point to tail
      temp_node.next = @tail
    end
  end

  def size
    temp_node = @head
    count = 0

    until temp_node == nil
      temp_node = temp_node.next
      count += 1
    end

    count
  end
end

class Node
  attr_accessor :value, :next

  def initialize(value = nil, next_node = nil)
    @value = value
    @next = next_node
  end
end

my_list = LinkedList.new

my_list.prepend("Dying")
my_list.prepend("Not")
my_list.prepend("Regret")

my_list.append("I")
my_list.append("Don't")
my_list.append("Do")
my_list.append("Regrets")

my_list.prepend("You")
my_list.prepend("Make")
my_list.prepend("I'll")

my_list.size

puts
