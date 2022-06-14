package dao.model;

public class Route {
    private int id;
    private double distance;
    private Station stationStart;
    private Station stationFinish;

    public Route() {
    }

    public Route(int id, Station stationStart, Station stationFinish) {
        this.id = id;
        this.distance = calcDistance(stationStart, stationFinish);
        this.stationStart = stationStart;
        this.stationFinish = stationFinish;
    }

    public static double calcDistance(Station stationStart, Station stationFinish) {

        final int R = 6371; // Radius of the earth

        double lat2 = stationFinish.getLatitude();
        double lat1 = stationStart.getLatitude();
        double lon2 = stationFinish.getLongitude();
        double lon1 = stationStart.getLongitude();

        double latDistance = Math.toRadians(lat2 - lat1);
        double lonDistance = Math.toRadians(lon2 - lon1);
        double a = Math.sin(latDistance / 2) * Math.sin(latDistance / 2)
                + Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2))
                * Math.sin(lonDistance / 2) * Math.sin(lonDistance / 2);
        double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
        double distance = R * c * 1000; // convert to meters
        return distance;
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

    public Station getStationStart() {
        return stationStart;
    }

    public void setStationStart(Station stationStart) {
        this.stationStart = stationStart;
    }

    public Station getStationFinish() {
        return stationFinish;
    }

    public void setStationFinish(Station stationFinish) {
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


