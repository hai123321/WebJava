<%-- 
    Document   : userSavedCV
    Created on : Dec 3, 2016, 1:56:01 AM
    Author     : WindyKiss
--%>

<%@page import="java.util.Random"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="jdbc.DbContext"%>
<%@include file="included/header.jsp" %>

<%@include file="included/body.jsp" %>
<%    DbContext db = new DbContext();
    String tmpApplyID = request.getParameter("applyID");
    String query = "SELECT * FROM UserInfomation JOIN UserWorkInfomation ON UserInfomation.userID = UserWorkInfomation.userID WHERE UserWorkInfomation.userID=" + tmpApplyID;
    System.out.println(query);
    String fullName = "", jobPosition = "", email = "", phone = "", address = "", aboutYourSelf = "";
    String eduTitle = "", eduStartDate = "", eduEndDate = "", eduDescription = "", jobStartDate = "", jobEndDate = "", jobDescription = "", skill = "";
    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd MMM,yyyy");
    try {
        ResultSet rs = db.executeQuery(query);
        while (rs.next()) {
            email = rs.getString(2) != null ? rs.getString(2) : "...";
            String firstName = rs.getString(3) != null ? rs.getString(3) : "...";
            String lastName = rs.getString(4) != null ? rs.getString(4) : "...";
            fullName = firstName + " " + lastName;
            phone = rs.getString(6) != null ? rs.getString(6) : "...";
            address = rs.getString(8) != null ? rs.getString(8) : "...";
            aboutYourSelf = rs.getString(9) != null ? rs.getString(9) : "...";
            
            eduTitle = rs.getString(11) != null ? rs.getString(11) : "...";
            eduStartDate = rs.getDate(12) != null ? rs.getDate(12).toString() : "...";
            eduEndDate = rs.getDate(13) != null ? rs.getDate(13).toString() : "...";
            eduDescription = rs.getString(14) != null ? rs.getString(14) : "...";
            jobPosition = rs.getString(15) != null ? rs.getString(15) : "...";
            jobStartDate = rs.getDate(16) != null ? rs.getDate(16).toString() : "...";
            jobEndDate = rs.getDate(17) != null ? rs.getDate(17).toString() : "...";
            jobDescription = rs.getString(18) != null ? rs.getString(18) : "...";
            skill = rs.getString(19) != null ? rs.getString(19) : "software ,laravel, html";

        }
        db.close();
        

    } catch (Exception e) {
        System.out.println(e);
    }
    String[]skillList = skill.split(",");
%>

        <section class="light-grey resume2">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12 nopadding">
                        <div class="col-md-4 col-sm-5 col-xs-12">
                            <div class="profile-photo"><img src="images/users/8.png" alt="" class="img-responsive"></div>
                            <div class="resume-social">
                                <ul class="social-network social-circle onwhite">
                                    <li><a href="#" class="icoFacebook" title="Facebook"><i class="fa fa-facebook"></i></a></li>
                                    <li><a href="#" class="icoTwitter" title="Twitter"><i class="fa fa-twitter"></i></a></li>
                                    <li><a href="#" class="icoGoogle" title="Google +"><i class="fa fa-google-plus"></i></a></li>
                                    <li><a href="#" class="icoLinkedin" title="Linkedin +"><i class="fa fa-linkedin"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-8 col-sm-7 col-xs-12">
                            <div class="profile-info">
                                <h1 class="profile-title"><%=fullName%></h1>
                                <h2 class="profile-position"><%=jobPosition%></h2></div>
                            <ul class="profile-list">

                                <li class="">
                                    <strong class="title">E-mail:</strong>
                                    <span class="cont"><a href="mailto:<%=email%>"><%=email%></a></span>
                                </li>
                                <li class="">
                                    <strong class="title">Phone:</strong>
                                    <span class="cont"><a href="tel:<%=phone%>"><%=phone%></a></span>
                                </li>
                                <li class="">
                                    <strong class="title">Address:</strong>
                                    <span class="cont">24P Street Makhdoomi, Belgium Netherlands  </span>
                                </li>
                                <li class="">
                                    <strong class="title">Nationality:</strong>
                                    <span class="cont">Viet Nam</span>
                                </li>
                                <li class="">
                                    <strong class="title">Currently Woking at:</strong>
                                    <span class="cont"><%=address%></span>
                                </li>
                            </ul>
                            <h4><strong> About Me:</strong></h4>
                            <p>
                               <%=aboutYourSelf%>
                            </p>
                        </div>

                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="resume-box">
                                <div class="heading-inner">
                                    <p class="title light-grey">Educational Information</p>
                                </div>
                                <div class="row education-box">
                                    <div class="col-md-4 col-xs-12 col-sm-4">
                                        <div class="resume-icon">
                                            <span class="icon-clipboard"></span>
                                        </div>
                                        <div class="insti-name">
                                            <h4><%=eduTitle%></h4>
                                            <span><%=eduStartDate%> to <%=eduEndDate%></span>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-md-8 col-sm-8">
                                        <div class="degree-info">
                                            <h4>Master of Software Engineering</h4>
                                            <p><%=eduDescription%></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="resume-box">
                                <div class="heading-inner">
                                    <p class="title light-grey">Work Experience</p>
                                </div>
                                <div class="row education-box">
                                    <div class="col-md-4 col-xs-12 col-sm-4">
                                        <div class="resume-icon">
                                            <span class="icon-clipboard"></span>
                                        </div>
                                        <div class="insti-name">
                                            <h4><%=jobPosition%></h4>
                                            <span><%=jobStartDate%> to <%=jobEndDate%></span>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-md-8 col-sm-8">
                                        <div class="degree-info">
                                            <h4>principal software engineer</h4>
                                            <p><%=jobDescription%></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="heading-inner">
                                <p class="title light-grey">Skills That I have</p>
                            </div>
                            <div class="row">
                                <div class="col-md-8 col-sm-6 col-xs-12">
                                <%
                                    for(String skll: skillList){
                                        Random in = new Random();
                                        int widght = in.nextInt(20) + 80;
                                %>
                                    <div class="progress">
                                        <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <%=widght%>%;">
                                            <span class="sr-only"><%=widght%>% Complete</span>
                                        </div>
                                        <span class="progress-type"><%=skll%></span>
                                        <span class="progress-completed"><%=widght%>%</span>
                                    </div>
                                <%
                                    }
                                %>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="heading-inner">
                                <p class="title light-grey">My Clients</p>
                            </div>
                            <div class="row">
                                <div class="col-md-12 col-sm-12 col-xs-12">
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
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </section>
<%@include file="included/footer.jsp" %>
</body>

</html>