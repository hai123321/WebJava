<%-- 
    Document   : jobApplied
    Created on : Dec 5, 2016, 11:06:42 PM
    Author     : WindyKiss
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="jdbc.DbContext"%>
<%@include file="included/header.jsp" %>

<%@include file="included/body.jsp" %>

<%    
    String tmpQuery = "SELECT * FROM AppliedJob a JOIN InOrderJob i ON a.jobID = i.jobID WHERE a.userID = " + userID;
%>

<section class="job-breadcrumb">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-sm-7 co-xs-12 text-left">
                <h3>Build Resume</h3>
            </div>
            <div class="col-md-6 col-sm-5 co-xs-12 text-right">
                <div class="bread">
                    <ol class="breadcrumb">
                        <li><a href="indes.jsp">Home</a> </li>
                        <li class="active">Job Applied</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="dashboard-body">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="col-md-4 col-sm-4 col-xs-12">
                    <%@include file="included/leftBarUserInformation.jsp" %>
                    <div class="profile-nav">
                        <div class="panel">
                            <ul class="nav nav-pills nav-stacked">
                                <li>
                                    <a href="userInfomation.jsp"> <i class="fa fa-user"></i> Profile</a>
                                </li>
                                <li>
                                    <a href="userEditInformation.jsp"> <i class="fa fa-edit"></i> Edit Profile</a>
                                </li>
                                <li>
                                    <a href="userEditCV.jsp"> <i class="fa fa-file-o"></i>Build Resume </a>
                                </li>
                                <li>
                                    <a href="userSavedCV.jsp?applyID=<%=userID%>"> <i class="fa fa-file-o"></i>Saved Resume </a>
                                </li>
                                <li class="active">
                                    <a href="jobApplied.jsp"> <i class="fa  fa-list-ul"></i> Jobs Applied</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-8 col-sm-8 col-xs-12">

                    <div class="heading-inner first-heading">
                        <p class="title">Job applied</p>
                    </div>
                    <div class="all-jobs-list-box2">

                        <%                            DbContext db = new DbContext();
                            try {
                                ResultSet rs = db.executeQuery(tmpQuery);
                                while (rs.next()) {
                                    int jobID = rs.getInt(1);
                                    String title = rs.getString(4);
                                    String detail = rs.getString(11);
                                    if(detail.length() > 40){
                                            detail = detail.substring(0, 40) + "...";
                                        }
                                    String type = rs.getString(7);
                                    String salar = rs.getString(9);

                        %>

                        <div class="job-box job-box-2">
                            <div class="col-md-2 col-sm-2 col-xs-12 hidden-sm hidden-xs">
                                <div class="comp-logo">
                                    <a href=""><img src="images/company/5.png" class="img-responsive" alt="scriptsbundle"> </a>
                                </div>

                            </div>
                            <div class="col-md-10 col-sm-10 col-xs-12">
                                <div class="job-title-box">
                                    <a href="jobDetail.jsp?jobid=<%=jobID%>&canApply=0">
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
                                <p><%=detail%><a href="jobDetail.jsp?jobid=<%=jobID%>&canApply=0">Read More</a> </p>
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
</div>
</section>
<%@include file="included/footer.jsp" %>

<!-- FOR THIS PAGE ONLY -->
<script type="text/javascript" src="js/jquery.tagsinput.min.js"></script>
<script type="text/javascript">
    $(".questions-category").select2({
        placeholder: "Select Post Category",
        allowClear: true,
        maximumSelectionLength: 3,
        width: "50%"
    });
    $('#tags').tagsInput({
        width: 'auto'
    });
</script>

</body>

</html>
