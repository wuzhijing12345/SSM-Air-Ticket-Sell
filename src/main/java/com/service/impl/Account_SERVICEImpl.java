package com.service.impl;

import com.pojo.*;
import com.dao.*;
import com.service.*;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class Account_SERVICEImpl implements Account_SERVICE{
    @Autowired
    private DAO accountDao;

    public List<User> getUserinfom(){
        return accountDao.getUserinfom();
    }

    public long Login(User user){
        int a=0;
        List<User>list = accountDao.getUserinfom();
        String username = user.getUsername();
        String password = user.getPassword();
        long b=0;
        for(User user1 : list){
            if(username.equals(user1.getUsername()) && password.equals(user1.getPassword())){
                a=1;
                b=accountDao.findid(username,password);
                user.setUserId(b);
                if(b==1){
                    a=2;
                }
                break;
            }
            else if(username.equals(user1.getUsername()) && password.equals(user1.getPassword())==false){
                a=3;
            }
        }
        if(a==1 || a==2){
            return b;

        }
        if(a==3){
            user.setError("密码错误，重新输入");
            return 0;
        }
        else {
            user.setError1("没有这个用户，请去注册");
            return 0;
        }
    }
    public int register(User user,String conformpwd){
        int a=0;
        String name=user.getUsername();
        String password=user.getPassword();
        String tel=user.getTelnumber();
        System.out.println(user.getUserId());
        user.setMoney(0);
        int flag=0;
        List<User> list=accountDao.getUserinfom();
        for(User user1 :list){
            if(name.equals(user1.getUsername())){
                flag=1;
            }
        }
        if( password.equals(conformpwd) && flag==0){
            accountDao.addClient(user);
            a=1;
        }
        else if(password.equals(conformpwd) == false){
            user.setError("密码与确认密码输入不同");
            a=2;
        }
        else if(flag==1){
            user.setError1("该用户名已经被使用");
            a=3;
        }
        return a;
    }
    public void recharge(long cid,double money){
        User user;
        user=accountDao.getClient(cid);
        user.setMoney(money);
        accountDao.editClient(user);
    }

    public User findClient(long id){
        User user;
        user=accountDao.getClient(id);
        System.out.println(user.getUsername()+user.getPassword()+user.getTelnumber());
        return user;
    }
    public User updateClient(User user){
        List<User>list = accountDao.getUserinfom();
        int flag=0;
        for(User user1 :list){
            if(user.getUsername().equals(user1.getUsername())){
                flag=1;
                if(user.getUserId()==user1.getUserId()){
                    flag=0;
                }
                break;
            }
        }
        if(flag==0){
            accountDao.editClient(user);
        }
        else{
            user.setError1("用户名重复，无法修改");
        }
        return user;
    }
    public User rechargeClient(User user){
        long i=user.getUserId();
        User user1=accountDao.getClient(i);
        user.setUsername(accountDao.getClient(i).getUsername());
        user.setPassword(accountDao.getClient(i).getPassword());
        user.setTelnumber(accountDao.getClient(i).getTelnumber());
        user.setMoney(user.getMoney()+user1.getMoney());
        accountDao.editClient(user);
        return user;
    }

    public User getClient(long id){
        User user = new User();
        user=accountDao.getClient(id);
        return user;
    }

    public int selectGo(String end){
        int a=accountDao.selectGo(end);
        return a;
    }

    public int selectReturn( String start){
        int b=accountDao.selectReturn(start);
        return b;
    }
}
