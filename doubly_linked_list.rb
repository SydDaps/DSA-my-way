
class Node
  attr_accessor :data, :next, :prev

  def initialize(data)
    @data = data
    @next = nil
    @prev = nil
  end

end

class LinkedList
  attr_accessor :head, :tail

  def initialize()
    @size = 0
    @head = nil
    @tail = nil
  end

  def insert_at(position, data)

    if position > @size || position < 0
      puts "Invalid Position"
      return
    end

    #if position is == 0 then we are adding to head initial insert
    if position == 0

      if @head.nil?

        @head = Node.new(data)

      else

        old_head = @head
        @head = Node.new(data)
        @head.next = old_head
        old_head.prev = @head

      end

      @size += 1
      traverse
      return
    end

    #find the node at the position
    node_at_position = find_at(position)

    new_node = Node.new(data)

    #if there is no node at entered position
    #its either
    if node_at_position.nil?

      #The is no node next to head
      #set next node to tail
      if @head.next.nil?

        @tail = new_node
        @head.next = @tail
        @tail.prev = @head

      else
        # Appending to tail
        new_node.prev = @tail
        @tail.next = new_node
        @tail = new_node

      end

    else
      #first set the next and prev nodes of our new element
      new_node.next = node_at_position
      new_node.prev = node_at_position.prev

      #To complete the link
      #update the node_at_position's prev.next to the new_node
      #update the node_at_position's prev to our new_node
      node_at_position.prev.next = new_node
      node_at_position.prev = new_node

    end

    @size += 1
    traverse
  end

  def append(data)
    insert_at(@size, data)
  end

  def delete_at(position)
    node_at_position = find_at(position)

    previous_node = node_at_position.prev
    next_node = node_at_position.next

    previous_node.next = next_node
    next_node.prev = previous_node

    traverse
  end

  def find_at(position)

    node_at_position = @head
    (1..position).each do |position|
      node_at_position = node_at_position.next
    end

    node_at_position
  end


  def traverse
    stop = false

    node_at_position = @head

    print "* "
    until stop

      print " #{ node_at_position.data } < - >"

      node_at_position = node_at_position.next

      stop = true unless node_at_position
    end
    puts " * "
  end
end

ll = LinkedList.new
ll.insert_at(0,"head")

ll.insert_at(1,"first")

ll.insert_at(1,"second")

ll.append("third")

ll.insert_at(3,"last")

ll.insert_at(0,"head-2")

ll.insert_at(-1,"head-2")

