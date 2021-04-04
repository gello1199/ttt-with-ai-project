class Board

    attr_accessor :cells

    def initialize
        reset!
    end

    def reset!
        @cells = Array.new(9, " ")
    end

    def display
        puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
        puts "-----------"
        puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
        puts "-----------"
        puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
    end

    def position(input)
        self.cells[input.to_i - 1]
    end

    def full?
        self.cells.all? {|token| token == "X" || token == "O"}
    end

    #     def full?
#         self.cells.all? {|cell| cell != " " && cell != ""}
#     end

    def turn_count
        self.cells.count {|token| token == "X" || token == "O"}
    end

    def taken?(input)
        position(input) == "X" || position(input) == "O" ? true : false
    end

    def valid_move?(input)
        input = input.to_i
        input.between?(1, 9) && !taken?(input)
    end

    def update(input, player)
        self.cells[input.to_i - 1] = player.token
    end
  
end
