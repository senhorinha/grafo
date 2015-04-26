require 'set'

class Graph

    attr_reader :vertices

    def initialize
        @vertices = Hash.new
    end

    def has_vertex?(vertex)
        @vertices.member? vertex
    end

    def linked?(vertex, other_vertex)
        has_vertex?(vertex) && has_vertex?(other_vertex) && vertex.linked?(other_vertex)
    end

    def add_vertex(vertex)
        unless has_vertex? vertex
            @vertices[vertex] = vertex.adjacents
        end
    end

    def remove_vertex(vertex)
        if has_vertex? vertex
            @vertices.delete vertex
            @vertices.keys.each do |other_vertex|
                other_vertex.unlink vertex
            end
        end
    end

    def link(vertex, other_vertex)
        if has_vertex?(vertex) && has_vertex?(other_vertex)
            vertex.link other_vertex
            other_vertex.link vertex
        end
    end

    def unlink(vertex, other_vertex)
        if linked?(vertex, other_vertex)
            vertex.unlink other_vertex
            other_vertex.unlink vertex
        end
    end

    def adjacents(vertex)
        vertex.adjacents
    end

    def order 
        @vertices.length
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
        @vertices.each_key do |vertex|
            regular = false if first_vertex_degree != vertex.degree
        end
        regular
    end

    def complete?
        @vertices.keys.each do |vertex|
            aux = @vertices.keys
            aux.delete vertex
            aux.each do |other_vertex|
                unless vertex.linked? other_vertex
                    return false
                end
            end
        end
        true
    end

    def connected?
        vertex_reached = Set.new 
        @vertices.keys.each do |vertex|
            vertex.adjacents.each do |adjacent_vertex|
                vertex_reached.add(adjacent_vertex)
            end
        end
        (vertex_reached.size == @vertices.size)? true : false
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