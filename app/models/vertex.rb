class Vertex

	def initialize key
        @adjacents = hash.new
        @degree = 0
        @key = key 
    end

    def degree
    	@degree
    end

    def key
    	@key
    end

    def connect vertex
    	@a.adjacents[vertex.key] = vertex
    	@degree++
    end

end