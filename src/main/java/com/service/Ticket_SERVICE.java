package com.service;

import com.pojo.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Date;

public interface Ticket_SERVICE {
    List<Flight> searchFlight(String start,String end,String date);
    Flight searchFlightById(String fid);
    int buyTicket(long cid,String fid,char c);
    int refund(long cid,String fid,char c);
    int changeTicket(long cid,Purchase purchase,String fid,char c);
    User searchClientById(long id);
    List<Purchase> findTicketByCId(long cid);
}
