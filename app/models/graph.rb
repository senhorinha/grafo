class Graph

    attr_reader :vertices

    def initialize
        @vertices = Hash.new
    end

    def has_vertex?(vertex)
        @vertices.member? vertex
    end

    def connected?(vertex, other_vertex)
        has_vertex?(vertex) && has_vertex?(other_vertex) && vertex.connected?(other_vertex)
    end

    def add_vertex(vertex)
        unless has_vertex? vertex
            @vertices[vertex] = 1
        end
    end

    def remove_vertex(vertex)
        if has_vertex? vertex
            @vertices.delete vertex
            @vertices.keys.each do |other_vertex|
                other_vertex.disconnect vertex
            end
        end
    end

    def connect(vertex, other_vertex)
        if has_vertex?(vertex) && has_vertex?(other_vertex)
            vertex.connect other_vertex
            other_vertex.connect vertex
        end
    end

    def disconnect(vertex, other_vertex)
        if connected?(vertex, other_vertex)
            vertex.disconnect other_vertex
            other_vertex.disconnect vertex
        end
    end

    def adjacents(vertex)
        vertex.adjacents
    end

    def random_vertex
        random = Random.new
        @vertices.keys[random.rand @vertices.length]
    end

    def transitive_closure_of(vertex)
        transitive_closure = [vertex];
        ignored_vertices = [];
        if has_vertex? vertex
            transitive_closure = recursive_transitive_closure(transitive_closure, ignored_vertices)
        end
        transitive_closure
    end

    def regular?
        first_vertex_degree = @vertices.keys.first.degree
        regular = true
        @vertices.each_value do |vertex|
            regular = false if first_vertex_degree != vertex.degree
        end
        regular
    end

    def complete?
        @vertices.keys.each do |vertex|
            aux = @vertices.keys
            aux.delete vertex
            aux.each do |other_vertex|
                unless vertex.connected? other_vertex
                    return false
                end
            end
        end
        true
    end

    private

    def recursive_transitive_closure(transitive_closure, ignored_vertices)
       transitive_closure.each do |vertex|
            unless ignored_vertices.include? vertex
                transitive_closure = transitive_closure | adjacents(vertex)
                ignored_vertices.push vertex
            end
        end
        if transitive_closure.length != ignored_vertices.length
            transitive_closure = transitive_closure | recursive_transitive_closure(transitive_closure, ignored_vertices)
        end
        transitive_closure
    end


end