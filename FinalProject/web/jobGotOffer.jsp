<%-- 
    Document   : jobGotOffer
    Created on : Dec 5, 2016, 10:13:17 PM
    Author     : WindyKiss
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="jdbc.DbContext"%>
<%@include file="included/header.jsp" %>

<%@include file="included/body.jsp" %>


<%   
    String tmpQuery = "SELECT * FROM InOrderJob WHERE visible = 1 AND jobID IN (SELECT jobID FROM OfferList WHERE userID = "+ userID + " )";

%>
<section class="breadcrumb-search parallex">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12 nopadding">
                <div class="col-md-8 col-sm-12 col-md-offset-2 col-xs-12 nopadding">
                    <div class="search-form-contaner">
                        <form class="form-inline" action="joblist.jsp" method="POST">
                            <div class="col-md-7 col-sm-4 col-xs-12 nopadding">
                                <div class="form-group">

                                    <input type="text" class="form-control" name="tags" placeholder="Search Keyword" value="">
                                    <i class="icon-magnifying-glass"></i>
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-12 nopadding">
                                <div class="form-group">
                                    <select class="select-category form-control" name="category" required>
                                        <option label="Select Option"></option>
                                        <option value="Web Applications">Web Applications</option>
                                        <option value="Desktop Applications">Desktop Applications</option>
                                        <option value="Mobile Applications">Mobile Applications</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-12 nopadding">
                                <div class="form-group form-action">
                                    <button type="submit" class="btn btn-primary btn-search-submit">Search</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="categories-list-page light-grey">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12 nopadding">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="all-jobs-list-box2">
                        <%
                            DbContext db = new DbContext();
                            try {
                                ResultSet rs = db.executeQuery(tmpQuery);
                                while (rs.next()) {
                                    int jobID = rs.getInt(1);
                                    String title = rs.getString(2);
                                    String detail = rs.getString(9);
                                    if(detail.length() > 40){
                                            detail = detail.substring(0, 40) + "...";
                                        }
                                    String type = rs.getString(5);
                                    String salar = rs.getString(7);


                        %>
                        <div class="job-box job-box-2">
                            <div class="col-md-2 col-sm-2 col-xs-12 hidden-sm hidden-xs">
                                <div class="comp-logo">
                                    <a href="offerList.jsp?jobID=<%=jobID%>"><img src="images/company/5.png" class="img-responsive" alt="scriptsbundle"> </a>
                                </div>

                            </div>
                            <div class="col-md-10 col-sm-10 col-xs-12">
                                <div class="job-title-box">
                                    <a href="offerList.jsp?jobID=<%=jobID%>">
                                        <div class="job-title"><%=title%></div>
                                    </a>
                                    <a ><span class="comp-name"><%=detail%></span></a>

                                    <%
                                        if (type.equalsIgnoreCase("Remote")) {
                                    %>
                                    <a class="job-type jt-remote-color">
                                        <i class="fa fa-clock-o"></i> Remote
                                    </a>
                                    <%
                                        }
                                    %>

                                    <%
                                        if (type.equalsIgnoreCase("Full Time")) {
                                    %>
                                    <a class="job-type jt-full-time-color">
                                        <i class="fa fa-clock-o"></i> Full Time
                                    </a>
                                    <%
                                        }
                                    %>

                                    <%
                                        if (type.equalsIgnoreCase("Part Time")) {
                                    %>
                                    <a class="job-type jt-part-time-color">
                                        <i class="fa fa-clock-o"></i> Part Time
                                    </a>
                                    <%
                                        }
                                    %>

                                    <%
                                        if (type.equalsIgnoreCase("Freelancer")) {
                                    %>
                                    <a class="job-type jt-intern-color">
                                        <i class="fa fa-clock-o"></i> Freelancer
                                    </a>
                                    <%
                                        }
                                    %>
                                </div>
                                <p><%=detail%><a href="offerList.jsp?jobID=<%=jobID%>">See Offer List</a> </p>
                            </div>
                            <div class="job-salary">
                                <i class="fa fa-money"></i> <%=salar%>
                            </div>
                        </div>
                        <%
                                    }
                                    db.close();
                                } catch (Exception e) {
                                    System.out.println(e);
                                }
                        %>

                    </div>
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
