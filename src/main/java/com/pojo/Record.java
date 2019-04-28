package com.pojo;

import java.util.Date;

public class Record {
    private long recordId;
    private String retime;
    private int retype;
    private long reuserId;
    private String reflightId;

    public Record(){

    }

    public long getRecordId() {
        return recordId;
    }

    public void setRecordId(long recordId) {
        this.recordId = recordId;
    }

    public String getRetime() {
        return retime;
    }

    public void setRetime(String retime) {
        this.retime = retime;
    }

    public int getRetype() {
        return retype;
    }

    public void setRetype(int retype) {
        this.retype = retype;
    }

    public long getReuserId() {
        return reuserId;
    }

    public void setReuserId(long reuserId) {
        this.reuserId = reuserId;
    }

    public String getReflightId() {
        return reflightId;
    }

    public void setReflightId(String reflightId) {
        this.reflightId = reflightId;
    }

}
