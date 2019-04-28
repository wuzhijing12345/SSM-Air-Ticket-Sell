package com.pojo;

public class Purchase {
    private long puruserId;
    private String purflightId;
    private char seattype;
    private String seat;
    private int error;

    public Purchase(){

    }

    public long getPuruserId() {
        return puruserId;
    }

    public void setPuruserId(long puruserId) {
        this.puruserId = puruserId;
    }

    public String getPurflightId() {
        return purflightId;
    }

    public void setPurflightId(String purflightId) {
        this.purflightId = purflightId;
    }

    public char getSeattype() {
        return seattype;
    }

    public void setSeattype(char seattype) {
        this.seattype = seattype;
    }

    public String getSeat() {
        return seat;
    }

    public void setSeat(String seat) {
        this.seat = seat;
    }

    public int getError() {
        return error;
    }

    public void setError(int error) {
        this.error = error;
    }
}
