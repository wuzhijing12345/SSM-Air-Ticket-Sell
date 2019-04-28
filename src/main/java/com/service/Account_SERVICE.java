package com.service;

import com.pojo.*;
import java.util.List;

public interface Account_SERVICE {
    long Login(User user);
    int register(User user,String conformpwd);
    void recharge(long cid,double money);
    List<User> getUserinfom();
    User findClient(long id);
    User updateClient(User user);
    User rechargeClient(User user);
    User getClient(long id);
    int selectGo(String end);
    int selectReturn( String start);

}
