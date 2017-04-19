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
public class EditCVServlet extends HttpServlet {

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

            String eduTitle = request.getParameter("eduTitle");
            String eduStartDate = request.getParameter("eduStartDate");
            String eduEndDate = request.getParameter("eduEndDate");
            String eduDescription = request.getParameter("eduDescription");
            String jobPosition = request.getParameter("jobPosition");
            String jobStartDate = request.getParameter("jobStartDate");
            String jobEndDate = request.getParameter("jobEndDate");
            String jobDescription = request.getParameter("jobDescription");
            String skill = request.getParameter("skill");
            System.out.println(eduTitle+"=======" + eduStartDate +"=====" +eduEndDate);
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date dateEduStartDate = null;
            Date dateEduEndDate = null;
            Date dateJobStartDate = null;
            Date dateJobEndDate = null;
            try {
                dateEduStartDate = new Date(simpleDateFormat.parse(eduStartDate).getTime());
                dateEduEndDate = new Date(simpleDateFormat.parse(eduEndDate).getTime());
                dateJobStartDate = new Date(simpleDateFormat.parse(jobStartDate).getTime());
                dateJobEndDate = new Date(simpleDateFormat.parse(jobEndDate).getTime());
            } catch (ParseException ex) {
                Logger.getLogger(EditProfileInformationServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                String query = "UPDATE UserWorkInfomation SET "
                        + "eduTitle=? , eduStartDate=?, eduEndDate=?, eduDescription=?, "
                        + "jobPosition=?, jobStartDate=?, jobEndDate=?, jobDescription=?, skill=? "
                        + "WHERE userID=?";
                PreparedStatement preparedStatement = db.executeQueryPre(query);
                preparedStatement.setString(1, eduTitle);
                preparedStatement.setDate(2, dateEduStartDate);
                preparedStatement.setDate(3, dateEduEndDate);
                preparedStatement.setString(4, eduDescription);
                preparedStatement.setString(5, jobPosition);
                preparedStatement.setDate(6, dateJobStartDate);
                preparedStatement.setDate(7, dateJobEndDate);
                preparedStatement.setString(8, jobDescription);
                preparedStatement.setString(9, skill);
                
                preparedStatement.setInt(10, (Integer) request.getSession(true).getAttribute("userID"));
                
                preparedStatement.executeUpdate();
                
                request.getSession(true).setAttribute("position", !jobPosition.equals("") ? jobPosition : "...");

                db.close();

            } catch (Exception e) {
                System.out.println(e);
            }
            /* TODO output your page here. You may use following sample code. */

            response.sendRedirect("userEditCV.jsp");
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
