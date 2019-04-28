package com.controller;

import com.fasterxml.jackson.databind.util.JSONPObject;
import com.pojo.*;
import com.service.*;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.*;


import com.service.impl.RegisterValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;


@Controller
@RequestMapping("/zzgnb")
public class FlightController {
    @Autowired
    private Account_SERVICE accService;
    @Autowired
    private Ticket_SERVICE ts;
    @Autowired
    private Manager_SERVICE ms;

    @Autowired
    @Qualifier("RegisterValidator")
    private RegisterValidator registerValidator;

    private String[] list1={"北京","上海","武汉","深圳","广州","成都","重庆","杭州","西安","天津","郑州"};
    private String[] list2={"2019-05-01","2019-05-02","2019-05-03","2019-05-04","2019-05-05","2019-05-06","2019-05-07","2019-05-08","2019-05-09","2019-05-10"};

    @InitBinder("user")
    public void initBinderStudent(WebDataBinder binder){
        binder.setFieldDefaultPrefix("user.");
    }
    @InitBinder("flight")
    public void initBinderCourse(WebDataBinder binder){
        binder.setFieldDefaultPrefix("flight.");
    }

    @RequestMapping("toRegister")
    public String toRegister(Model model) {
        User user=new User();
        model.addAttribute("user" ,user);
        return "register";
    }

    @RequestMapping("toLogin")
    public String toLogin(Model model) {
        User user=new User();
        model.addAttribute("user" ,user);
        return "login";
    }

    @RequestMapping("/toMain")
    public String main(
            @ModelAttribute("user") User user,
            Model model){
        if(user.getUserId()!=0){user=accService.findClient(user.getUserId());}
        Flight flight=new Flight();
        int tag=1;
        String date2="2019-05-01";
        model.addAttribute("one_or_two",tag);
        model.addAttribute("user",user);
        model.addAttribute("flight",flight);
        model.addAttribute("date2",date2);
        model.addAttribute("list1",list1);
        model.addAttribute("list2",list2);
        return "/main";
    }

    @RequestMapping("/toClient/{user.userId}")
    public String toClient(Model model,@PathVariable("user.userId") long id) {
        User user;
        user=accService.getClient(id);
        List<Purchase> list=ts.findTicketByCId(id);
        List<Flight> f_list=new ArrayList<Flight>();
        Flight t;
        for (int i=0;i<list.size();i++){
            t=ts.searchFlightById(list.get(i).getPurflightId());
            f_list.add(t);
        }
        model.addAttribute("user" ,user);
        model.addAttribute("c_list",list);
        model.addAttribute("f_list",f_list);
        return "client";
    }

    @RequestMapping("toAddFlight")
    public String toAddFlight(Model model){
        Flight flight=new Flight();
        model.addAttribute("flight",flight);
        return "addFlight";
    }

    @RequestMapping("/toUpdateFlight")
    public String toUpdatePaper(Model model,String id) {
        Flight flight=new Flight();
        flight=ms.findFlight(id);
        model.addAttribute("flight",flight);
        return "updateFlight";
    }

    @RequestMapping("toLog")
    public String toLog(Model model){
        List<Log> list = ms.findalllog();
        model.addAttribute("list5", list);
        return "managerlog";
    }

    @RequestMapping("toManFlight")
    public String toManFlight(@RequestParam(defaultValue="1") int currentPage, Model model, HttpServletRequest request){
        Page<Flight> page= ms.selectFlightByPage(currentPage) ;
        model.addAttribute("list3",page );//设置一个属性
        return "managerf";
    }


    @RequestMapping("toRecord")
    public String toRecord(Model model){
        List<Record> list = ms.findallrecord();
        model.addAttribute("list4", list);
        return "managerrecord";
    }

    @RequestMapping("/register")
    public String register(
            @RequestParam("againpwd") String againpwd,
            @ModelAttribute("user") User user,
             Errors errors,
             Model model) {
        registerValidator.validate(user,errors);
        if(errors.hasFieldErrors()){
            return "register";
        }
        int a=accService.register(user,againpwd);
        if(a==1){
            model.addAttribute("user",user);
            Flight flight=new Flight();
            int tag=1;
            String date2="2019-05-01";
            model.addAttribute("one_or_two",tag);
            model.addAttribute("user",user);
            model.addAttribute("flight",flight);
            model.addAttribute("date2",date2);
            model.addAttribute("list1",list1);
            model.addAttribute("list2",list2);
            return "main";
        }
        else{
            return "register";
        }
    }
    @RequestMapping("/login")
    public String login(@ModelAttribute("user") User user,
                        Model model, @RequestParam(defaultValue="1") int currentPage,HttpServletRequest request){
        long a=accService.Login(user);
        long userid=a;
        if(a==1){
            model.addAttribute("user" ,user);
            Page<Flight> list = ms.selectFlightByPage(currentPage);
            model.addAttribute("list3", list);
            return "managerf";
        }
        else if(a==0){
            return "login";
        }
        else {
            model.addAttribute("user" ,user);
            Flight flight=new Flight();
            int tag=1;
            String date2="2019-05-01";
            model.addAttribute("one_or_two",tag);
            model.addAttribute("user",user);
            model.addAttribute("flight",flight);
            model.addAttribute("date2",date2);
            model.addAttribute("list1",list1);
            model.addAttribute("list2",list2);
            return "main";
        }
    }

    @RequestMapping("/client")
    public String client(Model model,@ModelAttribute("user") User user,Errors errors){
        registerValidator.validate(user,errors);
        if(errors.hasFieldErrors()){
            return "client";
        }
        accService.updateClient(user);
        User user1=new User();
        user1=accService.getClient(user.getUserId());
        model.addAttribute("user",user1);
        List<Purchase> list=ts.findTicketByCId(user1.getUserId());
        List<Flight> f_list=new ArrayList<Flight>();
        Flight t;
        for (int i=0;i<list.size();i++){
            t=ts.searchFlightById(list.get(i).getPurflightId());
            f_list.add(t);
        }
        model.addAttribute("user" ,user);
        model.addAttribute("c_list",list);
        model.addAttribute("f_list",f_list);
        return "client";
    }
    @RequestMapping("/recharge")
    public String recharge(Model model,@ModelAttribute("user") User user){
        accService.rechargeClient(user);
        model.addAttribute("user",user);
        List<Purchase> list=ts.findTicketByCId(user.getUserId());
        List<Flight> f_list=new ArrayList<Flight>();
        Flight t;
        for (int i=0;i<list.size();i++){
            t=ts.searchFlightById(list.get(i).getPurflightId());
            f_list.add(t);
        }
        model.addAttribute("user" ,user);
        model.addAttribute("c_list",list);
        model.addAttribute("f_list",f_list);
        return "client";
    }

    @RequestMapping("/toSearch")
    public String search(
            @ModelAttribute("tag") String tag,
            @ModelAttribute("date2") String date2,
            @ModelAttribute("user") User user,
            @ModelAttribute("flight") Flight flight,
            @ModelAttribute("tag") String tag1,
            @ModelAttribute("fid1") String fid1,
            @ModelAttribute("fid2") String fid2,
            Model model
    ){
        List<Flight> f_list=ts.searchFlight(flight.getStart(),flight.getEnd(),flight.getDate());
        model.addAttribute("tag",tag);
        model.addAttribute("user",user);  //目的是传id
        model.addAttribute("f_list",f_list);
        if(tag.equals("2")){
            List<Flight> f_list2=ts.searchFlight(flight.getEnd(),flight.getStart(),date2);
            model.addAttribute("f_list2",f_list2);
        }
        String fid3="";
        String fid4="";
        Flight flight1=new Flight();
        flight1.setStart(flight.getStart());
        flight1.setEnd(flight.getEnd());
        model.addAttribute("fid1",fid3);
        model.addAttribute("fid2",fid4);//返程航班号
        model.addAttribute("flight",flight1);
        model.addAttribute("list1",list1);
        model.addAttribute("list2",list2);
        model.addAttribute("one_or_two",tag);
        if(fid1.equals("")||(tag1.equals("2")&&fid2.equals(""))){}
        Flight flight3=ts.searchFlightById(fid1);
        Flight flight4=ts.searchFlightById(fid2);
        char c1='c';
        char c2='c';
        model.addAttribute("user",user);
        model.addAttribute("tag",tag);
        model.addAttribute("flight1",flight3);
        model.addAttribute("flight2",flight4);
        model.addAttribute("c1",c1);
        model.addAttribute("c2",c2);
        return "search";
    }

    @RequestMapping("toComform")
    public String comform(
            @ModelAttribute("user") User user,
            @ModelAttribute("tag") String tag,
            @ModelAttribute("fid1") String fid1,
            @ModelAttribute("fid2") String fid2,
            @ModelAttribute("c1") String c1,
            @ModelAttribute("c2") String c2,
            Model model
    ){
        if(fid1.equals("")||(tag.equals("2")&&fid2.equals(""))){
            model.addAttribute("err",1);
            return "forward:/zzgnb/toSearch";
        }

        int flag1=ts.buyTicket(user.getUserId(),fid1,c1.charAt(0));
        int flag2=0;
        if(tag.equals("2")){
            flag2=ts.buyTicket(user.getUserId(),fid2,c2.charAt(0));
        }
        if(flag1==1){
            return "login";//未登录，前往登录页面
        }
        if(flag1==5){
            model.addAttribute("error",1);
        }
        if(flag2==5){
            model.addAttribute("error1",1);
        }
        model.addAttribute("user",user);
        model.addAttribute("flag1",flag1);
        model.addAttribute("flag2",flag2);
        model.addAttribute("tag",tag);
        User user1=new User();
        user1=accService.getClient(user.getUserId());
        List<Purchase> list=ts.findTicketByCId(user.getUserId());
        List<Flight> f_list=new ArrayList<Flight>();
        Flight t;
        for (int i=0;i<list.size();i++){
            t=ts.searchFlightById(list.get(i).getPurflightId());
            f_list.add(t);
        }
        model.addAttribute("user" ,user1);
        model.addAttribute("c_list",list);
        model.addAttribute("f_list",f_list);
        return "client";
    }

    @RequestMapping("/addFlight")
    public String addPaper(Flight flight,Model model,
                            @RequestParam(defaultValue="1") int currentPage) {
        ms.addFlight(flight);
        model.addAttribute("flight",flight);
        Page<Flight> list = ms.selectFlightByPage(currentPage);
        model.addAttribute("list3", list);
        return "managerf";
    }
    @RequestMapping("/updateFlight")
    public String updateFlight(Model model,Flight flight,
                                @RequestParam(defaultValue="1") int currentPage) {
        model.addAttribute("flight",flight);
        ms.editFlight(flight);
        Page<Flight> list = ms.selectFlightByPage(currentPage);
        model.addAttribute("list3", list);
        return "managerf";
    }

    @RequestMapping("/del/{flight.flightId}")
    public String deletePaper(@PathVariable("flight.flightId") String id,Model model,
                               @RequestParam(defaultValue="1") int currentPage) {
        Flight flight=new Flight();
        model.addAttribute("flight",flight);
        ms.delFlight(id);
        Page<Flight> list = ms.selectFlightByPage(currentPage);
        model.addAttribute("list3", list);
        return "managerf";
    }

    @RequestMapping("/toTest")
    public String test(Model model){
        List<Integer> l1=new ArrayList<Integer>();
        List<Integer> l2=new ArrayList<Integer>();
        int a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11;
        int b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11;
        a1=accService.selectGo("北京");
        a2=accService.selectGo("上海");
        a3=accService.selectGo("杭州");
        a4=accService.selectGo("广州");
        a5=accService.selectGo("深圳");
        a6=accService.selectGo("重庆");
        a7=accService.selectGo("武汉");
        a8=accService.selectGo("天津");
        a9=accService.selectGo("郑州");
        a10=accService.selectGo("西安");
        a11=accService.selectGo("成都");
        b1=accService.selectReturn("北京");
        b2=accService.selectReturn("上海");
        b3=accService.selectReturn("杭州");
        b4=accService.selectReturn("广州");
        b5=accService.selectReturn("深圳");
        b6=accService.selectReturn("重庆");
        b7=accService.selectReturn("武汉");
        b8=accService.selectReturn("天津");
        b9=accService.selectReturn("郑州");
        b10=accService.selectReturn("西安");
        b11=accService.selectReturn("成都");
        l1.add(a1);l1.add(a2);l1.add(a3);l1.add(a4);l1.add(a5);
        l1.add(a6);l1.add(a7);l1.add(a8);l1.add(a9);l1.add(a10);
        l1.add(a11);
        model.addAttribute("l1",l1);
        l2.add(b1);l2.add(b2);l2.add(b3);l2.add(b4);l2.add(b5);
        l2.add(b6);l2.add(b7);l2.add(b8);l2.add(b9);l2.add(b10);
        l2.add(b11);
        model.addAttribute("l2",l2);
        return "test";
    }


}
