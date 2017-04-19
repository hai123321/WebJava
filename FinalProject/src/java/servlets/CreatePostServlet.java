/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.Arrays;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jdbc.DbContext;

/**
 *
 * @author WindyKiss
 */
public class CreatePostServlet extends HttpServlet {

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
            
            String title = request.getParameter("title");
            String location = request.getParameter("loctaion");
            String[] category = request.getParameterValues("category");
            String type = request.getParameter("type");
            String exp = request.getParameter("exp");
            String salary = request.getParameter("salary");
            String tags = request.getParameter("tags");
            String detail = request.getParameter("detail");
            int useID = (Integer) request.getSession(true).getAttribute("userID");
            
            
            System.out.println("CreatePostServlet: add Post: " + title +"===="+ location +"===="+
                    Arrays.toString(category) +"===="+ type +"===="
            + exp +"===="+ salary +"===="
            + tags +"===="+ detail +"====");
            try {
                String query = "INSERT INTO InOrderJob "
                + "(title,location, category, type, experience, salary, tag, detail, visible, userID)"
                        + " VALUES(?,?,?,?,?,?,?,?,?,?)";
                PreparedStatement preparedStatement = db.executeQueryPre(query);
                preparedStatement.setString(1, title);
                preparedStatement.setString(2, location);
                preparedStatement.setString(3, Arrays.toString(category));
                preparedStatement.setString(4, type);
                preparedStatement.setString(5, exp);
                preparedStatement.setString(6, salary);
                preparedStatement.setString(7, tags);
                preparedStatement.setString(8, detail);
                preparedStatement.setBoolean(9, true);
                preparedStatement.setInt(10, useID);
                preparedStatement.executeUpdate();
                
                db.close();
                
            } catch (Exception e) {
                System.out.println(e);
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
