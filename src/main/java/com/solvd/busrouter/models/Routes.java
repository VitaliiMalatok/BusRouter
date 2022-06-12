package com.solvd.busrouter.models;

public class Routes {
    private int id;
    private double distance;
    private Station station1;
    private Station station2;
    private Bus bus;

    public Routes() {
    }

    public Routes(int id, double distance, Station station1, Station station2, Bus bus) {
        this.id = id;
        this.distance = distance;
        this.station1 = station1;
        this.station2 = station2;
        this.bus = bus;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getDistance() {
        return distance;
    }

    public void setDistance(double distance) {
        this.distance = distance;
    }

    public Station getStation1() {
        return station1;
    }

    public void setStation1(Station station1) {
        this.station1 = station1;
    }

    public Station getStation2() {
        return station2;
    }

    public void setStation2(Station station2) {
        this.station2 = station2;
    }

    public Bus getBus() {
        return bus;
    }

    public void setBus(Bus bus) {
        this.bus = bus;
    }

    @Override
    public String toString() {
        return "Routes{" +
                "id=" + id +
                ", distance=" + distance +
                ", station1=" + station1 +
                ", station2=" + station2 +
                ", bus=" + bus +
                '}';
    }
}
