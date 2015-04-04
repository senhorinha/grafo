class Vertex

	def initialize key
        @adjacents = Hash.new
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
    	@adjacents[vertex.key] = vertex
    	@degree += 1
    end

    def disconnect vertex
        @adjacents.delete vertex.key
    end

    def connected? vertex
        @adjacents.member? vertex.key
    end

    def adjacents 
        @adjacents
    end
end