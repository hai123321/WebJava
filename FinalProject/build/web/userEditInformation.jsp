<%-- 
    Document   : userEditInformation
    Created on : Dec 2, 2016, 11:39:59 PM
    Author     : WindyKiss
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="jdbc.DbContext"%>
<%@include file="included/header.jsp" %>

<%@include file="included/body.jsp" %>
<%    
    DbContext db = new DbContext();
    String query = "SELECT * FROM UserInfomation WHERE userID=" + userID;
    System.out.println(query);
    String email = "", firstName = "", lastName = "", phone = "", lastEducation = "", address = "", aboutYourSelf = "", dob = "";

    try {
        ResultSet rs = db.executeQuery(query);
        while (rs.next()) {
            email = rs.getString(2) != null ? rs.getString(2) : "...";
            firstName = rs.getString(3) != null ? rs.getString(3) : "...";
            lastName = rs.getString(4) != null ? rs.getString(4) : "...";
            dob = rs.getDate(5) != null ? rs.getDate(5).toString() : "...";
            System.out.println("Date SQL: "+ rs.getDate(5) +"Date Convert: " + dob);
            phone = rs.getString(6) != null ? rs.getString(6) : "...";
            lastEducation = rs.getString(7) != null ? rs.getString(7) : "...";
            address = rs.getString(8) != null ? rs.getString(8) : "...";
            aboutYourSelf = rs.getString(9) != null ? rs.getString(9) : "...";

        }
        db.close();

    } catch (Exception e) {
        System.out.println(e);
    }
%>
<section class="job-breadcrumb">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-sm-7 co-xs-12 text-left">
                <h3>Edit profile</h3>
            </div>
            <div class="col-md-6 col-sm-5 co-xs-12 text-right">
                <div class="bread">
                    <ol class="breadcrumb">
                        <li><a href="index.jsp">Home</a> </li>
                        <li class="active">edit profile</li>
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
                                <li class="active">
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
                    <div class="heading-inner first-heading">
                        <p class="title">Edit Profile</p>
                    </div>
                    <div class="col-md-12 col-sm-12 col-xs-12 nopadding">
                        <div class="profile-edit row">
                            <form action="EditProfileInformationServlet" method="POST">
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label>First Name <span class="required">*</span></label>
                                        <input type="text" placeholder="" class="form-control" name="firstName" value="<%=firstName%>">
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label>Last Name <span class="required">*</span></label>
                                        <input type="text" placeholder="" class="form-control" name="lastName" value="<%=lastName%>">
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label>Date Of Birth <span class="required">*</span></label>
                                        <input type="date" placeholder="" class="form-control" name="dob" value="<%=dob%>" >
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label>Email <span class="required">*</span></label>
                                        <input type="email" placeholder="" class="form-control" name="email" value="<%=email%>">
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label>Phone <span class="required">*</span></label>
                                        <input type="text" placeholder="" class="form-control" name="phone" value="<%=phone%>">
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label>Last Education <span class="required">*</span></label>
                                        <input type="text" placeholder="" class="form-control" name="lastEducation" value="<%=lastEducation%>">
                                    </div>
                                </div>
                                <div class="col-md-12 col-sm-12">
                                    <div class="form-group">
                                        <label>Address <span class="required">*</span></label>
                                        <input type="text" placeholder="" class="form-control" name="address" value="<%=address%>">
                                    </div>
                                </div>
                                <div class="col-md-12 col-sm-12">
                                    <div class="form-group">
                                        <label>About yourSelf <span class="required">*</span></label>
                                        <textarea name="aboutYourSelf" id="ckeditor"><%=aboutYourSelf%></textarea>
                                    </div>
                                </div>
                                <div class="col-md-12 col-sm-12">
                                    <button type="submit" class="btn btn-default pull-right"> Save Profile <i class="fa fa-angle-right"></i></button>
                                </div>
                            </form>
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