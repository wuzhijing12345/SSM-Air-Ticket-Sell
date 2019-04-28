package com.dao;

import com.pojo.*;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

public interface Read_DAO{
    User getClient(long cid);//get ALL clients' information.
    List<Flight> getFlight(@Param("start") String start,@Param("end") String end,@Param("date") String date);
    //query the flights fly from "start" to "end" at "time" in "date".
    Purchase getTicketByID(@Param("puruserId") long cid,@Param("purflightId")String fid);
    List<Purchase> getTicketByCID(long cid);
    List<Record> getRecord();//get ALL Records.
    List<Log> getLog();//get ALL Logs.
    Log getRecover();
    List<User> getUserinfom();
    Flight getFlightByFId(String fid);
    int countTickets(@Param("fid") String fid,@Param("c") char c);
    long findid(@Param("username") String username, @Param("password") String password);
    List<Flight> findallflight();
    Flight findFlight(@Param("flightId") String flightId);
    List<Flight> selectFlightByPage(@Param("start") int start,@Param("size") int size);
    int selectCount();
    int selectGo(@Param("start")String end);
    int selectReturn(@Param("end")String start);
}

