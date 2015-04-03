class Graph

    def initialize
        @vertices = Hash.new
    end

    def addVertex(vertex)
        unless @vertices.member? vertex
            @vertices[vertex] = Hash.new
        end
    end

end