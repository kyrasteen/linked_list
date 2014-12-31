require 'minitest/autorun'
require 'minitest/pride'
require './linked_list_refactor'

class IterativeLinkedListTest < Minitest::Test
  attr_reader :list

  def setup
    @list = IterativeLinkedList.new
  end

  def test_it_starts_with_zero_elements
    assert_equal 0, list.count
  end

  def test_it_pushes_one_element_to_list
    list.push("hello")
    assert_equal 1, list.count
  end

  def test_it_pushes_three_elements_onto_a_list
    list.push("hello")
    list.push("world")
    list.push("today")
    assert_equal 3, list.count
  end

  def test_it_pops_the_last_element_from_the_list
    list.push("hello")
    list.push("world")
    list.push("today")
    output = list.pop
    assert_equal "today", output
    assert_equal 2, list.count
  end

  def test_a_popped_element_is_removed
    list.push("hello")
    output = list.pop
    assert_equal "hello", output
    assert_equal 0, list.count
  end

  def test_it_pops_nil_when_there_are_no_elements
    assert_nil list.pop
  end

  # def test_it_deletes_a_solo_node
  #   list.push("hello")
  #   list.delete("hello")
  #   assert_equal 0, list.count
  # end
  #
  # def test_it_does_not_delete_when_the_data_does_not_match
  #   list.push("hello")
  #   list.push("world")
  #   list.delete("today")
  #   assert_equal 2, list.count
  # end
  #
  # def test_it_deletes_a_last_node
  #   list.push("hello")
  #   list.push("world")
  #   list.push("today")
  #   list.delete("today")
  #   assert_equal 2, list.count
  # end
  #
  # def test_it_deletes_a_first_node
  #   list.push("hello")
  #   list.push("world")
  #   list.push("today")
  #   list.delete("hello")
  #   assert_equal 2, list.count
  # end
  #
  # def test_it_deletes_a_middle_node
  #   list.push("hello")
  #   list.push("world")
  #   list.push("today")
  #   list.delete("world")
  #   assert_equal 2, list.count
  #   assert_equal "today", list.pop
  #   assert_equal "hello", list.pop
  # end
  #
  # def test_it_deletes_the_head_when_there_are_more_nodes
  #   list.push("hello")
  #   list.push("world")
  #   list.push("today")
  #   list.delete("hello")
  #   assert_equal 2, list.count
  #   assert_equal "today", list.pop
  #   assert_equal "world", list.pop
  # end
  #
  # def test_it_converts_to_an_array_when_there_are_no_elements
  #   assert_equal [], list.to_a
  # end
  #
  # def test_it_converts_to_an_array_with_several_elements
  #   list.push("hello")
  #   list.push("world")
  #   list.push("today")
  #   assert_equal ["hello", "world", "today"], list.to_a
  # end
  #
  # def test_it_finds_the_last_node
  #   list.push("hello")
  #   list.push("world")
  #   node = list.last_node
  #   assert_equal "world", node.data
  # end
  #
  # def test_a_node_links_to_its_next_element
  #   list.push("hello")
  #   list.push("world")
  #   assert_equal "world", list.last_node.data
  #   assert_equal "world", list.head_node.next_node.data
  # end
  #
  # def test_next_node_for_the_last_node_is_nil
  #   list.push("world")
  #   assert_nil list.last_node.next_node
  # end
  #
  # def test_find_if_an_element_is_included_in_the_list
  #   list.push("hello")
  #   list.push("world")
  #   assert_equal true, list.include?("hello")
  #   assert_equal false, list.include?("bogus")
  # end
  #
  # def test_find_a_given_node
  #   list.push("hello")
  #   list.push("world")
  #   list.push("today")
  #
  #   assert_equal "world", list.find("world").data
  #   assert_equal "today", list.find("world").next_node.data
  # end
  #
  # def test_inserts_node_at_arbitrary_position
  #   list.push("hello")
  #   list.push("world")
  #   list.push("today")
  #
  #   list.insert(1, "pizza")
  #
  #   assert_equal 1, list.index("pizza")
  #   assert_equal ["hello", "pizza", "world", "today"], list.to_a
  # end
  #
  # def test_inserted_node_is_next_node_for_previous_node
  #   list.push("hello")
  #   list.push("world")
  #   list.push("today")
  #
  #   list.insert(1, "pizza")
  #
  #   assert_equal "world", list.find("pizza").next_node.data
  #   assert_equal "pizza", list.find("hello").next_node.data
  # end
  #
  # def test_insert_after_adds_a_node_after_a_given_node
  #   list.push("hello")
  #   list.push("world")
  #   list.push("today")
  #
  #   list.insert_after("hello", "pizza")
  #   puts list.index('hello')
  #   assert_equal "world", list.find("pizza").next_node.data
  #   assert_equal "pizza", list.find("hello").next_node.data
  # end
end
