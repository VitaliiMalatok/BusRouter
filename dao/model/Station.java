package dao.model;

import java.util.List;

public class Station {

    private int id;
    private String name;
    private String city;
    private double latitude;
    private double longitude;
    private List<Bus> buses;

    public Station(){
    }

    public Station (String name, String city, double latitude, double longitude, List<Bus> buses) {
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

    public int getLatitude() {
        return latitude;
    }

    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    public int getLongitude() {
        return longitude;
    }

    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }

    public List<Bus> getBuses() {
        return buses;
    }

    public void setBuses(Object buses) {
        this.buses = buses;
    }

    @Override
    public String toString() {
        return "Station{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", city='" + city + '\'' +
                ", latitude=" + latitude +
                ", longitude=" + longitude +
                ", buses=" + buses +
                '}';
    }
}
