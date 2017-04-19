<%-- 
    Document   : jobReportDetail
    Created on : Dec 7, 2016, 11:00:18 PM
    Author     : WindyKiss
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="jdbc.DbContext"%>
<%@include file="included/header.jsp" %>

<%@include file="included/adminBody.jsp" %>

<%    DbContext db = new DbContext();
    String jobID = request.getParameter("jobid");
    String canReport = request.getParameter("canReport");
    String query = "SELECT * FROM InOrderJob JOIN UserInfomation ON InOrderJob.userID = UserInfomation.userID WHERE InOrderJob.jobID = " + jobID;
    System.out.println(query);
    String title = "", location = "", type = "", exp = "", salary = "", detail = "";
    String email = "", fullname = "", phone = "", address = "";
    try {
        ResultSet rs = db.executeQuery(query);
        while (rs.next()) {
            title = rs.getString(2) != null ? rs.getString(2) : "...";
            location = rs.getString(3) != null ? rs.getString(3) : "...";
            type = rs.getString(5) != null ? rs.getString(5) : "...";
            exp = rs.getString(6) != null ? rs.getString(6) : "...";
            salary = rs.getString(7) != null ? rs.getString(7) : "...";
            detail = rs.getString(9) != null ? rs.getString(9) : "...";
            
            email = rs.getString(13) != null ? rs.getString(13) : "...";
            String firstName = rs.getString(14) != null ? rs.getString(14) : "...";
            String lastName = rs.getString(15) != null ? rs.getString(15) : "...";
            fullname = firstName + " " + lastName;
            phone = rs.getString(17) != null ? rs.getString(17) : "...";
            address = rs.getString(19) != null ? rs.getString(19) : "...";

        }
        db.close();
        

    } catch (Exception e) {
        System.out.println(e);
    }
%>
        <section class="single-job-section">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="col-md-8 col-sm-8 col-xs-12">
                            <div class="single-job-page-2 job-short-detail">
                                <div class="heading-inner">
                                    <p class="title"><%=title%></p>
                                </div>
                                <div class="job-desc job-detail-boxes">
                                    <p>
                                        <%=detail%>
                                    </p>
                                </div>

                            </div>
                        </div>
                        <div class="col-md-4 col-sm-4 col-xs-12">
                            <div class="widget">
                                <div class="widget-heading"><span class="title">Short Discription</span></div>
                                <ul class="short-decs-sidebar">
                                    <li>
                                        <div>
                                            <h4>Job Type:</h4></div>
                                        <div><i class="fa fa-bars"></i><%=type%></div>
                                    </li>
                                    <li>
                                        <div>
                                            <h4>Job Experience:</h4></div>
                                        <div><i class="fa fa-clock-o"></i><%=exp%></div>
                                    </li>
                                    <li>
                                        <div>
                                            <h4>Location:</h4></div>
                                        <div><i class="fa fa-location-arrow"></i><%=location%></div>
                                    </li>
                                    <li>
                                        <div>
                                            <h4>Expected Salary:</h4></div>
                                        <div><i class="fa fa-dollar"></i><%=salary%></div>
                                    </li>
                                </ul>
                            </div>
                            <aside>
                                <%
                                    if(canReport.equals("1")){
                                        
                                %>
                                <div class="apply-job">
                                    <a class="btn btn-default" href="BanJobServlet?jobID=<%=jobID%>"><i class="fa fa-recycle"></i>Ban this Job</a>
                                </div>
                                
                                <%
                                    }
                                %>
                                <div class="company-detail">
                                    <div class="company-img">
                                        <img src="images/company/logo2.png" class="img-responsive" alt="">
                                    </div>
                                    <div class="company-contact-detail">
                                        <table>
                                            <tr>
                                                <th>Name:</th>
                                                <td><%=fullname%></td>
                                            </tr>
                                            <tr>
                                                <th>Email:</th>
                                                <td><%=email%></td>
                                            </tr>
                                            <tr>
                                                <th>Phone:</th>
                                                <td><%=phone%></td>
                                            </tr>
                                            <tr>
                                                <th>Address:</th>
                                                <td><%=address%></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </aside>

                        </div>
                    </div>
                </div>
            </div>
        </section>

        <div class="brand-logo-area clients-bg">
            <div class="clients-list">
                <div class="client-logo">
                    <a href="#"><img src="images/clients/client_1.png" class="img-responsive" alt="Brand Image" /></a>
                </div>
                <div class="client-logo">
                    <a href="#"><img src="images/clients/client_2.png" class="img-responsive" alt="Brand Image" /></a>
                </div>
                <div class="client-logo">
                    <a href="#"><img src="images/clients/client_3.png" class="img-responsive" alt="Brand Image" /></a>
                </div>
                <div class="client-logo">
                    <a href="#"><img src="images/clients/client_4.png" class="img-responsive" alt="Brand Image" /></a>
                </div>
                <div class="client-logo">
                    <a href="#"><img src="images/clients/client_1.png" class="img-responsive" alt="Brand Image" /></a>
                </div>
                <div class="client-logo">
                    <a href="#"><img src="images/clients/client_2.png" class="img-responsive" alt="Brand Image" /></a>
                </div>
                <div class="client-logo">
                    <a href="#"><img src="images/clients/client_3.png" class="img-responsive" alt="Brand Image" /></a>
                </div>
                <div class="client-logo">
                    <a href="#"><img src="images/clients/client_4.png" class="img-responsive" alt="Brand Image" /></a>
                </div>
            </div>
        </div>

        <%@include file="included/footer.jsp" %>


</body>

</html>
