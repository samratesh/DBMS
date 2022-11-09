package com.project.medical.Controllers;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.sql.*;
import java.util.Objects;
import java.math.BigInteger;
import java.security.MessageDigest;

@Controller
@PropertySource("classpath:application.properties")
public class Controller_Admin {
    @Value("${spring.datasource.url}")
    String data_url;
    @Value("${spring.datasource.username}")
    String data_username;
    @Value("${spring.datasource.password}")
    String data_password;

    boolean AdminLoginCheck = false;
    String User_Name = "";


    @RequestMapping(value = {"/", "/LogOut"})
    public String IndexPage(String[] args) {
        User_Name = "";
        AdminLoginCheck = false;
        return "UserLogin";
    }


    @GetMapping("/Index")
    public String Index(Model model, String[] args) {
        if (!Objects.equals(User_Name, "")) {
            model.addAttribute("UserName", User_Name);
            return "Index";
        } else {
            return "UserLogin";
        }
    }


    @GetMapping("/ValidateUserLogin")
    public String LoginUser(Model model, String[] args) {
        return "UserLogin";
    }

    @RequestMapping(value = "/BuyProduct", method = RequestMethod.POST)
    public String Buy(@RequestParam("Product_Id") int Product_Id, String[] args) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(data_url, data_username, data_password);
            PreparedStatement sqlQuery = connection.prepareStatement("SELECT USER_ID FROM USERS WHERE USERNAME = '" + User_Name + "';");
//            sqlQuery.setString(1, User_Name);
            ResultSet result = sqlQuery.executeQuery();
            if (result.next()) {
                PreparedStatement sql = connection.prepareStatement("INSERT INTO ORDERS(USER_ID, PRODUCT_ID) VALUES(" + result.getInt(1) + ", " + Product_Id + ");");
//                System.out.println(result.getInt(1));
//                sql.setInt(1, result.getInt(1));
//                sql.setInt(2, Product_Id);
                sql.executeUpdate();
            }
        } catch (Exception exp) {
            System.out.println("Exception : " + exp);
        }
        return "redirect:/UserProduct";
    }

    @RequestMapping(value = "/Admin/OrderComplete", method = RequestMethod.POST)
    public String OrderComplete(@RequestParam("OrderID") int OrderID, String[] args) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(data_url, data_username, data_password);
            PreparedStatement sql = connection.prepareStatement("UPDATE ORDERS SET ORDER_STATUS = 'COMPLETE' WHERE ORDER_ID = " + OrderID + ";");
            sql.executeUpdate();
        } catch (Exception exp) {
            System.out.println("Exception : " + exp);
        }
        return "Orders";
    }

    @GetMapping("/OrderHistory")
    public String OrderHistory(Model model, String[] args) {
        model.addAttribute("User_Name", User_Name);
        return "OrderHistory";
    }


    @RequestMapping(value = "ValidateUserLogin", method = RequestMethod.POST)
    public String UserLogin(@RequestParam("UserName") String UserName, @RequestParam("Password") String Password, Model model, String[] args) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(data_url, data_username, data_password);
            MessageDigest hash = MessageDigest.getInstance("MD5");
            byte[] md = hash.digest(Password.getBytes());
            BigInteger num = new BigInteger(1, md);
            String ht = num.toString(16);
            while (ht.length() < 32) {
                ht = "0" + ht;
            }
            Statement sqlQuery = connection.createStatement();
            ResultSet result = sqlQuery.executeQuery("SELECT * FROM USERS WHERE USERNAME = '" + UserName + "' AND PASS_WORD = '" + ht + "' AND ROLES = 'ROLE_USER' ;");
            if (!result.next()) {
                model.addAttribute("message", "Incorrect UserName or Password entered");
                return "UserLogin";
            } else {
                User_Name = result.getString(3);
                return "redirect:/Index";
            }
        } catch (Exception exp) {
            System.out.println("Exception :" + exp);
        }
        return "UserLogin";
    }


    @GetMapping("/AdminLogin")
    public String AdminLogin(Model model, String[] args) {
        return "AdminLogin";
    }


    @GetMapping("AdminHome")
    public String HomeAdmin(Model model, String[] args) {
        if (!AdminLoginCheck) {
            return "redirect:/AdminLogin";
        } else {
            return "AdminHome";
        }
    }


    @GetMapping("/ValidateLogin")
    public String LogAdmin(Model model, String[] args) {
        return "AdminLogin";
    }


    @RequestMapping(value = "ValidateLogin", method = RequestMethod.POST)
    public String AdminLogin(@RequestParam("UserName") String UserName, @RequestParam("Password") String Password, Model model) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(data_url, data_username, data_password);
            MessageDigest hash = MessageDigest.getInstance("MD5");
            byte[] md = hash.digest(Password.getBytes());
            BigInteger num = new BigInteger(1, md);
            String ht = num.toString(16);
            while (ht.length() < 32) {
                ht = "0" + ht;
            }
            Statement sqlQuery = connection.createStatement();
            ResultSet result = sqlQuery.executeQuery("SELECT * FROM USERS WHERE USERNAME = '" + UserName + "' AND PASS_WORD = '" + ht + "' AND ROLES = 'ROLE_ADMIN' ;");
            if (!result.next()) {
                model.addAttribute("message", "Incorrect UserName or Password entered");
                return "AdminLogin";
            } else {
                AdminLoginCheck = true;
                return "redirect:AdminHome";
            }
        } catch (Exception exp) {
            System.out.println("Exception :" + exp);
        }
        return "AdminLogin";
    }


    @GetMapping("/Admin/Category")
    public String CategoryGet(String[] args) {
        return "Category";
    }


    @RequestMapping(value = "Admin/SendCategory", method = RequestMethod.GET)
    public String CategoryAdd(@RequestParam("CategoryName") String CategoryName, String[] args) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(data_url, data_username, data_password);
            connection.createStatement();

            PreparedStatement sql = connection.prepareStatement("INSERT INTO CATEGORY(CATEGORY_NAME) VALUES(?);");
            sql.setString(1, CategoryName);
            sql.executeUpdate();
        } catch (Exception exp) {
            System.out.println("Exception : " + exp);
        }
        return "redirect:/Admin/Category";
    }


    @GetMapping("/Admin/Category/Delete")
    public String CategoryDelete(@RequestParam("Category_Name") String Category_Name, String[] args) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(data_url, data_username, data_password);
            connection.createStatement();

            PreparedStatement sql = connection.prepareStatement("DELETE FROM CATEGORY WHERE CATEGORY_NAME = ?;");
            sql.setString(1, Category_Name);
            sql.executeUpdate();
        } catch (Exception exp) {
            System.out.println("Exception : " + exp);
        }
        return "redirect:/Admin/Category";
    }


    @GetMapping("/Admin/Category/Update")
    public String CategoryUpdate(@RequestParam("OldName") String OldName, @RequestParam("NewName") String NewName, String[] args) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(data_url, data_username, data_password);
            connection.createStatement();

            PreparedStatement sql = connection.prepareStatement("UPDATE CATEGORY SET CATEGORY_NAME = ? WHERE CATEGORY_NAME = ?");
            sql.setString(1, NewName);
            sql.setString(2, OldName);
            sql.executeUpdate();
        } catch (Exception exp) {
            System.out.println("Exception : " + exp);
        }
        return "redirect:/Admin/Category";
    }


    @GetMapping("/Admin/Product")
    public String ProductGet(Model model, String[] args) {
        return "Product";
    }


    @GetMapping("/Admin/Product/Add")
    public String ProductAdd(Model model, String[] args) {
        return "AddProduct";
    }


    @GetMapping("/Admin/Product/Update")
    public String ProductUpdate(Model model, @RequestParam("ProductName") String Product_Name, String[] args) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(data_url, data_username, data_password);
            connection.createStatement();

            PreparedStatement sql = connection.prepareStatement("SELECT * FROM PRODUCT WHERE PRODUCT_NAME = ?;");
            sql.setString(1, Product_Name);
            ResultSet result = sql.executeQuery();

            if (result.next()) {
                int ProductId = result.getInt(1);
                String ProductName = result.getString(2);
                String ProductImage = result.getString(3);
                int ProductCategory = result.getInt(4);
                int ProductQuantity = result.getInt(5);
                int ProductPrice = result.getInt(6);
                String ProductExpiry = result.getString(7);
                String ProductDescription = result.getString(8);
                model.addAttribute("ProductId", ProductId);
                model.addAttribute("ProductName", ProductName);
                model.addAttribute("ProductImage", ProductImage);
                sql = connection.prepareStatement("SELECT * FROM CATEGORY WHERE CATEGORY_ID = " + ProductCategory + ";");
                ResultSet result2 = sql.executeQuery();

                if (result2.next()) {
                    model.addAttribute("ProductCategory", result2.getString(2));
                }

                model.addAttribute("ProductQuantity", ProductQuantity);
                model.addAttribute("ProductPrice", ProductPrice);
                model.addAttribute("ProductExpiry", ProductExpiry);
                model.addAttribute("ProductDescription", ProductDescription);
            }
        } catch (Exception exp) {
            System.out.println("Exception : " + exp);
        }
        return "ProductUpdate";
    }


    @RequestMapping(value = "Admin/Product/UpdateData", method = RequestMethod.POST)
    public String DBProductUpdate(@RequestParam("OldName") String OldName, @RequestParam("NewName") String NewName, @RequestParam("NewPrice") int NewPrice, @RequestParam("NewExpiry") String NewExpiry, @RequestParam("NewQuantity") int NewQuantity, @RequestParam("NewDescription") String NewDescription, @RequestParam("NewImage") String NewImage, String[] args) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(data_url, data_username, data_password);

            PreparedStatement sql = connection.prepareStatement("UPDATE PRODUCT SET PRODUCT_NAME= ?, PRODUCT_IMAGE = ?, PRODUCT_QUANTITY = ?, PRODUCT_PRICE = ?, PRODUCT_EXPIRY = ?, PRODUCT_DESCRIPTION = ? where PRODUCT_NAME = ?;");
            sql.setString(1, NewName);
            sql.setString(2, NewImage);
            sql.setInt(3, NewQuantity);
            sql.setInt(4, NewPrice);
            sql.setString(5, NewExpiry);
            sql.setString(6, NewDescription);
            sql.setString(7, OldName);
            sql.executeUpdate();
        } catch (Exception exp) {
            System.out.println("Exception : " + exp);
        }
        return "redirect:/Admin/Product";
    }


    @GetMapping("/Admin/Product/Delete")
    public String DBProductRemove(@RequestParam("Product_Id") int ProductId, String[] args) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(data_url, data_username, data_password);

            PreparedStatement sql = connection.prepareStatement("DELETE FROM PRODUCT WHERE PRODUCT_ID = ?;");
            sql.setInt(1, ProductId);
            sql.executeUpdate();
        } catch (Exception exp) {
            System.out.println("Exception : " + exp);
        }
        return "redirect:/Admin/Product";
    }


    @PostMapping("/Admin/Product")
    public String ProductPost(String[] args) {
        return "redirect:/Admin/Category";
    }


    @RequestMapping(value = "Admin/Product/SendData", method = RequestMethod.POST)
    public String DBProductAdd(@RequestParam("ProductName") String ProductName, @RequestParam("CategoryName") String CategoryName, @RequestParam("ProductPrice") int ProductPrice, @RequestParam("ProductExpiry") String ProductExpiry, @RequestParam("ProductQuantity") int ProductQuantity, @RequestParam("ProductDescription") String ProductDescription, @RequestParam("ProductImage") String ProductImage, String[] args) {
        try {
            Connection connection = DriverManager.getConnection(data_url, data_username, data_password);
            Statement sql = connection.createStatement();
            ResultSet cat = sql.executeQuery("SELECT * FROM CATEGORY WHERE CATEGORY_NAME = '" + CategoryName + "';");
            if (cat.next()) {
                int ProductCategory = cat.getInt(1);
                PreparedStatement sqlIn = connection.prepareStatement("INSERT INTO PRODUCT(PRODUCT_NAME, PRODUCT_IMAGE, PRODUCT_CATEGORY, PRODUCT_QUANTITY, PRODUCT_PRICE, PRODUCT_EXPIRY, PRODUCT_DESCRIPTION) values(?, ?, ?, ?, ?, ?, ?);");
                sqlIn.setString(1, ProductName);
                sqlIn.setString(2, ProductImage);
                sqlIn.setInt(3, ProductCategory);
                sqlIn.setInt(4, ProductQuantity);
                sqlIn.setInt(5, ProductPrice);
                sqlIn.setString(6, ProductExpiry);
                sqlIn.setString(7, ProductDescription);
                sqlIn.executeUpdate();
            }
        } catch (Exception exp) {
            System.out.println("Exception : " + exp);
        }
        return "redirect:/Admin/Product";
    }


    @GetMapping("/Admin/Customer")
    public String DetailUser(String[] args) {
        return "DisplayUser";
    }

    @GetMapping("/Admin/Orders")
    public String DetailOrder(String[] args) {
        return "Orders";
    }


    @GetMapping("DisplayProfile")
    public String DisplayProfile(Model model, String[] args) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(data_url, data_username, data_password);
            Statement sql = connection.createStatement();
            ResultSet result = sql.executeQuery("SELECT * FROM USERS WHERE USERNAME = '" + User_Name + "';");

            if (result.next()) {
                int UserId = result.getInt(1);
                String Email = result.getString(2);
                String UserName = result.getString(3);
                String Address = result.getString(5);
                model.addAttribute("UserId", UserId);
                model.addAttribute("Email", Email);
                model.addAttribute("UserName", UserName);
                model.addAttribute("Address", Address);
            }
        } catch (Exception exp) {
            System.out.println("Exception : " + exp);
        }
        return "UpdateProfile";
    }


    @RequestMapping(value = "UpdateUser", method = RequestMethod.POST)
    public String UserProfileUpdate(@RequestParam("OldName") String OldName, @RequestParam("NewName") String NewName, @RequestParam("Email") String Email, @RequestParam("Address") String Address, String[] args) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(data_url, data_username, data_password);

//            MessageDigest hash = MessageDigest.getInstance("MD5");
//            byte[] md = hash.digest(Password.getBytes());
//            BigInteger num = new BigInteger(1, md);
//            String ht = num.toString(16);
//            while (ht.length() < 32)
//            {
//                ht = "0" + ht;
//            }
            PreparedStatement sql = connection.prepareStatement("UPDATE USERS SET EMAIL= ?, USERNAME = ?, ADDRESS = ? WHERE USERNAME = ?;");
            sql.setString(1, Email);
            sql.setString(2, NewName);
            sql.setString(3, Address);
            sql.setString(4, OldName);
            sql.executeUpdate();
            User_Name = NewName;
        } catch (Exception exp) {
            System.out.println("Exception : " + exp);
        }
        return "redirect:/Index";
    }
}
