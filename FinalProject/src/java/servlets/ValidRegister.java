/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jdbc.DbContext;

/**
 *
 * @author WindyKiss
 */
public class ValidRegister extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public static String EMAIL_REGEX = "(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            DbContext db = new DbContext();
            String query = "SELECT * FROM Users";
            String userName = request.getParameter("userName");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
            if(!userName.matches("^[a-zA-Z0-9]{6,}$")){
                request.setAttribute("message", "Username must be longer than 6 characters and do not contain special character!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }
            
            if(!password.matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}")){
                request.setAttribute("message", "Password must be longer than 8 characters contain at least "
                        + "1 special character, 1 Upercase and 1 number!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }
            
            if (!email.matches(EMAIL_REGEX)) {
                request.setAttribute("message", "Register information is not corrext.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }
            
            try {
                ResultSet rs = db.executeQuery(query);
                while (rs.next()) {
                    String acc = rs.getString(2);
                    System.out.println(acc+"=============================");
                    if (acc.equals(userName)) {
                        request.setAttribute("message", "Your User Name is created. Please Choose another User Name");
                        request.getRequestDispatcher("register.jsp").forward(request, response);
                        return;
                    }
                }
                
                query = "INSERT INTO Users (username,password) VALUES(?,?)";
                PreparedStatement preparedStatement = db.executeQueryPre(query);
                preparedStatement.setString(1, userName);
                preparedStatement.setString(2, password);
                preparedStatement.executeUpdate();
                System.out.println(password+"=============================");
                
                query = "SELECT * FROM Users WHERE username='"+userName+"'";
                int userID = 0;
                rs = db.executeQuery(query);
                while (rs.next()) {
                    userID = rs.getInt(1);
                }
                System.out.println("ValidRegister: ID"+userID);
                
                query = "INSERT INTO UserInfomation(userID, email)"
                        + " VALUES (?,?)";
                preparedStatement = db.executeQueryPre(query);
                preparedStatement.setInt(1, userID);
                preparedStatement.setString(2, email);
                preparedStatement.executeUpdate();
                
                query = "INSERT INTO UserWorkInfomation(userID)"
                        + " VALUES (?)";
                preparedStatement = db.executeQueryPre(query);
                preparedStatement.setInt(1, userID);
                preparedStatement.executeUpdate();
                
                db.close();

            } catch (Exception e) {
                System.out.println(e.toString());
            }
            /* TODO output your page here. You may use following sample code. */

            response.sendRedirect("login.jsp");

        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
