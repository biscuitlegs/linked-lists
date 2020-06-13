class LinkedList
    def initialize(head=nil, tail=nil)
        @head = head
        @tail = tail
    end

    def append_value(node)
        if !@head
            @head = node 
            @tail = node
            return
        end

        @tail.next_node = node
        @tail = node
    end

    def prepend_value(node)
        node.next_node = @head
        @head = node
    end

    def size
        return 0 if !@head

        node_count = 1
        current_node = @head

        until !current_node.next_node
            node_count += 1
            current_node = current_node.next_node
        end

        node_count
    end

    def at(index)
        return nil if !@head

        current_index = 0
        current_node = @head

        until current_index == index
            current_node = current_node.next_node
            current_index += 1
        end

        current_node
    end

    def pop
        new_tail = self.at(self.size - 2)
        new_tail.next_node = nil
        @tail = new_tail
    end

    def contains?(value)
        (0..self.size - 1).each do |index|
            if self.at(index).value == value
                return true
            end
        end

        false
    end
    
    def find(value)
        (0..self.size - 1).each do |index|
            if self.at(index).value == value
                return index
            end
        end

        nil
    end

    def to_s
        (0..self.size - 1).each do |index|
            current_node = self.at(index)

            if !current_node.next_node
                print "( #{current_node.value} ) -> nil"
            else
                print "( #{current_node.value} ) -> "
            end
        end

        return ""
    end

    def insert_at(value, index)
        new_node = Node.new(value)

        if index == 0
            if @tail
                new_node.next_node = @head.next_node
                @head = new_node
            else
                @head = new_node
                @tail = new_node
            end

            return
        end

        if index == self.size - 1
            if @tail
                self.at(index - 1).next_node = new_node
                @tail = new_node
            else
                @head = new_node
                @tail = new_node

                return
            end
        end

        
        new_node.next_node = self.at(index + 1)
        self.at(index - 1).next_node = new_node
    end

    def delete_at(index)
        if index == 0
            @head = @head.next_node
            return
        end

        if index == self.size - 1
            @tail = self.at(self.size - 2)
            @tail.next_node = nil
            return
        end

        self.at(index - 1).next_node = self.at(index + 1)
    end
    
end

class Node
    attr_accessor :value, :next_node

    def initialize(value=nil, next_node=nil)
        @value = value
        @next_node = next_node
    end

end


my_list = LinkedList.new
my_list.append_value(Node.new(5))
my_list.append_value(Node.new(7))
my_list.append_value(Node.new(11))
my_list.prepend_value(Node.new(99))
my_list.prepend_value(Node.new(55))
my_list.insert_at(22, 3)
my_list.delete_at(3)
puts my_list