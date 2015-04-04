class Graph

    attr_accessor :vertices

    def initialize
        @vertices = Hash.new
    end

    def has_vertex?(vertex)
        @vertices.member? vertex
    end

    def add_vertex(vertex)
        unless has_vertex? vertex
            @vertices[vertex] = Hash.new
        end
    end

    def connect(from_vertex, to_vertex)
        if has_vertex?(from_vertex) && has_vertex?(to_vertex)
            @vertices[from_vertex][to_vertex] = 1;
        end
    end

    def connected?(from_vertex, to_vertex)
        has_vertex?(from_vertex) && has_vertex?(to_vertex) && @vertices[from_vertex].member?(to_vertex)
    end

end