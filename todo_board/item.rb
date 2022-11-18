class Item

    def self.valid_date?(date_string)
        parts = date_string.split("-")
        a = !parts[0].length == 4
        b = parts[2].to_i < 1
        c = parts[2].to_i > 31
        d = parts[1].to_i < 1
        e = parts[1].to_i > 12
       return false if a || b || c || d || e
        true
    end

    def initialize(title, deadline, description)
        @title = title
        @description = description
        
        if Item.valid_date?(deadline)
            @deadline = deadline
        else
            raise RuntimeError.new("error due to invalid date")
        end
    end

    def title
        @title
    end

    def title=(new_title)
        @title = new_title
    end

    def deadline=(new_deadline)
        @deadline = new_deadline
    end

    def description
        @description
    end

    
end

# p Item.valid_date?('2019-10-25') # true
# p Item.valid_date?('1912-06-23') # true
# p Item.valid_date?('2018-13-20') # false
# p Item.valid_date?('2018-12-32') # false
# p Item.valid_date?('10-25-2019') # false

# Item.new('Fix login page', '2019-10-25', 'The page loads too slow.')

# Item.new(
#     'Buy Cheese',
#     '2019-10-21',
#     'We require American, Swiss, Feta, and Mozzarella cheese for the Happy hour!'
# )

# Item.new(
#     'Fix checkout page',
#     '10-25-2019',
#     'The font is too small.'
# ) # raises error due to invalid date