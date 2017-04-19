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
public class BanJobServlet extends HttpServlet {

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
            String query;
            int jobID = Integer.parseInt(request.getParameter("jobID"));
            String jobName = "";
            int bannedID = 0;

            query = "SELECT * FROM OfferList JOIN InOrderJob ON InOrderJob.jobID = OfferList.jobID WHERE InOrderJob.jobID=" + jobID;

            try {

                query = "SELECT * FROM InOrderJob WHERE jobID = " + jobID;
                ResultSet rs = db.executeQuery(query);
                while (rs.next()) {
                    bannedID = rs.getInt(11);
                    jobName = rs.getString(2);
                }

                query = "INSERT INTO Notification (userID, date, message, redirect, isRead) VALUES(?, ?, ?, ?, 0)";
                PreparedStatement preparedStatement = db.executeQueryPre(query);
                preparedStatement.setInt(1, 1);
                preparedStatement.setDate(2, new Date(new java.util.Date().getTime()));
                preparedStatement.setString(3, "You have Banned " + jobName);
                preparedStatement.setString(4, "DetailReportServlet?jobID=" + jobID + "&canReport=0");
                preparedStatement.executeUpdate();
                
                
                query = "INSERT INTO Notification (userID, date, message, redirect, isRead) VALUES(?, ?, ?, ?, 0)";
                preparedStatement = db.executeQueryPre(query);
                preparedStatement.setInt(1, bannedID);
                preparedStatement.setDate(2, new Date(new java.util.Date().getTime()));
                preparedStatement.setString(3, "Your " + jobName + "been banned by Admin");
                preparedStatement.setString(4, "DetailJobNotiServlet?jobID="+jobID);
                preparedStatement.executeUpdate();
                
                query = "UPDATE InOrderJob SET visible = 0 WHERE jobID = ?";
                preparedStatement = db.executeQueryPre(query);
                preparedStatement.setInt(1, jobID);
                preparedStatement.executeUpdate();

                db.close();

            } catch (Exception e) {
                System.out.println(e.toString());
            }
            /* TODO output your page here. You may use following sample code. */

            response.sendRedirect("index.jsp");

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
