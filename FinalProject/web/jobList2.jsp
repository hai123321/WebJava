<%-- 
    Document   : jobList2
    Created on : Dec 2, 2016, 5:08:13 PM
    Author     : WindyKiss
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="jdbc.DbContext"%>
<%@include file="included/header.jsp" %>

<%@include file="included/body.jsp" %>

<%    String loctaion = (String) request.getParameter("loctaion");
    String category = (String) request.getParameter("category");
    String jobType = (String) request.getParameter("jobType");
    String experience = (String) request.getParameter("experience");
    String salary = (String) request.getParameter("salary");

%>

<%    int count = 1;
    int max = 0;
    String tmpQuery = "WITH T AS (SELECT *,ROW_NUMBER() OVER (ORDER BY title ASC) AS SNO FROM InOrderJob WHERE "
            + "location LIKE '%" + loctaion + "%' AND "
            + "category LIKE '%" + category + "%' AND "
            + "type LIKE '%" + jobType + "%' AND "
            + "experience LIKE '%" + experience + "%' AND "
            + "salary LIKE '%" + salary + "%' AND visible = 1) SELECT MAX(SNO) FROM T";
    DbContext db = new DbContext();
    try {
        ResultSet rs = db.executeQuery(tmpQuery);

        while (rs.next()) {
            max = rs.getInt(1);
        }
        db.close();
    } catch (Exception e) {
    }

    String query = "WITH T AS (SELECT *,ROW_NUMBER() OVER (ORDER BY title ASC) AS SNO FROM InOrderJob WHERE "
            + "location LIKE '%" + loctaion + "%' AND "
            + "category LIKE '%" + category + "%' AND "
            + "type LIKE '%" + jobType + "%' AND "
            + "experience LIKE '%" + experience + "%' AND "
            + "salary LIKE '%" + salary + "%' AND visible = 1) SELECT * FROM T WHERE SNO = ";

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
                <div class="col-md-9 col-sm-12 col-xs-12">
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
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="all-jobs-list-box2">
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
                                        String salar = rs.getString(7);

                        %>
                        <div class="job-box job-box-2">
                            <div class="col-md-2 col-sm-2 col-xs-12 hidden-sm hidden-xs">
                                <div class="comp-logo">
                                    <a href="jobDetail.jsp?jobid=<%=jobID%>&canApply=1"><img src="images/company/5.png" class="img-responsive" alt="scriptsbundle"> </a>
                                </div>

                            </div>
                            <div class="col-md-10 col-sm-10 col-xs-12">
                                <div class="job-title-box">
                                    <a href="jobDetail.jsp?jobid=<%=jobID%>&canApply=1">
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
                                <p><a href="jobDetail.jsp?jobid=<%=jobID%>&canApply=1">Read More</a> </p>
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
                            }
                        %>

                    </div>
                    <div class="col-md-12 col-sm-12 col-xs-12 nopadding">
                        <div class="pagination-box clearfix">
                            <ul class="pagination">
                                <li>
                                    <a href="jobList2.jsp?loctaion=<%=loctaion%>&category=<%=category%>&jobType=<%=jobType%>&experience=<%=experience%>&salary=<%=salary%>&count=<%=(count - 10)%>" aria-label="Previous"> <span aria-hidden="true">«</span> </a>
                                </li>
                                <%
                                    for (int i = 1; i <= max / 10 + 1; i++) {
                                        if (i == count / 10 + 1) {
                                %>

                                <li class="active"><a href="jobList2.jsp?loctaion=<%=loctaion%>&category=<%=category%>&jobType=<%=jobType%>&experience=<%=experience%>&salary=<%=salary%>&count=<%=(i * 10 - 9)%>"><%=i%></a></li>
                                    <%
                                    } else {
                                    %>
                                <li><a href="jobList2.jsp?loctaion=<%=loctaion%>&category=<%=category%>&jobType=<%=jobType%>&experience=<%=experience%>&salary=<%=salary%>&count=<%=(i * 10 - 9)%>"><%=i%></a></li>
                                    <%
                                            }
                                        }
                                    %>
                                <li>
                                    <a href="jobList2.jsp?loctaion=<%=loctaion%>&category=<%=category%>&jobType=<%=jobType%>&experience=<%=experience%>&salary=<%=salary%>&count=<%=(count + 10)%>" aria-label="Next"> <span aria-hidden="true">»</span> </a>
                                </li>
                            </ul>
                        </div>
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