package com.pojo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Log {
    private long logid;
    private int logtype;
    private String logflightid;
    private String logstart;
    private String logend;
    private String logdate;
    private int logstarttime;
    private int logendtime;
    private String logwaitsite;
    private String logfltype;
    private double loglowprice;
    private double logtopprice;

    public long getLogId() {
        return logid;
    }

    public void setLogId(long logId) {
        this.logid = logId;
    }

    public int getLogtype() {
        return logtype;
    }

    public void setLogtype(int logtype) {
        this.logtype = logtype;
    }

    public String getLogflightId() {
        return logflightid;
    }

    public void setLogflightId(String logflightId) {
        this.logflightid = logflightId;
    }

    public String getLogstart() {
        return logstart;
    }

    public void setLogstart(String logstart) {
        this.logstart = logstart;
    }

    public String getLogend() {
        return logend;
    }

    public void setLogend(String logend) {
        this.logend = logend;
    }

    public String getLogdate() {
        return logdate;
    }

    public void setLogdate(String str) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date;
        date = sdf.parse(str);
        this.logdate = str;
    }

    public int getLogstarttime() {
        return logstarttime;
    }

    public void setLogstarttime(int logstarttime) {
        this.logstarttime = logstarttime;
    }

    public int getLogendtime() {
        return logendtime;
    }

    public void setLogendtime(int logendtime) {
        this.logendtime = logendtime;
    }

    public String getLogwaitsite() {
        return logwaitsite;
    }

    public void setLogwaitsite(String logwaitsite) {
        this.logwaitsite = logwaitsite;
    }

    public String getLogfltype() {
        return logfltype;
    }

    public void setLogfltype(String logfltype) {
        this.logfltype = logfltype;
    }

    public double getLoglowprice() {
        return loglowprice;
    }

    public void setLoglowprice(double loglowprice) {
        this.loglowprice = loglowprice;
    }

    public double getLogtopprice() {
        return logtopprice;
    }

    public void setLogtopprice(double logtopprice) {
        this.logtopprice = logtopprice;
    }

    public void setFlight(Flight flight){
        this.logflightid = flight.getFlightId();
        this.logstart = flight.getStart();
        this.logend = flight.getEnd();
        this.logdate = flight.getDate();
        this.logstarttime = flight.getStarttime();
        this.logendtime = flight.getEndtime();
        this.logwaitsite = flight.getWaitsite();
        this.logfltype = flight.getFltype();
        this.loglowprice = flight.getLowprice();
        this.logtopprice = flight.getLowprice();
    }

    public Flight getFlight()
    {
        Flight newflight = new Flight();
        newflight.setFlightId(this.getLogflightId());
        newflight.setStart(this.getLogstart());
        newflight.setEnd(this.getLogend());
        newflight.setDate(this.getLogdate());
        newflight.setStarttime(this.getLogstarttime());
        newflight.setEndtime(this.getLogendtime());
        newflight.setWaitsite(this.getLogwaitsite());
        newflight.setFltype(this.getLogfltype());
        newflight.setLowprice(this.getLoglowprice());
        newflight.setTopprice(this.getLogtopprice());
        return newflight;
    }
}
