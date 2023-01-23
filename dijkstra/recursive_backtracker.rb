class RecursiveBacktracker

  def self.on(grid, start_at: grid.random_cell)
    stack = [] 
    stack.push start_at  

    while stack.any? 
      current = stack.last 
      neighbors = current.neighbors.select { |n| n.links.empty? } 

      if neighbors.empty?
        stack.pop 
      else
        neighbor = neighbors.sample 
        current.link(neighbor) 
        stack.push(neighbor) 
      end
    end

    grid
  end

  def self.recursively_on(grid, start_at: grid.random_cell)
    walk_from(start_at)
    grid
  end

  def self.walk_from(cell) 
    cell.neighbors.shuffle.each do |neighbor| 
      if neighbor.links.empty? 
        cell.link(neighbor) 
        walk_from(neighbor) 
      end
    end
  end

end
