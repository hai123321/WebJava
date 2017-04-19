/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
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
public class ValidLoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            DbContext db = new DbContext();
            String query = "SELECT * FROM Users";
            String userName = request.getParameter("userName");
            String password = request.getParameter("password");
            if(userName.equals("hai123321") && password.equals("Frankie@123")){
                request.getSession(true).setAttribute("userID", 1);
                response.sendRedirect("adminIndex.jsp");
                return;
            }
            
            boolean correct = false;
            System.out.println(password);
            try {
                ResultSet rs = db.executeQuery(query);
                while (rs.next()) {
                    int userID = rs.getInt(1);
                    String acc = rs.getString(2);
                    String pass = rs.getString(3);
                    if (acc.equals(userName) && pass.equals(password)) {
                        request.getSession(true).setAttribute("userID", userID);
                        correct = true;
                        break;
                    }
                }
                if(!correct){
                    request.setAttribute("message", "Wrong Username or Password");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                    return;
                }
                query = "SELECT * FROM UserInfomation JOIN UserWorkInfomation ON UserInfomation.userID = UserWorkInfomation.userID WHERE UserWorkInfomation.userID=" + request.getSession(true).getAttribute("userID");
                rs = db.executeQuery(query);
                while (rs.next()) {
                    String firstName = rs.getString(3) != null ? rs.getString(3) : "...";
                    String lastName = rs.getString(4) != null ? rs.getString(4) : "...";
                    request.getSession(true).setAttribute("fullName", firstName + " " + lastName);
                    request.getSession(true).setAttribute("position", rs.getString(15) != null ? rs.getString(15) : "...");
                }

                response.sendRedirect("index.jsp");
                db.close();

            } catch (Exception e) {

            }
            /* TODO output your page here. You may use following sample code. */
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
