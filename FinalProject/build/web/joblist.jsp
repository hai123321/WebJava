<%-- 
    Document   : joblist
    Created on : Dec 2, 2016, 10:47:16 AM
    Author     : WindyKiss
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="jdbc.DbContext"%>
<%@include file="included/header.jsp" %>

<%@include file="included/body.jsp" %>
<%    String tags = (String) request.getParameter("tags");
    String category = (String) request.getParameter("category");

    int count = 1;
    int max = 0;

    int countWeb = 0;
    int countDesktop = 0;
    int countMobile = 0;

    String tmpQuery = "WITH T AS (SELECT *,ROW_NUMBER() OVER (ORDER BY title ASC) AS SNO FROM InOrderJob WHERE tag LIKE '%" + tags + "%' AND category LIKE '%" + category + "%'" + " AND visible = 1) SELECT MAX(SNO) FROM T";
    DbContext db = new DbContext();
    try {
        ResultSet rs = db.executeQuery(tmpQuery);

        while (rs.next()) {
            max = rs.getInt(1);
        }
        db.close();
    } catch (Exception e) {
    }

    tmpQuery = "WITH T AS (SELECT *,ROW_NUMBER() OVER (ORDER BY title ASC) AS SNO FROM InOrderJob WHERE category LIKE '%Web Applications%' AND visible = 1) SELECT MAX(SNO) FROM T";
    db = new DbContext();
    try {
        ResultSet rs = db.executeQuery(tmpQuery);

        while (rs.next()) {
            countWeb = rs.getInt(1);
        }
        db.close();
    } catch (Exception e) {
    }

    tmpQuery = "WITH T AS (SELECT *,ROW_NUMBER() OVER (ORDER BY title ASC) AS SNO FROM InOrderJob WHERE category LIKE '%Desktop Applications%' AND visible = 1) SELECT MAX(SNO) FROM T";
    db = new DbContext();
    try {
        ResultSet rs = db.executeQuery(tmpQuery);

        while (rs.next()) {
            countDesktop = rs.getInt(1);
        }
        db.close();
    } catch (Exception e) {
    }

    tmpQuery = "WITH T AS (SELECT *,ROW_NUMBER() OVER (ORDER BY title ASC) AS SNO FROM InOrderJob WHERE category LIKE '%Mobile Applications%' AND visible = 1) SELECT MAX(SNO) FROM T";
    db = new DbContext();
    try {
        ResultSet rs = db.executeQuery(tmpQuery);

        while (rs.next()) {
            countMobile = rs.getInt(1);
        }
        db.close();
    } catch (Exception e) {
    }

    String query = "WITH T AS (SELECT *,ROW_NUMBER() OVER (ORDER BY title ASC) AS SNO FROM InOrderJob WHERE tag LIKE '%" + tags + "%' AND category LIKE '%" + category + "%'" + " AND visible = 1) SELECT * FROM T WHERE SNO = ";

    if (request.getParameter("count") != null) {
        count = Integer.parseInt(request.getParameter("count"));
        if (count < 1) {
            count = 1;
        }
        if (count > max) {
            count = (max / 10 + 1) * 10 - 9;
        }       
    }

    int now = (max - count) > 10 ? 10 : (max - count + 1);
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
                <div class="col-md-8 col-sm-12 col-xs-12">
                    <%
                        if (max < 11) {

                    %>
                    <h4 class="search-result-text">Showing <%=max%> of <%=max%> available job(s)</h4>
                    <%
                    } else {
                    %>
                    <h4 class="search-result-text">Showing <%=now%> of <%=max%> available job(s)</h4>
                    <%
                        }
                    %>
                </div>
                <div class="col-md-8 col-sm-12 col-xs-12">
                    <div class="all-jobs-list-box">
                        <%                for (int i = count; i < count + 10; i++) {
                                tmpQuery = query + i;
                                db = new DbContext();
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

                        %>
                        <div class="job-box">
                            <div class="col-md-2 col-sm-2 col-xs-12 hidden-xs hidden-sm">
                                <div class="comp-logo">
                                    <a href="jobDetail.jsp?jobid=<%=jobID%>&canApply=1"> <img src="images/company/1.png" class="img-responsive" alt="scriptsbundle"></a>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-12 nopadding">
                                <div class="job-title-box">
                                    <a href="jobDetail.jsp?jobid=<%=jobID%>&canApply=1">
                                        <div class="job-title"><%=title%></div>
                                    </a>
                                    <a><span class="comp-name"><%=detail%></span></a>
                                </div>
                            </div>
                            <%
                                if (type.equalsIgnoreCase("Remote")) {
                            %>
                            <div class="col-md-2 col-sm-3 col-xs-6">
                                <a>
                                    <div class="job-type jt-remote-color">
                                        <i class="fa fa-clock-o"></i> Remote
                                    </div>
                                </a>
                            </div>

                            <%
                                }
                            %>

                            <%
                                if (type.equalsIgnoreCase("Full Time")) {
                            %>
                            <div class="col-md-2 col-sm-3 col-xs-6">
                                <a>
                                    <div class="job-type jt-full-time-color">
                                        <i class="fa fa-clock-o"></i> Full Time
                                    </div>
                                </a>
                            </div>

                            <%
                                }
                            %>

                            <%
                                if (type.equalsIgnoreCase("Part Time")) {
                            %>
                            <div class="col-md-2 col-sm-3 col-xs-6">
                                <a>
                                    <div class="job-type jt-part-time-color">
                                        <i class="fa fa-clock-o"></i> Part Time
                                    </div>
                                </a>
                            </div>

                            <%
                                }
                            %>

                            <%
                                if (type.equalsIgnoreCase("Freelancer")) {
                            %>
                            <div class="col-md-2 col-sm-3 col-xs-6">
                                <a>
                                    <div class="job-type jt-intern-color">
                                        <i class="fa fa-clock-o"></i> Freelancer
                                    </div>
                                </a>
                            </div>

                            <%
                                }
                            %>
                            <div class="col-md-2 col-sm-2 col-xs-12 nopadding">
                                <a href="AddOfferListServlet?jobID=<%=jobID%>">
                                    <button class="btn btn-primary btn-custom">Apply Now</button>
                                </a>
                            </div>
                        </div>

                        <%
                                    }
                                    db.close();
                                } catch (Exception e) {

                                }
                            }
                        %>

                    </div>
                    <div class="col-md-12 col-sm-12 col-xs-12 nopadding">
                        <div class="pagination-box clearfix">
                            <ul class="pagination">
                                <li>
                                    <a href="joblist.jsp?tags=<%=tags%>&category=<%=category%>&count=<%=(count - 10)%>" aria-label="Previous"> <span aria-hidden="true">«</span> </a>
                                </li>
                                <%
                                    for (int i = 1; i <= max / 10 + 1; i++) {
                                        if (i == count / 10 + 1) {
                                %>

                                <li class="active"><a href="joblist.jsp?tags=<%=tags%>&category=<%=category%>&count=<%=(i * 10 - 9)%>"><%=i%></a></li>
                                    <%
                                    } else {
                                    %>
                                <li><a href="joblist.jsp?tags=<%=tags%>&category=<%=category%>&count=<%=(i * 10 - 9)%>"><%=i%></a></li>
                                    <%
                                            }
                                        }
                                    %>

                                <li>
                                    <a href="joblist.jsp?tags=<%=tags%>&category=<%=category%>&count=<%=(count + 10)%>" aria-label="Next"> <span aria-hidden="true">»</span> </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-12 col-xs-12">
                    <aside>
                        <div class="widget">
                            <div class="widget-heading"><span class="title">Hot Categories</span></div>
                            <ul class="categories-module">
                                <li> <a href="joblist.jsp?tags=&category=Web+Applications"> Web Applications <span>(<%=countWeb%>)</span> </a> </li>
                                <li> <a href="joblist.jsp?tags=&category=Desktop+Applications"> Desktop Applications <span>(<%=countDesktop%>)</span> </a> </li>
                                <li> <a href="joblist.jsp?tags=&category=Mobile+Applications"> Mobile Applications<span>(<%=countMobile%>)</span> </a> </li>
                            </ul>
                        </div>
                        <div class="widget">
                            <div class="widget-heading"><span class="title">Hot Jobs</span></div>
                            <ul class="related-post">
                                <li>
                                    <a href="#">Assistant Manager Procurement </a>
                                    <span><i class="fa fa-map-marker"></i>Managgo, WC </span>
                                    <span><i class="fa fa-calendar"></i>March 22, 2015 - Apr 07, 2016 </span>
                                </li>
                                <li>
                                    <a href="#">Marketing Professionals Required</a>
                                    <span><i class="fa fa-map-marker"></i>Homelando, New Vage </span>
                                    <span><i class="fa fa-calendar"></i>Sep 01, 2015 - Aug 09, 2016</span>
                                </li>
                                <li>
                                    <a href="#">Mobile App Programmers </a>
                                    <span><i class="fa fa-map-marker"></i>Homelando, New Vage </span>
                                    <span><i class="fa fa-calendar"></i>Feb 01, 2015 - March 09, 2016 </span>
                                </li>
                                <li>
                                    <a href="#">General Compliance Officer</a>
                                    <span><i class="fa fa-map-marker"></i>Arlington, VA </span>
                                    <span><i class="fa fa-calendar"></i>Jun 01, 2015 - Feb 09, 2016</span>
                                </li>
                                <li>
                                    <a href="#">Call Centre Manager</a>
                                    <span><i class="fa fa-map-marker"></i>Managgo, WC  </span>
                                    <span><i class="fa fa-calendar"></i>Feb 01, 2015 - March 09, 2016</span>
                                </li>
                                <li>
                                    <a href="#">Assistant Manager Audit</a>
                                    <span><i class="fa fa-map-marker"></i>Heling, WC </span>
                                    <span><i class="fa fa-calendar"></i>Aug 01, 2015 - Sep 09, 2016 </span>
                                </li>
                                <li>
                                    <a href="#">Telesales Agent (UK Dialing)</a>
                                    <span><i class="fa fa-map-marker"></i>Somro, New </span>
                                    <span><i class="fa fa-calendar"></i>Sep 01, 2015 - Nov 09, 2016</span>
                                </li>
                                <li>
                                    <a href="#">Assistant Brand Manager</a>
                                    <span><i class="fa fa-map-marker"></i>Heritage, VA </span>
                                    <span><i class="fa fa-calendar"></i>Dec 01, 2015 - May 09, 2016</span>
                                </li>
                            </ul>
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