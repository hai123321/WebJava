<%-- 
    Document   : leftBarUserInformation
    Created on : Dec 3, 2016, 12:11:01 AM
    Author     : WindyKiss
--%>
<%
    String name = (String) session.getAttribute("fullName");
    String job = (String) session.getAttribute("position");
%>
<div class="profile-card">
                        <div class="banner">
                            <img src="images/building.jpg" alt="" class="img-responsive">
                        </div>
                        <div class="user-image">
                            <img src="images/users/ava.png" class="img-responsive img-circle" alt="">
                        </div>
                        <div class="card-body">
                            <h3>Mr. <%=name%></h3>
                            <span class="title"><%=job%></span>
                        </div>
                        <ul class="social-network social-circle onwhite">
                            <li><a href="#" class="icoFacebook" title="Facebook"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#" class="icoTwitter" title="Twitter"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#" class="icoGoogle" title="Google +"><i class="fa fa-google-plus"></i></a></li>
                            <li><a href="#" class="icoLinkedin" title="Linkedin +"><i class="fa fa-linkedin"></i></a></li>
                        </ul>
                    </div>

