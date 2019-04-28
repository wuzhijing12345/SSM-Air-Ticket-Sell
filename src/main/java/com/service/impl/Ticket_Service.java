package com.service.impl;

import com.pojo.*;
import com.dao.*;
import com.service.*;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Ticket_Service implements Ticket_SERVICE{
    @Autowired
    private DAO dao;

    public User searchClientById(long id){
        if(id==0){return null;}
        User user=dao.getClient(id);
        return user;
    }

    @Override
    public List<Flight> searchFlight(String start,String end,String date){//仅考虑单程,默认输入信息完全
        List<Flight> l;
        l=dao.getFlight(start,end,date);
        return l;
    }

    @Override
    public Flight searchFlightById(String fid){//默认fid!=null,e=0
        Flight f=dao.getFlightByFId(fid);
        return f;
    }

    @Override
    public int buyTicket(long cid,String fid,char c){//默认fid均不为null,c为舱位，返回值表示买票状态
        if(cid==0){return 1;}//未登录
        User user=searchClientById(cid);
        Flight flight=searchFlightById(fid);
        Purchase ticket=new Purchase();
        Record record=new Record();
        double m=user.getMoney();
        double t=flight.getTopprice();
        double l=flight.getLowprice();
        if((c=='T'&&user.getMoney()<t)||(c=='J'&&user.getMoney()<l)){return 2;}//余额不足，充值
        if(c=='T'&&dao.countTickets(fid,c)>=10){return 3;}//头等舱缺票。机型座位数对应关系！
        if(c=='J'&&dao.countTickets(fid,c)>=10){return 4;}//经济舱缺票
        if(c=='T'){user.setMoney(m-t);}
        else {user.setMoney(m-l);}
        dao.editClient(user);
        ticket.setPuruserId(cid);
        ticket.setPurflightId(fid);
        ticket.setSeattype(c);
        record.setReflightId(fid);
        record.setReuserId(user.getUserId());
        record.setRetype(1);
        Purchase pur = dao.getTicketByID(user.getUserId(),fid);
        if(pur != null){
            return 5;
        }
        else
        {
            dao.addTicket(ticket);
            dao.addRecord(record);
        }
        return 0;//正常
    }

    @Override
    public int changeTicket(long cid,Purchase purchase,String fid,char c){//当前票：purchase;改为：fid,舱位为c.返回改签状态
        User user=searchClientById(cid);
        if(user.getUserId()==0){return 1;}//未登录
        if(c=='T'&&dao.countTickets(fid,c)>=1){return 2;}//头等舱缺票
        if(c=='J'&&dao.countTickets(fid,c)>=1){return 3;}//经济舱缺票
        Flight flight1=searchFlightById(fid);
        Flight flight2=searchFlightById(purchase.getPurflightId());//原始机票
        double money=user.getMoney();
        double m=flight1.getTopprice();
        double l=flight1.getLowprice();
        double t;
        if(purchase.getSeattype()=='T'){
            t=flight2.getTopprice();
        }
        else{
            t=flight2.getLowprice();
        }
        if((c=='T'&&(money+t)<m)||(c=='J'&&(money+t)<l)){return 4;}//余额不足
        if(c=='T'){user.setMoney(money+t-m);}
        else{user.setMoney(money+t-l);}
        dao.editClient(user);
        dao.delTicket(purchase);
        Purchase ticket=new Purchase();
        ticket.setPuruserId(cid);
        ticket.setPurflightId(fid);
        ticket.setSeattype(c);
        dao.addTicket(ticket);
        return 0;//完成改签
    }

    @Override
    public int refund(long cid,String fid,char c){
        User user=dao.getClient(cid);
        if(user.getUserId()==0){return 1;}//未登录
        double m=user.getMoney();
        Flight flight=searchFlightById(fid);
        double f;
        if(c=='T'){f=flight.getTopprice();}
        else{f=flight.getLowprice();}
        Purchase purchase=new Purchase();
        purchase.setPuruserId(cid);
        purchase.setPurflightId(fid);
        dao.delTicket(purchase);
        user.setMoney(m+f);
        return 0;
    }

    public List<Purchase> findTicketByCId(long cid){
        List<Purchase> p;
        p=dao.getTicketByCID(cid);
        return p;
    }

}
