package com.solvd.laba.dao.model;

import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;

@XmlAccessorType(XmlAccessType.FIELD)
public class RouteUnit {

    private Station fromStation;
    private Station toStation;
    private Bus bus;

    public RouteUnit() {
    }

    public RouteUnit(Station fromStation, Station toStation, Bus bus) {
        this.fromStation = fromStation;
        this.toStation = toStation;
        this.bus = bus;
    }

    public Station getFromStation() {
        return fromStation;
    }

    public void setFromStation(Station fromStation) {
        this.fromStation = fromStation;
    }

    public Station getToStation() {
        return toStation;
    }

    public void setToStation(Station toStation) {
        this.toStation = toStation;
    }

    public Bus getBus() {
        return bus;
    }

    public void setBus(Bus bus) {
        this.bus = bus;
    }
}
