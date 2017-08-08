package com.java;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AdminDao", urlPatterns = {"/AdminDao"})
public class AdminDao extends HttpServlet {
    PrintWriter out;
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        out=response.getWriter();
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/HospitalManagement","root","");
            String Name=request.getParameter("Admin_name");
            String Pass=request.getParameter("Password");
            String sql="select * from Admin_Table where Name=? and Password=?";
            ps=con.prepareStatement(sql);
            ps.setString(1,Name);
            ps.setString(2,Pass);
            ps.executeQuery();
            rs = ps.executeQuery();
            if (rs.next()) 
            {       
                response.sendRedirect("AdminHome.jsp");
            }
            else 
            {
                response.sendRedirect("InvalidPassword.jsp");
            }
        }
        catch(Exception e)
        {
            out.println(e);
        }
        finally
        {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(AdminDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        }
    }


