package com.solvd.laba.dao.model;

import java.util.*;

public class NewGraph {

    private final Map<Integer, List<Vertex>> vertices;

    public NewGraph() {
        this.vertices = new HashMap<>();
    }

    public void addVertex(int id, List<Vertex> vertex) {
        this.vertices.put(id, vertex);
    }

    public List<Integer> getShortestPath(Integer start, Integer finish) {
        final Map<Integer, Double> distances = new HashMap<>();
        final Map<Integer, Vertex> previous = new HashMap<>();
        PriorityQueue<Vertex> nodes = new PriorityQueue<>();
        for (Integer vertex : vertices.keySet()) {
            if (vertex == start) {
                distances.put(vertex, 0.0);
                nodes.add(new Vertex(vertex, 0.0));
            } else {
                distances.put(vertex, Double.MAX_VALUE);
                nodes.add(new Vertex(vertex, Double.MAX_VALUE));
            }
            previous.put(vertex, null);
        }
        while (!nodes.isEmpty()) {
            Vertex smallest = nodes.poll();
            if (smallest.getId() == finish) {
                final List<Integer> path = new ArrayList<>();
                while (previous.get(smallest.getId()) != null) {
                    path.add(smallest.getId());
                    smallest = previous.get(smallest.getId());
                }
                return path;
            }
            if (distances.get(smallest.getId()) == Double.MAX_VALUE) {
                break;
            }
            for (Vertex neighbor : vertices.get(smallest.getId())) {
                Double alt = distances.get(smallest.getId()) + neighbor.getDistance();
                if (alt < distances.get(neighbor.getId())) {
                    distances.put(neighbor.getId(), alt);
                    previous.put(neighbor.getId(), smallest);

                    for (Vertex n : nodes) {
                        if (n.getId() == neighbor.getId()) {
                            nodes.remove(n);
                            n.setDistance(alt);
                            nodes.add(n);
                            break;
                        }
                    }
                }
            }
        }
        return new ArrayList<>(distances.keySet());
    }
}
