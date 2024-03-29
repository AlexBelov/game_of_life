class Game
  
  def initialize(width, height, seed_probability, steps)
    @width, @height, @steps = width, height, steps
    @cells = Array.new(height) { 
      Array.new(width) { Cell.new(seed_probability) } }
  end
  
  def play!
    (1..@steps).each do
      next!
      system('clear')
      puts self
    end
  end
  
  def next!
    @cells.each_with_index do |row, y|
      row.each_with_index do |cell, x|
        cell.neighbors = alive_neighbours(y, x)
      end
    end
    @cells.each { |row| row.each { |cell| cell.next! } }
  end
  
  def alive_neighbours(y, x)
    [[-1, 0], [1, 0], # sides
     [-1, 1], [0, 1], [1, 1], # over
     [-1, -1], [0, -1], [1, -1] # under
    ].inject(0) do |sum, pos|
      sum + @cells[(y + pos[0]) % @height][(x + pos[1]) % @width].to_i
    end
  end
  
  def to_s
    @cells.map { |row| row.join }.join("\n")
  end
end