/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jdbc.DbContext;

/**
 *
 * @author WindyKiss
 */
public class EditProfileInformationServlet extends HttpServlet {

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

            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String dob = request.getParameter("dob");
            System.out.println(dob);
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date date = null;
            try {
                date = new Date(simpleDateFormat.parse(dob).getTime());
                System.out.println(date);
            } catch (ParseException ex) {
                Logger.getLogger(EditProfileInformationServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String lastEducation = request.getParameter("lastEducation");
            String address = request.getParameter("address");
            String aboutYourSelf = request.getParameter("aboutYourSelf");
            try {
                String query = "UPDATE UserInfomation SET "
                        + "firstName=? , lastName=?, dateOfBirth=?, phone=?, "
                        + "lastEducation=?, address=?, aboutYourSelf=?, email =? "
                        + "WHERE userID=?";
                PreparedStatement preparedStatement = db.executeQueryPre(query);
                preparedStatement.setString(1, firstName);
                preparedStatement.setString(2, lastName);
                preparedStatement.setDate(3, date);
                preparedStatement.setString(4, phone);
                preparedStatement.setString(5, lastEducation);
                preparedStatement.setString(6, address);
                preparedStatement.setString(7, aboutYourSelf);
                preparedStatement.setString(8, email);
                preparedStatement.setInt(9, (Integer) request.getSession(true).getAttribute("userID"));
                
                request.getSession(true).setAttribute("fullName", firstName + " " + lastName);
                
                preparedStatement.executeUpdate();

                db.close();

            } catch (Exception e) {

            }
            /* TODO output your page here. You may use following sample code. */

            response.sendRedirect("userInfomation.jsp");
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
