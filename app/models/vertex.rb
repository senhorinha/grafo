class Vertex

    attr_accessor :adjacents

	def initialize
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