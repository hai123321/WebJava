<%-- 
    Document   : editInfomation
    Created on : Dec 2, 2016, 1:25:51 AM
    Author     : WindyKiss
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="jdbc.DbContext"%>
<%@include file="included/header.jsp" %>

<%@include file="included/body.jsp" %>
<%    
    DbContext db = new DbContext();
    String query = "SELECT * FROM UserWorkInfomation WHERE userID=" + userID;
    System.out.println(query);
    String eduTitle = "", eduStartDate = "", eduEndDate = "", eduDescription = "", jobPosition = "", jobStartDate = "", jobEndDate = "", jobDescription = "", skill = "";

    try {
        ResultSet rs = db.executeQuery(query);
        while (rs.next()) {
            eduTitle = rs.getString(2) != null ? rs.getString(2) : "...";
            eduStartDate = rs.getDate(3) != null ? rs.getDate(3).toString() : "...";
            eduEndDate = rs.getDate(4) != null ? rs.getDate(4).toString() : "...";
            eduDescription = rs.getString(5) != null ? rs.getString(5) : "...";
            jobPosition = rs.getString(6) != null ? rs.getString(6) : "...";
            jobStartDate = rs.getDate(7) != null ? rs.getDate(7).toString() : "...";
            jobEndDate = rs.getDate(8) != null ? rs.getDate(8).toString() : "...";
            jobDescription = rs.getString(9) != null ? rs.getString(9) : "...";
            skill = rs.getString(10) != null ? rs.getString(10) : "software ,laravel, html";

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
                <h3>Build Resume</h3>
            </div>
            <div class="col-md-6 col-sm-5 co-xs-12 text-right">
                <div class="bread">
                    <ol class="breadcrumb">
                        <li><a href="index.jsp">Home</a> </li>
                        <li class="active">Build Resume</li>
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
                                <li class="active">
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
                    <form action="EditCVServlet" method="POST">
                        <div class="heading-inner first-heading">
                            <p class="title">Educational Detail</p>
                        </div>
                        <div class="col-md-12 col-sm-12 col-xs-12 nopadding">
                            <div class="profile-edit row">
                                <div class="col-md-12 col-sm-12">
                                    <div class="form-group">
                                        <label>Degree Title <span class="required">*</span></label>
                                        <input type="text" placeholder="Degree Title" class="form-control" name="eduTitle" value="<%=eduTitle%>">
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label>Degree start Date <span class="required">*</span></label>
                                        <input type="date" placeholder="Pick Date" class="form-control" name="eduStartDate" value="<%=eduStartDate%>">
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label>Degree End Date <span class="required">*</span></label>
                                        <input type="date" placeholder=" Pick Date" class="form-control" name="eduEndDate" value="<%=eduEndDate%>">
                                    </div>
                                </div>
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="form-group">
                                        <label>Description</label>
                                        <textarea name="eduDescription" id="ckeditor"><%=eduDescription%></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr class="divider">
                        </div>

                        <div class="heading-inner first-heading">
                            <p class="title">Job Experience</p>
                        </div>
                        <div class="col-md-12 col-sm-12 col-xs-12 nopadding">
                            <div class="profile-edit row">
                                <div class="col-md-12 col-sm-12">
                                    <div class="form-group">
                                        <label>Position <span class="required">*</span></label>
                                        <input type="text" placeholder="Position Title" class="form-control" name="jobPosition" value="<%=jobPosition%>">
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label>Job start Date <span class="required">*</span></label>
                                        <input type="date" placeholder="Pick Date" class="form-control" name="jobStartDate" value="<%=jobStartDate%>">
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label>JobEnd Date <span class="required">*</span></label>
                                        <input type="date" placeholder=" Pick Date" class="form-control" name="jobEndDate" value="<%=jobEndDate%>">
                                    </div>
                                </div>
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="form-group">
                                        <label>Description</label>
                                        <textarea name="jobDescription" id="ckeditor-experience"><%=jobDescription%></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr class="divider">
                        </div>

                        <div class="heading-inner first-heading">
                            <p class="title">Add Skills</p>
                        </div>
                        <div class="col-md-12 col-sm-12 col-xs-12 nopadding">
                            <div class="profile-edit row">

                                <div class="col-md-12 col-sm-12">
                                    <div class="form-group">
                                        <label>Skill Name <span class="required">*</span></label>
                                        <input type="text" id="tags" value="<%=skill%>" class="form-control" data-role="tagsinput" name="skill">
                                    </div>
                                </div>

                                <div class="col-md-12 col-sm-12">
                                    <button class="btn btn-default pull-right"> Save Skills <i class="fa fa-angle-right"></i></button>
                                </div>

                            </div>
                            <!--<hr class="divider">-->
                        </div>

                    </form>
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