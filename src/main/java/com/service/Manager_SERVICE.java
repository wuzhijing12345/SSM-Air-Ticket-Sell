package com.service;

import com.pojo.*;
import java.util.List;

public interface Manager_SERVICE {
    void addFlight(Flight flight);
    void editFlight(Flight flight);
    List<Flight>findallflight();
    Flight findFlight(String flightId);
    void delFlight(String id);
    List<Record> findallrecord();
    List<Log> findalllog();
    void recover();
    void backup();
    Page<Flight> selectFlightByPage(int page);
}
