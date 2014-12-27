require 'pry'

class Node

  attr_accessor :data, :pointer

  def initialize(data, pointer)
    @data = data
    @pointer = pointer
  end
end


class IterativeLinkedList

  attr_accessor :count, :head_node

  def initialize
    @head = nil
    @count = 0
    @head_node = @head
    @collected = []
  end

  def to_a
    if @head.nil?
      @collected
    else
      current = @head
      while current.pointer != nil
        @collected << current.data
        current = current.pointer
      end
      @collected << current.data
    end
  end

  def insert(index, data)
    @head = current
    nextNode = current.pointer
    while current.pointer != nil
      current = current.pointer
      @count += 1
    end
    count += 1
    if @count == index
      current.pointer = Node.new(data, nextNode.pointer)
    end
  end

  def insert_after(data, to_insert)
    if @head.nil?
      nil
    else
      current = @head
      nextNode = current.pointer
      until current.data == data
        current = current.pointer
      end
      current.pointer = Node.new(to_insert, nextNode.pointer)
    end
  end

  def index(data)
    @collected.index(data)
  end


  def next_node
    if @head.nil?
      nil
    else
      current = @head
      while current.pointer != nil
        next_node = current.pointer
      end
      nil
    end
  end

  def push(data)
    current = @head
    if @head.nil?
      @head = Node.new(data, nil)
      @count = 1
    else
      while current.pointer != nil
        current = current.pointer
      end
      current.pointer = Node.new(data, nil)
      @count += 1
    end
  end

  def last_node
    current = @head
    until current.pointer == nil
      current = current.pointer
    end
    last_node = current
  end

  def include?(data)
    if @head.data == data
      true
    else
      current = @head
      until current.data == data
        current = current.pointer
        true
      end
      false
    end
  end

  def find(data)
    if @head.data == data
      @head
    elsif @head.nil?
      nil
    else
      current = @head
      while current.data != data
        current = current.pointer
      end
      current
    end
  end

  def pop
    if @head.nil?
      nil
    else
     current = @head
     while current.pointer != nil
       previous = current
       current = current.pointer
     end
     if count == 1
       @head = nil
     else
       previous.pointer = nil
     end
     popped = current.data.to_s
     @count -= 1
     puts "'#{popped}' has been popped off!"
     return popped
   end
  end

  def delete(data)

    if @head.data == data
      @head = @head.pointer
      @count -= 1
    else
      current = @head.pointer
      prev_node = @head

    while current != nil
      if current.data == data
        prev_node.pointer = current.pointer
        deleted = current.data.to_s
        puts "#{deleted} has been deleted"
        @count -= 1
      else
        prev_node = prev_node.pointer
      end
      current = current.pointer
    end
    end
  end
end
