class Vertex
  attr_reader :value
  attr_accessor :in_edges, :out_edges

  def initialize(value)

  end

  def in_degree
  end
end

class Edge
  attr_reader :from_vertex, :to_vertex, :cost

  def initialize(from_vertex, to_vertex, cost = 1)

  end

  def destroy!

  end

end