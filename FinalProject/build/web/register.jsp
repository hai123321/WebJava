<%-- 
    Document   : register
    Created on : Dec 2, 2016, 1:53:25 PM
    Author     : WindyKiss
--%>

<%@include file="included/header.jsp" %>

<%@include file="included/body.jsp" %>
<%
    
    String mess = request.getAttribute("message") != null ? (String) request.getAttribute("message") : "Sign Up using social accounts";
    
%>
<section class="job-breadcrumb">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-sm-7 co-xs-12 text-left">
                <h3>Registration Page</h3>
            </div>
            <div class="col-md-6 col-sm-5 co-xs-12 text-right">
                <div class="bread">
                    <ol class="breadcrumb">
                        <li><a href="index.jsp">Home</a> </li>
                        <li class="active">Registeration</li>
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
                        <form action="ValidRegister" method="POST">
                            <div class="loginbox-title"><%=mess%></div>
                            <div class="form-group">
                                <label>Username: <span class="required">*</span></label>
                                <input placeholder="" class="form-control" type="text" name="userName" required>
                            </div>
                            <div class="form-group">
                                <label>Email: <span class="required">*</span></label>
                                <input placeholder="" class="form-control" type="email" name="email" required>
                            </div>
                            <div class="form-group">
                                <label>Password: <span class="required">*</span></label>
                                <input placeholder="" class="form-control" type="password" name="password" required>
                            </div>
                            <div class="loginbox-submit">
                                <input type="submit" class="btn btn-default btn-block" value="Register">
                            </div>
                            <div class="loginbox-signup"> Already have account? <a href="login.jsp">Sign in</a> </div>
                        </form>

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