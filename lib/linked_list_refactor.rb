require 'pry'
class Node

  attr_reader :data
  attr_accessor :next_node

  def initialize(data, next_node=nil)
    @data = data
    @next_node = next_node
  end
end

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
      count = 1
      while current.next_node
        count +=1
        current = current.next_node
        if current.next_node == nil
          return count
        end
      end
    end
  end

  def to_a
    collected = []
    if @head.nil?
      collected
    else
      current = @head
      while current.next_node
        collected << current.data
        current = current.next_node
      end
      collected << current.data
    end
  end

  def insert(index, data)
    current = @head
    next_node = current.next_node
    if index == 0
      current = Node.new(data)
    end
    while current.next_node
      if index(current.next_node.data) == index
        current.next_node = Node.new(data, next_node)
        break
      else
      current = current.next_node
      end
    end
  end

  def insert_after(data, to_insert)
    if @head.nil?
      nil
    else
      current = @head
      next_node = current.next_node
      until current.data == data
        current = current.next_node
      end
      current.next_node = Node.new(to_insert, current.next_node)
    end
  end

  def index(data)
    i = 0
    if @head.nil?
      nil
    else
      current = @head
      while current.data != data
        current = current.next_node
        i += 1
      end
      i
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
      current = @head
      while current.next_node
        if current.data == data
          true
        end
        current = current.next_node
      end
      false
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
      while current.next_node.next_node
        current = current.next_node
      end
      popped = current.next_node.data
      current.next_node = nil
      popped
    end
  end

  def delete(data)
    current = @head
    if current.data == data && current.next_node == nil
      @head = nil
    elsif current.data == data && current.next_node != nil
      @head = current.next_node
    else
      while current.next_node
        previous = current
        current = current.next_node
        if current.data == data && current.next_node == nil
          previous.next_node = nil
          return deleted = current
        end

        if current.data == data
          previous.next_node = current.next_node
        end
      end
    end
  end

end
