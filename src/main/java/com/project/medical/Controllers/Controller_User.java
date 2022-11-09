package com.project.medical.Controllers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.math.BigInteger;
import java.security.MessageDigest;

@Controller
@PropertySource("classpath:application.properties")
public class Controller_User {
    @Value("${spring.datasource.url}")
    String data_url;
    @Value("${spring.datasource.username}")
    String data_username;
    @Value("${spring.datasource.password}")
    String data_password;

    @GetMapping("/RegisterUser")
    public String UserRegister(String[] args) {
        return "RegisterUser";
    }


    @GetMapping("/UserProduct")
    public String GetProduct(Model model, String[] args) {
        return "UserProduct";
    }


    @RequestMapping(value = "RegisterNewUser", method = RequestMethod.POST)
    public String RegisterNewUser(@RequestParam("Email") String Email, @RequestParam("UserName") String UserName, @RequestParam("Password") String Password, @RequestParam("Address") String Address) {
        try {
            Connection connection = DriverManager.getConnection(data_url, data_username, data_password);
            MessageDigest hash = MessageDigest.getInstance("MD5");
            byte[] md = hash.digest(Password.getBytes());
            BigInteger num = new BigInteger(1, md);
            String ht = num.toString(16);
            while (ht.length() < 32) {
                ht = "0" + ht;
            }
            PreparedStatement sql = connection.prepareStatement("INSERT INTO USERS(EMAIL, USERNAME, PASS_WORD, ADDRESS) VALUES(?, ?, ?, ?);");
            sql.setString(1, Email);
            sql.setString(2, UserName);
            sql.setString(3, ht);
            sql.setString(4, Address);
            sql.executeUpdate();
            System.out.println("User Successfully Registered");
        } catch (Exception exp) {
            System.out.println("Exception :" + exp);
        }
        return "redirect:/";
    }
}
