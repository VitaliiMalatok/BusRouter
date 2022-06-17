package com.solvd.laba.dao.model;

public class Vertex implements Comparable<Vertex> {

    private int id;
    private Double distance;

    public Vertex(int id, Double distance) {
        super();
        this.id = id;
        this.distance = distance;
    }

    public int getId() {
        return id;
    }

    public Double getDistance() {
        return distance;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setDistance(Double distance) {
        this.distance = distance;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Vertex vertex = (Vertex) o;

        if (getId() != vertex.getId()) return false;
        return getDistance().equals(vertex.getDistance());
    }

    @Override
    public int hashCode() {
        int result = getId();
        result = 31 * result + getDistance().hashCode();
        return result;
    }

    @Override
    public String toString() {
        return "Vertex [id=" + id + ", distance=" + distance + "]";
    }

    @Override
    public int compareTo(Vertex o) {
        if (this.distance < o.distance)
            return -1;
        else if (this.distance > o.distance)
            return 1;
        else
            return 0;
    }

}
