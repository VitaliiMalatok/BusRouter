package com.solvd.laba.service.logic;

public class Bus {
    private String name;

    public Bus(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Bus{" +
                "name='" + name + '\'' +
                '}';
    }
}
