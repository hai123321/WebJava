<%-- 
    Document   : adminUserList
    Created on : Dec 7, 2016, 11:35:05 PM
    Author     : WindyKiss
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="jdbc.DbContext"%>
<%@include file="included/header.jsp" %>

<%@include file="included/adminBody.jsp" %>

<%
    String tmpQuery = "SELECT * FROM Users us JOIN UserInfomation ui ON us.userID = ui.userID JOIN UserWorkInfomation w ON us.userID = w.userID";
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
                                    int applyID = rs.getInt(1);
                                    String firstName = !rs.getString(6).equals("") ? rs.getString(6) : "";
                                    String lastName = !rs.getString(7).equals("") ? rs.getString(7) : "";
                                    String fullName = firstName + " " + lastName;
                                    String position = !rs.getString(18).equals("") ? rs.getString(18) : "";
                                    String detail = !rs.getString(21).equals("") ? rs.getString(21) : "";
                                    String skill = !rs.getString(22).equals("") ? rs.getString(22) : "";
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
