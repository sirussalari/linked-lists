class LinkedList
    attr_reader :size, :head, :tail

    def initialize
        @size = 0
    end

    def append(val)
        new_node = Node.new(val)
        if @size == 0
            @head = new_node

        else
            if @tail
                @tail.next_node = new_node
                @tail = new_node

            else
                @tail = new_node
                @head.next_node = @tail
            end
        end

        @size += 1
    end

    def prepend(val)
        if @size == 0
            append(val)

        else
            @head = Node.new(val, @head)
            @size += 1
        end
    end

    def at(index)
        node = @head

        for i in 0...index
            node = node.next_node
            if !node
                return nil
            end
        end

        return node
    end

    def pop
        if @tail
            node = @head

            while node.next_node != @tail
                node = node.next_node
            end

            @tail = node
            @tail.next_node = nil
        
        else
            @head = nil
        end

        @size -= 1
    end

    def contains?(val)
        node = @head

        if node.value == val
            return true
        end

        while node
            if node.value == val
                return true
            end

            node = node.next_node
        end

        return false
    end

    def find(val)
        if contains?(val)
            index = 0
            while true

                if at(index).value == val
                    return index
                    
                else
                    index += 1
                end
            end
        end

        return nil
    end

    def to_s
        node = @head

        list = "#{node.value}"

        while node.next_node
            if node.next_node.value == nil
                list += " -> nil"

            else
                list += " -> #{node.next_node.value}"
            end

            node = node.next_node
        end

        list += " -> nil"

        return list
    end

    def insert_at(val, index)
        if at(index)
            shifted_node = at(index)
            pointer = at(index - 1)
            new_node = Node.new(val, shifted_node)
            pointer.next_node = new_node
            @size += 1

        elsif at(index - 1)
            append(val)
        
        else
            while !at(index - 1)
                new_node = Node.new
                append(new_node)
            end

            append(val)
        end
    end

    def remove_at(index)
        node = at(index)

        if index == 0
            @head = @head.next_node

        elsif node
            pointer = at(index - 1)
            pointing_at = at(index + 1)
            pointer.next_node = pointing_at
        end
    end
end

class Node
    attr_accessor :value, :next_node

    def initialize(value = nil, next_node = nil)
        @value = value
        @next_node = next_node
    end
end