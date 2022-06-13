package com.solvd.laba.service.logic;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

public class Station {
    private String name;
    private String city;

    private Bus bus = null;
    private List<Bus> buses;

    private List<Station> shortestPath = new LinkedList<>();

    private Integer distance = Integer.MAX_VALUE;

    Map<Station, Integer> adjacentNodes = new HashMap<>();

    public Map<Station, Integer> getAdjacentNodes() {
        return adjacentNodes;
    }

    public void setAdjacentNodes(Map<Station, Integer> adjacentNodes) {
        this.adjacentNodes = adjacentNodes;
    }

    public void addDestination(Station destination, int distance) {
        adjacentNodes.put(destination, distance);
    }

    public Station(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Station> getShortestPath() {
        return shortestPath;
    }

    public void setShortestPath(List<Station> shortestPath) {
        this.shortestPath = shortestPath;
    }

    public Integer getDistance() {
        return distance;
    }

    public void setDistance(Integer distance) {
        this.distance = distance;
    }

    public List<Bus> getBuses() {
        return buses;
    }

    public void setBuses(List<Bus> buses) {
        this.buses = buses;
    }

    public Bus getBus() {
        return bus;
    }

    public void setBus(Bus bus) {
        this.bus = bus;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    @Override
    public String toString() {
        return "Station{" +
                "name='" + name + '\'' +
                '}';
    }
// getters and setters


}
