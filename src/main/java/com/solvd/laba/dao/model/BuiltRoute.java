package com.solvd.laba.dao.model;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.solvd.laba.utils.ParserUtils;
import jakarta.xml.bind.annotation.*;
import jakarta.xml.bind.annotation.adapters.XmlJavaTypeAdapter;

import java.time.LocalDateTime;
import java.util.List;

@XmlRootElement(name = "route")
@XmlAccessorType(XmlAccessType.FIELD)
public class BuiltRoute {

    @XmlElement(name = "route_unit", nillable = true)
    @XmlElementWrapper(name = "route_units")
    private List<RouteUnit> routeUnits;


    @JsonSerialize(using = ParserUtils.LocalDateTimeSerializer.class)
    @XmlJavaTypeAdapter(ParserUtils.LocalDateAdapter.class)
    private LocalDateTime builtDate;

    public BuiltRoute() {
        this.builtDate = LocalDateTime.now();
    }

    public List<RouteUnit> getRouteUnits() {
        return routeUnits;
    }

    public void setRouteUnits(List<RouteUnit> routeUnits) {
        this.routeUnits = routeUnits;
    }

    public LocalDateTime getBuiltDate() {
        return builtDate;
    }

    public void setBuiltDate(LocalDateTime builtDate) {
        this.builtDate = builtDate;
    }
}
