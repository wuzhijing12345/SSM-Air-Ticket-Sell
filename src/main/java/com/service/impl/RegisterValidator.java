package com.service.impl;

import com.pojo.*;
import org.springframework.stereotype.Repository;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;


@Repository("RegisterValidator")
public class RegisterValidator implements Validator {
    @Override
    public boolean supports(Class<?> clazz){
        return User.class.equals(clazz);
    }

    @Override
    public void validate(Object object, Errors errors){
        ValidationUtils.rejectIfEmpty(errors,"username",null,"用户名不能不填");
        ValidationUtils.rejectIfEmpty(errors,"password",null,"密码不能不填");
        ValidationUtils.rejectIfEmpty(errors,"telnumber",null,"联系方式不能不填");
        User user = (User)object;
        int length = user.getUsername().length();
        if(length>20){
            errors.rejectValue("username","user.username","用户名不能超过20个字符");
        }
        length = user.getPassword().length();
        if(length>8){
            errors.rejectValue("password","user.password","密码太长，不能长于8个字符");
        }
        length = user.getTelnumber().length();
        if(length >20){
            errors.rejectValue("telnumber","user.telnumber","电话太长，不能长于20个字符");
        }

    }
}
