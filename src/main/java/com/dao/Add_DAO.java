package com.dao;

import com.pojo.*;
import java.util.List;

public interface Add_DAO{
    void addClient(User user);
    void addFlight(Flight flight);
    void addTicket(Purchase purchase);
    void addRecord(Record record);
    void addLog(Log log);
}

