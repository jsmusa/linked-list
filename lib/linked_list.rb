class LinkedList
  attr_reader :head, :tail
  def initialize
    @head = nil
    @tail = nil
  end

  def prepend(value)
    if @head == nil
      @head = Node.new(value)
      @tail = @head
    else
      # temp_node points to previous head
      temp_node = @head 
      @head = Node.new(value,temp_node)
    end
  end

  def append(value)
    if @head == nil
      @head = Node.new(value)
      @tail = @head
    else
      # temp_node points to current tail
      temp_node = @tail
      @tail = Node.new(value)
      # makes temp_node's next point to tail
      temp_node.next = @tail
    end
  end

  def each
    temp_node = @head
    count = 0

    until temp_node == nil
      yield temp_node, count

      temp_node = temp_node.next
      count += 1
    end
  end

  def size
    count = 0

    self.each {count = count + 1}
    
    count
  end

  def at(index)
    temp_node = @head
    count = 0

    until count == index || count > self.size - 1 
      temp_node = temp_node.next
      count += 1
    end

    temp_node
  end

  def pop
  if self.size <= 1
      temp_node = @head
      @head = nil
      @tail = nil
    else
    # last index = size, previous node to tail = size - 1
      @tail = self.at(self.size - 2)
      temp_node = @tail.next
      @tail.next = nil
    end

    temp_node
  end

  def contains?(value)
    self.each {|temp_node| return true if temp_node.value == value}

    false
  end

  def find(value)
    self.each {|temp_node, count| return count if temp_node.value == value}

    nil
  end

  def to_s
    string = ""

    self.each {|temp_node| string += "( #{temp_node.value} ) -> "}
    
    string + "nil"
  end

  def insert_at(value, index)
    if index > self.size
      return nil
    elsif index == self.size
      self.append(value)
    elsif index > 0
      previous_node = self.at(index - 1)
      next_node = self.at(index)
      inserted_node = Node.new(value, next_node)
      previous_node.next = inserted_node
    elsif index == 0
      self.prepend(value)
    end
  end

  def remove_at(index)
    if index > self.size
      return nil
    elsif index == self.size
      self.pop
    elsif index > 0
      previous_node = self.at(index - 1)
      next_node = self.at(index + 1)
      previous_node.next = next_node
    elsif index == 0
      @head = self.at(1)
    end
  end
end

class Node
  attr_reader :value
  attr_accessor :next

  def initialize(value = nil, next_node = nil)
    @value = value
    @next = next_node
  end
end
