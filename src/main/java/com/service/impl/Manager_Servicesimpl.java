package com.service.impl;

import com.pojo.*;
import com.dao.*;
import com.service.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class Manager_Servicesimpl implements Manager_SERVICE{
    @Autowired
    private DAO dao;
    public Page<Flight> selectFlightByPage(int currentPage){
        HashMap<String,Object> map=new HashMap<String,Object>();
        Page<Flight> page=new Page<Flight>();
        //封装当前页数
        page.setCurrPage(currentPage);
        //每页显示的数据
        int pageSize=50;
        page.setPageSize(pageSize);
        //封装总记录数
        int totalCount=dao.selectCount();
        page.setTotalCount(totalCount);
        //封装总页数
        double totalcount=totalCount;
        Double num=Math.ceil(totalcount/pageSize);
        page.setTotalPage(num.intValue());//转换为整数
        List<Flight> list=dao.selectFlightByPage((currentPage-1)*pageSize,page.getPageSize());
        page.setList(list);
        return page;
    }
    public List<Flight> findallflight(){
        List<Flight> some = dao.findallflight();
        return some;
    }
    public Flight findFlight(String flightId){
        Flight some = new Flight();
        some=dao.findFlight(flightId);
        return some;
    }

    public List<Record> findallrecord(){
        List<Record> some = dao.getRecord();
        return some;
    }
    public List<Log> findalllog(){
        List<Log> some = dao.getLog();
        return some;
    }

    private void addLog(int logType,Flight flight){
        Log newlog = new Log();
        newlog.setLogtype(logType);
        newlog.setFlight(flight);
        dao.addLog(newlog);
    }
    private void delLog(){
        List<Log> some = dao.getLog();
        int last = some.size()-1;
        dao.delLog(some.get(last));
    }
    public void addFlight(Flight flight) {
        dao.addFlight(flight);
        addLog(2,flight);
    }

    public void delFlight(String id){
        Flight flight=new Flight();
        flight=dao.findFlight(id);
        addLog(3,flight);
        dao.delTicketManage(id);
        dao.delFlight(id);

    }
    public void editFlight(Flight flight){
        dao.editFlight(flight);
        addLog(1,flight);
    }
    public void recover(){
        List<Log> Search = dao.getLog();
        int last = Search.size()-1;
        Flight newflight = new Flight();
        newflight = Search.get(last).getFlight();
        Flight oldflight = newflight;
        int type = Search.get(last).getLogtype();
        if(type == 1){
            for(int i=last;i>=0;i--){
                if(newflight.getFlightId()== Search.get(i).getLogflightId()){
                    newflight = Search.get(i).getFlight();
                    break;
                }
            }
            editFlight(newflight);
            dao.delLog(Search.get(last));
            dao.delLog(Search.get(last+1));
            addLog(4,oldflight);
        }
        if(type == 2){
            delFlight(newflight.getFlightId());
            dao.delLog(Search.get(last));
            dao.delLog(Search.get(last+1));
            addLog(5,oldflight);

        }
        if(type == 3){
            addFlight(newflight);
            dao.delLog(Search.get(last+1));
            dao.delLog(Search.get(last));
            addLog(6,oldflight);
        }
        if(type >= 4){
            int flag = last;
            type = Search.get(--flag).getLogtype();
            while(type >=4&&flag >=0) {
                type = Search.get(--flag).getLogtype();
            }
            if(flag <0) {}
            else {
                if(type == 1){
                    for(int i=flag;i>=0;i--){
                        if(Search.get(flag).getLogflightId() == Search.get(i).getLogflightId()){
                            newflight = Search.get(i).getFlight();
                            break;
                        }
                    }
                    oldflight = Search.get(flag).getFlight();
                    dao.editFlight(newflight);
                    dao.delLog(Search.get(last+1));
                    dao.delLog(Search.get(flag));
                    addLog(4,oldflight);
                }
                if(type == 2){
                    newflight = Search.get(flag).getFlight();
                    delFlight(newflight.getFlightId());
                    dao.delLog(Search.get(last+1));
                    dao.delLog(Search.get(flag));
                    addLog(5,newflight);
                }
                if(type == 3){
                    newflight = Search.get(flag).getFlight();
                    addFlight(newflight);
                    dao.delLog(Search.get(last+1));
                    dao.delLog(Search.get(flag));
                    addLog(6,newflight);
                }
            }
        }
    }
    public void backup(){
        List<Log> Search = dao.getLog();
        int last = Search.size()-1;
        Flight newflight = new Flight();
        newflight = Search.get(last).getFlight();
        Flight oldflight = newflight;
        int type = Search.get(last).getLogtype();
        for(int i = last;i>=0;i--){
            type = Search.get(i).getLogtype();
            if(type >=4){
                if(type == 4){
                    newflight = Search.get(i).getFlight();
                    editFlight(newflight);
                    dao.delLog(Search.get(i));
                }
                if(type == 5){
                    newflight = Search.get(i).getFlight();
                    addLog(2,newflight);
                    dao.delLog(Search.get(i));
                }
                if(type == 6){
                    newflight = Search.get(i).getFlight();
                    editFlight(newflight);
                    dao.delLog(Search.get(i));
                }
                break;
            }
        }
    }
}
