=begin

Instance method reverse
- [1, 2]
- [Element @datum = 1, @next = element2, Element @datum = 2, @next = nil]
- reverse
- [Element @datum = 2, @next = element1, Element @datum = 1, @next = nil]

- Step 1 = reverse linked list array
[Element @datum = 2, @next = nil, Element @datum = 1, @next = element2]

- Step 2 iterate through the linked list by index
- if its the last element in the linked list set @next to nil
- otherwise,
reasign next to the element at index + 1


=end

class Element
  attr_reader :datum
  attr_accessor :next

  def initialize(number, element= nil)
    @datum = number
    @next = element
  end

  def tail?
    return true if @next == nil
    false
  end
end

class SimpleLinkedList
  attr_reader :linked_list

  def initialize
    @linked_list = []
  end

  def size
    @linked_list.size
  end

  def empty?
    return true if @linked_list.empty?
    false
  end

  def push(num)
    if num == 1
      first_element = Element.new(num)
      @linked_list << first_element
    else
      @linked_list.prepend(Element.new(num, @linked_list.first))
    end
  end

  def head
    @linked_list.first
  end

  def peek
    return nil if @linked_list.empty?
    @linked_list.first.datum
  end

  def pop
    shifted_element = @linked_list.shift
    shifted_element.datum
  end

  def self.from_a(arr)
    return SimpleLinkedList.new if arr.nil? || arr.empty?
    list = SimpleLinkedList.new
    arr.reverse_each do |num|
      if arr.last == num
        list.linked_list << Element.new(num)
      else
        list.linked_list.prepend(Element.new(num, list.linked_list.first))
      end
    end
    list
  end

  def to_a
    result_array = []
    return result_array if @linked_list.empty?
    @linked_list.each do |el|
      result_array << el.datum
    end
    result_array
  end

  def reverse
    reversed_array = @linked_list.reverse
    reversed_array.each_with_index do |el, idx|
      if @linked_list.last == el
        el.next = nil
      else
        el.next = @linked_list[idx + 1]
      end
    end
  end
end