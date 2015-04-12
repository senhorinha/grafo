class Vertex

    attr_reader :adjacents
    attr_reader :value

	def initialize value
        @value = value
        @adjacents = Hash.new
    end

    def degree
    	@adjacents.length
    end

    def connect vertex
    	@adjacents[vertex] = 1
    end

    def disconnect vertex
        @adjacents.delete vertex
    end

    def connected? vertex
        @adjacents.member? vertex
    end

    def adjacents
        @adjacents.keys
    end
end