package com.solvd.laba.dao.model;

import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlAttribute;

import java.util.List;

@XmlAccessorType(XmlAccessType.FIELD)
public class Station {

    @XmlAttribute(name = "id")
    private int id;
    private String name;
    private String city;
    private double latitude;
    private double longitude;
    private List<Bus> buses;

    private Bus bus = null;

    public Bus getBus() {
        return bus;
    }

    public void setBus(Bus bus) {
        this.bus = bus;
    }

    public Station(){
    }

    public Station(String name, String city, double latitude, double longitude, List<Bus> buses) {
        this.name = name;
        this.city = city;
        this.latitude = latitude;
        this.longitude = longitude;
        this.buses = buses;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public double getLatitude() {
        return latitude;
    }

    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    public double getLongitude() {
        return longitude;
    }

    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }

    public List<Bus> getBuses() {
        return buses;
    }

    public void setBuses(List<Bus> buses) {
        this.buses = buses;
    }

    @Override
    public String toString() {
        return "Station " + "#" + id +
                ", name='" + name + '\'' +
                ", city='" + city + '\'' +
                ", buses=" + buses +
                '.';
    }
}
