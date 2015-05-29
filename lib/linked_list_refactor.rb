require_relative 'node.rb'

class IterativeLinkedList

  attr_reader :head_node

  def initialize
    @head = nil
  end

  def head_node
    @head
  end

  def count
    current = @head
    if current.nil?
      count = 0
    elsif current.next_node.nil?
      count = 1
    else
      count_till_final_node(current)
    end
  end

  def to_a
    collected = []
    if @head.nil?
      collected
    else
      shovel_nodes(collected)
    end
  end

  def insert(index, data)
    current = @head
    next_node = current.next_node
    if index == 0
      current = Node.new(data)
    end
    while next_node
      if index(next_node.data) == index
        current.next_node = Node.new(data, next_node)
        break
      else
        current = next_node
      end
    end
  end

  def insert_after(data, to_insert)
    if @head.nil?
      nil
    else
      find_index_to_insert_after(data, to_insert)
    end
  end

  def index(data)
    if @head.nil?
      nil
    else
      find_index(data)
    end
  end

  def push(data)
    node = Node.new(data)
    if @head.nil?
      @head = node
    else
      last_node.next_node = node
    end
  end

  def last_node
    current = @head
    until current.next_node.nil?
      current = current.next_node
    end
    current
  end

  def include?(data)
    if @head.data == data
      true
    else
      found?(data)
    end
  end

  def find(data)
    if @head.nil?
      nil
    else
      current = @head
      while current.data != data
        current = current.next_node
      end
      current
    end
  end

  def pop
    current = @head
    if @head.nil?
      nil
    elsif current.next_node.nil?
      popped = current.data
      @head = nil
      popped
    else
      remove_final_node(current)
    end
  end

  def delete(data)
    current = @head
    if current.data == data && current.next_node == nil
      @head = nil
    elsif current.data == data && current.next_node != nil
      @head = current.next_node
    else
      find_node_to_delete(current, data)
    end
  end

  private

  def is_last_node?(current)
    current.next_node == nil
  end

  def count_till_final_node(current)
    count = 1
    while current.next_node
      count +=1
      current = current.next_node
      if is_last_node?(current)
        return count
      end
    end
  end

  def shovel_nodes(collected)
    current = @head
    while current.next_node
      collected << current.data
      current = current.next_node
    end
    collected << current.data
  end

  def find_index_to_insert_after(data, to_insert)
    current = @head
    next_node = current.next_node
    until current.data == data
      current = next_node
    end
    current.next_node = Node.new(to_insert, next_node)
  end

  def find_index(data)
    i = 0
    current = @head
    while current.data != data
      current = current.next_node
      i += 1
    end
    i
  end

  def found?(data)
    current = @head
    while current.next_node
      if current.data == data
        true
      end
      current = current.next_node
    end
    false
  end

  def remove_final_node(current)
    while current.next_node.next_node
      current = current.next_node
    end
    popped = current.next_node.data
    current.next_node = nil
    popped
  end

  def find_node_to_delete(current,data)
    while current.next_node
      previous = current
      current = current.next_node
      if current.data == data && current.next_node == nil
        previous.next_node = nil
        return current
      end

      if current.data == data
        previous.next_node = current.next_node
      end
    end
  end

end
