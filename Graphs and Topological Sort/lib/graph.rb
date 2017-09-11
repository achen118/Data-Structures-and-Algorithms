class Vertex
  attr_reader :value
  attr_accessor :in_edges, :out_edges

  def initialize(value)
    @value = value
    @in_edges = []
    @out_edges = []
  end

end

class Edge
  attr_reader :cost
  attr_accessor :from_vertex, :to_vertex

  def initialize(from_vertex, to_vertex, cost = 1)
    @cost = cost

    @from_vertex = from_vertex
    @to_vertex = to_vertex

    @from_vertex.out_edges << self
    @to_vertex.in_edges << self
  end

  def destroy!
    
    @from_vertex, @to_vertex = nil, nil
  end
end
