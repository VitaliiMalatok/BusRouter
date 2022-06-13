package com.solvd.laba.service.logic;

import java.util.ArrayList;
import java.util.List;



public class Main {
    public static void main(String[] args) {
        double lat1 = 65;
        double lon1 = 10;
        double lat2 = 55;
        double lon2 = 10;

//        Station station1 = new Station();
//        Station station2 = new Station();
//        station1.setLatitude(lat1);
//        station1.setLongitude(lon1);
//        station2.setLongitude(lon2);
//        station2.setLatitude(lat2);
//
//        System.out.println(distance(station1, station2));

        List<Bus> busesA = new ArrayList<>();
        busesA.add(new Bus("1"));
        //busesA.add(new Bus("2"));
        //busesA.add(new Bus("3"));

        List<Bus> busesB = new ArrayList<>();
        busesB.add(new Bus("4"));
        busesB.add(new Bus("2"));
        busesB.add(new Bus("1"));

        List<Bus> busesD = new ArrayList<>();
        busesD.add(new Bus("5"));
        busesD.add(new Bus("1"));

        List<Bus> busesE = new ArrayList<>();
        busesE.add(new Bus("1"));
        busesE.add(new Bus("5"));
        busesE.add(new Bus("6"));

        List<Bus> busesG = new ArrayList<>();
        //busesG.add(new Bus("1"));
        busesG.add(new Bus("1"));
        busesG.add(new Bus("6"));
        List<Bus> busesC = new ArrayList<>();
        busesC.add(new Bus("1"));



        


//        Route routeAB = new Route();
//        Route routeBC = new Route();



        Station stationA = new Station("A");
        Station stationB = new Station("B");
        Station stationC = new Station("C");
        Station stationD = new Station("D");
        Station stationF = new Station("F");
        Station stationE = new Station("E");
        Station stationG = new Station("G");
        Station stationH = new Station("H");







//        stationA.addDestination(stationB, 10);
//        stationA.addDestination(stationC, 15);
//
//        stationB.addDestination(stationD, 12);
//        stationB.addDestination(stationF, 15);
//
//        stationC.addDestination(stationE, 10);
//
//        stationD.addDestination(stationE, 2);
//        stationD.addDestination(stationF, 1);
//
//        stationF.addDestination(stationE, 5);
//        stationE.addDestination(stationG, 10);

        stationA.addDestination(stationB, 7);
        stationA.addDestination(stationC,8);
        stationB.addDestination(stationF,2);
        stationC.addDestination(stationF, 6);
        stationC.addDestination(stationG, 4);
        stationG.addDestination(stationF, 9);
        stationH.addDestination(stationE,1);
        stationF.addDestination(stationH,3);
        stationF.addDestination(stationD,8);

        Graph graph = new Graph();


//
//        graph.addNode(nodeA);
//        graph.addNode(nodeB);
//        graph.addNode(nodeC);
//        graph.addNode(nodeD);
//        graph.addNode(nodeE);
//        graph.addNode(nodeF);


        Graph.calculateShortestPathFromSource(graph, stationA);
        //System.out.println(graph);
        stationG.getShortestPath().add(stationG);
        System.out.println(stationG.getShortestPath());
        //System.out.println(stationA.getAdjacentNodes());
        List<Station> stations = stationG.getShortestPath();
        System.out.println(stations.size());
        stations.get(0).setBuses(busesA);
        stations.get(1).setCity("Name");
        stations.get(2).setCity("TEST");
        stations.get(1).setBuses(busesC);
        stations.get(2).setBuses(busesG);
        //stations.get(2).setBuses(busesD);
        //stations.get(3).setBuses(busesE);
        //stations.get(4).setBuses(busesG);
        BusService service = new BusService();
        service.getRouteInstructions(stations);







    }
//    public static double distance(Station1 station1, Station1 station2) {
//
//        final int R = 6371; // Radius of the earth
//
//        double lat2 = station2.getLatitude();
//        double lat1 = station1.getLatitude();
//        double lon2 = station2.getLongitude();
//        double lon1 = station1.getLongitude();
//
//        double latDistance = Math.toRadians(lat2 - lat1);
//        double lonDistance = Math.toRadians(lon2 - lon1);
//        double a = Math.sin(latDistance / 2) * Math.sin(latDistance / 2)
//                + Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2))
//                * Math.sin(lonDistance / 2) * Math.sin(lonDistance / 2);
//        double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
//        double distance = R * c * 1000; // convert to meters
//
//        return Math.sqrt(distance);




}
