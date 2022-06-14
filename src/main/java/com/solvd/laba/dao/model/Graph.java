package com.solvd.laba.dao.model;

import java.util.HashSet;
import java.util.LinkedList;
import java.util.Map.Entry;
import java.util.Set;

public class Graph {
    private Set<Station> stations = new HashSet<>();

    public void addNode(Station stationA) {
        stations.add(stationA);
    }

    public Set<Station> getStations() {
        return stations;
    }

    public void setStations(Set<Station> stations) {
        this.stations = stations;
    }

    public static Graph calculateShortestPathFromSource(Graph graph, Station source) {
        source.setDistance(0.0);

        Set<Station> settledStations = new HashSet<>();
        Set<Station> unsettledStations = new HashSet<>();

        unsettledStations.add(source);

        while (unsettledStations.size() != 0) {
            Station currentStation = getLowestDistanceNode(unsettledStations);
            unsettledStations.remove(currentStation);
            for (Entry<Station, Double> adjacencyPair:
                    currentStation.getAdjacentNodes().entrySet()) {
                Station adjacentStation = adjacencyPair.getKey();
                Double edgeWeight = adjacencyPair.getValue();
                if (!settledStations.contains(adjacentStation)) {
                    calculateMinimumDistance(adjacentStation, edgeWeight, currentStation);
                    unsettledStations.add(adjacentStation);
                }
            }
            settledStations.add(currentStation);
        }
        return graph;

    }
    private static void calculateMinimumDistance(Station evaluationStation, Double edgeWeigh, Station sourceStation) {
        Double sourceDistance = sourceStation.getDistance();
        if (sourceDistance + edgeWeigh < evaluationStation.getDistance()) {
            evaluationStation.setDistance(sourceDistance + edgeWeigh);
            LinkedList<Station> shortestPath = new LinkedList<>(sourceStation.getShortestPath());
            shortestPath.add(sourceStation);
            //shortestPath.add(evaluationStation);
            evaluationStation.setShortestPath(shortestPath);

        }
    }
    private static Station getLowestDistanceNode(Set<Station> unsettledStations) {
        Station lowestDistanceStation = null;
        Double lowestDistance = Double.MAX_VALUE;
        for (Station station : unsettledStations) {
            Double nodeDistance = station.getDistance();
            if (nodeDistance < lowestDistance) {
                lowestDistance = nodeDistance;
                lowestDistanceStation = station;
            }
        }
        return lowestDistanceStation;
    }

    public Set<Station> getNodes() {
        return stations;
    }

    public void setNodes(Set<Station> stations) {
        this.stations = stations;
    }

    @Override
    public String toString() {
        return "Graph{" +
                "nodes=" + stations +
                '}';
    }

}
