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
    @head_node = @head
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

  # A note on using instance variables instead of their attr_readers, there is a
  # debate on this (https://forum.upcase.com/t/using-instance-variables-vs-attribute-accessors/1788)
  # In my solution i used @head as an instance variable, but referenced it in my code
  # as head (using the attr_reader) instead of @head.  Not the correct way, but be aware of both ways

  # Look into using your current implementations of index/insert here to save you some work
  # The idea is that if you have the index and the data, you already have a method that does all this:
  # Find the index of data
  # call insert(index + 1, to_insert) (index + 1 because you want to insert after that particular node, not before)
  def insert_after(data, to_insert)
    if @head.nil?
      nil
    else
      current = @head
      next_node = current.next_node
      until current.data == data
        current = current.next_node
      end
      current.next_node = Node.new(to_insert, next_node.next_node)
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

    if @head.data == data
      @head = @head.next_node
    end
      while current
        current = @head
        next_node = current.next_node

        if current.data == data
          current.next_node = next_node.next_node
        end
        current = current.next_node
      end
  end

end
