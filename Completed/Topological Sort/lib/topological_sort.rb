require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  vertices_hash = {}
  queue = []

  vertices.each do |vertex|
    vertices_hash[vertex] = vertex.in_degree
    queue << vertex if vertex.in_degree.zero?
  end


  dependency = []

  until queue.empty?
    vertex = queue.shift

    # add vertex to queue, delete from hash
    dependency << vertex
    vertices_hash.delete(vertex)

    # for each of the vertex's out edges:
    # 1) decrement its in_degree
    # 2) add it to the queue if its in_degree is zero

    vertex.out_edges.each do |edge|
      node = edge.to_vertex
      vertices_hash[node] -= 1
      queue << node if vertices_hash[node].zero?
    end
  end

  vertices_hash.keys.empty? ? dependency : []
end
