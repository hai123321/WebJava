<%-- 
    Document   : jobList2
    Created on : Dec 2, 2016, 5:08:13 PM
    Author     : WindyKiss
--%>



<%@page import="java.sql.ResultSet"%>
<%@page import="jdbc.DbContext"%>
<%@include file="included/header.jsp" %>

<%@include file="included/body.jsp" %>

<%
    String jobID = request.getParameter("jobID");
    String tmpQuery = "SELECT * FROM OfferList o JOIN UserInfomation u ON o.applyID = u.userID JOIN UserWorkInfomation w ON o.applyID = w.userID WHERE o.jobID = " + jobID;
%>

<section class="categories-list-page light-grey">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12 nopadding">

                <div class="col-md-12 col-sm-12 col-xs-12">
                    <%
                            DbContext db = new DbContext();
                            try {
                                ResultSet rs = db.executeQuery(tmpQuery);
                                while (rs.next()) {
                                    int applyID = rs.getInt(2);
                                    String firstName = rs.getString(5);
                                    String lastName = rs.getString(6);
                                    String fullName = firstName + " " + lastName;
                                    String position = rs.getString(17);
                                    String detail = rs.getString(20);
                                    String skill = rs.getString(21);
                                    String []skills = skill.split(",");

                        %>
                    
                    <div class="profile-content">
                        <div class="card">
                            <div class="firstinfo">
                                <img src="images/users/11.jpg" alt="" class="img-circle img-responsive" />
                                <div class="profileinfo">
                                    <h1> <a href="userSavedCV.jsp?applyID=<%=applyID%>"> <%=fullName%> </a></h1>
                                    <h3><%=position%></h3>
                                    <p class="bio"><%=detail%></p>
                                    <div class="profile-skills">
                                        <%
                                            for(String skll: skills){
                                                
                                        %>
                                        <span> <%=skll%> </span>
                                        <%
                                            }
                                        %>
                                    </div>
                                    <div class="hire-btn">
                                        <a href="HireFreelanceServlet?applyID=<%=applyID%>&jobID=<%=jobID%>" class="btn-default" > <i class="fa fa-location-arrow"></i> Hire Me</a>
                                    </div>
                                </div>
                            </div>
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
</section>
<%@include file="included/footer.jsp" %>
<!-- FOR THIS PAGE ONLY -->

<script src="js/imagesloaded.js"></script>
<script src="js/isotope.min.js"></script>

<!-- CORE JS -->
<script type="text/javascript" src="js/custom.js"></script>

<script type="text/javascript">
    (function ($) {
        "use strict";
        $('#posts-masonry').imagesLoaded(function () {
            $('#posts-masonry').isotope({
                layoutMode: 'masonry',
                transitionDuration: '0.3s'
            });
        });
    })(jQuery);
</script>



</body>

</html>
