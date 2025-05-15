package org.example;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/CreateUserServlet")
public class CreateUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || !"admin".equals(session.getAttribute("role"))) {
            // Block non-admin access
            response.sendRedirect("login.jsp");
            return;
        }

        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdb", "root", "");

            String sql = "INSERT INTO users (fullname, email, password, role) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, fullname);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setString(4, role);
            ps.executeUpdate();

            session.setAttribute("message1", "New admin created successfully.");
            response.sendRedirect("create_admin.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("message1", "Error creating admin.");
            response.sendRedirect("create_admin.jsp");
        }
    }
}

