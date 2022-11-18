require_relative "item.rb"

class List 

    def initialize(label)
        @label = label
        @items = []
    end

    def label
        @label
    end

    def label=(new_label)
        @label = new_label
    end

    def add_item(title, deadline, *description)
        if Item.valid_date?(deadline)
            @items << Item.new(title, deadline, description=nil)
            return true
        else
            return false
        end
    end

    def size
        @items.length
    end

    def valid_index?(index)
        index >= 0 && @items.length > index
    end

    def swap(index_1, index_2)
        if !self.valid_index?(index_2) ^ !self.valid_index?(index_1)
            return false
        else
            @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
            return true
        end
    end

    def [](index)
       if !self.valid_index?(index)
            return nil
       else
            return @items[index]
       end
    end

    def priority
        @items[0]
    end

end