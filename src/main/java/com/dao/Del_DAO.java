package com.dao;

import com.pojo.*;

import javax.lang.model.element.NestingKind;
import java.util.List;

public interface Del_DAO{
    void delFlight(String flightId);
    void delTicket(Purchase purchase);//1.by flight id and client id; 2.by flight id
    void delLog(Log log);
    void delTicketManage(String pid);
}

