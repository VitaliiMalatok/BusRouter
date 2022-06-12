package com.solvd.busrouter.models;

public class Bus {
    private int id;
    private int number;

    public Bus() {
    }

    public Bus(int id, int number) {
        this.id = id;
        this.number = number;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    @Override
    public String toString() {
        return "Bus{" +
                "id=" + id +
                "number=" + number +
                '}';
    }
}
