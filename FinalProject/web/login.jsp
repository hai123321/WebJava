<%-- 
    Document   : login
    Created on : Dec 2, 2016, 1:39:08 AM
    Author     : WindyKiss
--%>

<%@include file="included/header.jsp" %>
<%
    
    String mess = request.getAttribute("message") != null ? (String) request.getAttribute("message") : "sign in using social accounts";
    
%>
<%@include file="included/body.jsp" %>
<section class="job-breadcrumb">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-sm-7 co-xs-12 text-left">
                <h3>Login Page</h3>
            </div>
            <div class="col-md-6 col-sm-5 co-xs-12 text-right">
                <div class="bread">
                    <ol class="breadcrumb">
                        <li><a href="index.jsp">Home</a> </li>
                        <li class="active">login</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="login-page light-blue">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="login-container">
                    <div class="loginbox">
                        <form action="ValidLoginServlet" method="POST">
                            <div class="loginbox-title"><%=mess%></div>
                            <ul class="social-network social-circle onwhite">
                                <li><a href="#" class="icoFacebook" title="Facebook"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#" class="icoTwitter" title="Twitter"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#" class="icoGoogle" title="Google +"><i class="fa fa-google-plus"></i></a></li>
                                <li><a href="#" class="icoLinkedin" title="Linkedin +"><i class="fa fa-linkedin"></i></a></li>
                            </ul>
                            <div class="loginbox-or">
                                <div class="or-line"></div>
                                <div class="or">OR</div>
                            </div>
                            <div class="form-group">
                                <label>Username: <span class="required">*</span></label>
                                <input placeholder="" class="form-control" type="text" name="userName">
                            </div>
                            <div class="form-group">
                                <label>Password: <span class="required">*</span></label>
                                <input placeholder="" class="form-control" type="password" name="password">
                            </div>
                            <div class="loginbox-forgot">
                                <a href="">Forgot Password?</a>
                            </div>
                            <div class="loginbox-submit">
                                <input type="submit" class="btn btn-default btn-block" value="Login">
                            </div>
                            <div class="loginbox-signup">
                                <a href="register.jsp">Sign Up With Email</a>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<%@include file="included/footer.jsp" %>


</body>

</html>


