<%-- 
    Document   : userInfomation
    Created on : Dec 2, 2016, 10:44:41 PM
    Author     : WindyKiss
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="jdbc.DbContext"%>
<%@include file="included/header.jsp" %>

<%@include file="included/body.jsp" %>
<%    DbContext db = new DbContext();
    String query = "SELECT * FROM UserInfomation WHERE userID=" + session.getAttribute("userID");
    System.out.println(query);
    String fullname = "", email = "", firstName = "", lastName = "", phone = "", lastEducation = "", address = "", aboutYourSelf = "", dob = "";
    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd MMM,yyyy");
    try {
        ResultSet rs = db.executeQuery(query);
        while (rs.next()) {
            email = rs.getString(2) != null ? rs.getString(2) : "...";
            firstName = rs.getString(3) != null ? rs.getString(3) : "...";
            lastName = rs.getString(4) != null ? rs.getString(4) : "...";
            dob = rs.getDate(5) != null ? simpleDateFormat.format(rs.getDate(5)) : "...";
            phone = rs.getString(6) != null ? rs.getString(6) : "...";
            lastEducation = rs.getString(7) != null ? rs.getString(7) : "...";
            address = rs.getString(8) != null ? rs.getString(8) : "...";
            aboutYourSelf = rs.getString(9) != null ? rs.getString(9) : "...";
            fullname = firstName + " " + lastName;
        }
        db.close();

    } catch (Exception e) {
        System.out.println(e);
    }
%>

<%
    int count = 0;
    String tmpQuery = "WITH T AS (SELECT *,ROW_NUMBER() OVER (ORDER BY jobID ASC) AS SNO FROM AppliedJob WHERE userID = " + userID + ") SELECT MAX(SNO) FROM T";
    db = new DbContext();
    try {
        ResultSet rs = db.executeQuery(tmpQuery);

        while (rs.next()) {
            count = rs.getInt(1);
        }
        db.close();
    } catch (Exception e) {
    }
%>
<section class="dashboard parallex">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12 nopadding">
                <div class="dashboard-header">
                    <div class="col-md-6 col-sm-5 col-xs-12">
                        <div class="user-avatar ">
                            <img src="images/users/ava.png" alt="" class="img-responsive center-block "></a>
                            <h3><%=fullname%></h3>
                        </div>
                    </div>

                    <div class="col-md-3 col-sm-3 col-xs-12">
                        <div class="rad-info-box rad-txt-success">
                            <i class="icon icon-aperture"></i>
                            <span class="title-dashboard">Jobs Applied</span>
                            <span class="value"><span><%=count%></span></span>
                        </div>
                    </div>
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
                                <li class="active">
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
                                <li>
                                    <a href="jobApplied.jsp"> <i class="fa  fa-list-ul"></i> Jobs Applied</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-8 col-sm-8 col-xs-12">
                    <div class="job-short-detail">
                        <div class="heading-inner">
                            <p class="title">Profile detail</p>
                        </div>
                        <dl>
                            <dt>First Name:</dt>
                            <dd><%=firstName%></dd>

                            <dt>Father Name:</dt>
                            <dd><%=lastName%></dd>

                            <dt>Date Of Birth:</dt>
                            <dd><%=dob%></dd>

                            <dt>Phone:</dt>
                            <dd><%=phone%></dd>

                            <dt>Email:</dt>
                            <dd><%=email%></dd>

                            <dt>Last Education:</dt>
                            <dd><%=lastEducation%></dd>

                            <dt>Address:</dt>
                            <dd><%=address%> </dd>

                        </dl>
                    </div>

                    <div class="heading-inner">
                        <p class="title">Some Line About Me</p>
                    </div>
                    <p><%=aboutYourSelf%></p>

                </div>
            </div>
        </div>
    </div>
</section>
<div class="brand-logo-area clients-bg">
    <div class="clients-list light-blue">
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