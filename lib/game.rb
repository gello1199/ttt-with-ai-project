class Game
    attr_accessor :board, :player_1, :player_2

    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
    end

    def current_player
        @board.turn_count % 2 == 0 ? player_1 : player_2
        # @board.turn_count.odd? ? player_2 : player_1
    end

    def won?
        WIN_COMBINATIONS.detect do |win_combo|
           if @board.cells[win_combo[0]] == "X" && @board.cells[win_combo[1]] == "X" && @board.cells[win_combo[2]] == "X"
            win_combo
           elsif @board.cells[win_combo[0]] == "O" && @board.cells[win_combo[1]] == "O" && @board.cells[win_combo[2]] == "O"
            win_combo
           end
        end
    end

    def draw?
        @board.full? && !won?
    end

    def over?
        won? || draw? ? true : false
    end

    def winner #need explanation
            if won?
            win_combo = won?
            @board.cells[win_combo[0]]
            end
    end

    def turn
            puts "Please enter a value between 1-9:"
            index = current_player.move(@board)
            if @board.valid_move?(index)
            @board.update(index, current_player)
            else puts "Please enter a number 1-9:"
            @board.display
            turn
            end
            @board.display
    end

    def play
        until over? == true
            turn
        end

        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
    end

end