package dao.model;

public class Route {
    private int id;
    private double distance;
    private Station stationStart;
    private Station stationFinish;

    public Route(){
    }

    public Route (int id, double distance, Station stationStart, double stationFinish) {
        this.id = id;
        this.distance = distance;
        this.stationStart = stationStart;
        this.stationFinish = stationFinish;
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

    public String getStationStart() {
        return stationStart;
    }

    public void setStationStart(String stationStart) {
        this.stationStart = stationStart;
    }

    public String getStationFinish() {
        return stationFinish;
    }

    public void setStationFinish(String stationFinish) {
        this.stationFinish = stationFinish;
    }

    @Override
    public String toString() {
        return "Route{" +
                "id=" + id +
                ", distance=" + distance +
                ", stationStart=" + stationStart +
                ", stationFinish=" + stationFinish +
                '}';
    }

}
