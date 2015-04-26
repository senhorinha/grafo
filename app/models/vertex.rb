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

    def link vertex
    	@adjacents[vertex] = 1
    end

    def unlink vertex
        @adjacents.delete vertex
    end

    def linked? vertex
        @adjacents.member? vertex
    end

    def adjacents
        @adjacents.keys
    end
end