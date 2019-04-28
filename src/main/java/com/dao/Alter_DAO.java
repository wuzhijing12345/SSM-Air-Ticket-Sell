package com.dao;

import com.pojo.*;
import java.util.List;

public interface Alter_DAO{
    void editClient(User user);//user function
    void editFlight(Flight flight);//manager function
    void editTicket(Purchase purchase);

}

