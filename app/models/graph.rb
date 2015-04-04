class Graph

    attr_accessor :vertices

    def initialize
        @vertices = Hash.new
    end

    def addVertex(vertex)
        unless @vertices.member? vertex
            @vertices[vertex] = Hash.new
        end
    end

end