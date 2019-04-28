package com.pojo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Flight {
    private String flightId;
    private String start;
    private String end;
    private String date;
    private int starttime;
    private int endtime;
    private String waitsite;
    private String fltype;
    private double lowprice;
    private double topprice;

    public Flight(){
        super();
        starttime=0;
        endtime=0;
        lowprice=0;
        topprice=0;
    }

    public String getFlightId() {
        return flightId;
    }

    public void setFlightId(String flightId) {
        this.flightId = flightId;
    }

    public String getStart() {
        return start;
    }

    public void setStart(String start) {
        this.start = start;
    }

    public String getEnd() {
        return end;
    }

    public void setEnd(String end) {
        this.end = end;
    }

    public String getDate() { return date; }

    public void setDate(String str){
        this.date = str;
    }

    public int getStarttime() {
        return starttime;
    }

    public void setStarttime(int starttime) {
        this.starttime = starttime;
    }

    public int getEndtime() {
        return endtime;
    }

    public void setEndtime(int endtime) {
        this.endtime = endtime;
    }

    public String getWaitsite() {
        return waitsite;
    }

    public void setWaitsite(String waitsite) {
        this.waitsite = waitsite;
    }

    public String getFltype() {
        return fltype;
    }

    public void setFltype(String fltype) {
        this.fltype = fltype;
    }

    public double getLowprice() {
        return lowprice;
    }

    public void setLowprice(double lowprice) {
        this.lowprice = lowprice;
    }

    public double getTopprice() {
        return topprice;
    }

    public void setTopprice(double topprice) {
        this.topprice = topprice;
    }

}
