<%-- 
    Document   : index
    Created on : Dec 2, 2016, 1:02:58 AM
    Author     : WindyKiss
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="jdbc.DbContext"%>
<%@include file="included/header.jsp" %>

<%@include file="included/body.jsp" %>
<%    int countWeb = 0;
    int countDesktop = 0;
    int countMobile = 0;

    String tmpQuery = "WITH T AS (SELECT *,ROW_NUMBER() OVER (ORDER BY title ASC) AS SNO FROM InOrderJob WHERE category LIKE '%Web Applications%') SELECT MAX(SNO) FROM T";
    DbContext db = new DbContext();
    try {
        ResultSet rs = db.executeQuery(tmpQuery);

        while (rs.next()) {
            countWeb = rs.getInt(1);
        }
        db.close();
    } catch (Exception e) {
    }

    tmpQuery = "WITH T AS (SELECT *,ROW_NUMBER() OVER (ORDER BY title ASC) AS SNO FROM InOrderJob WHERE category LIKE '%Desktop Applications%') SELECT MAX(SNO) FROM T";
    db = new DbContext();
    try {
        ResultSet rs = db.executeQuery(tmpQuery);

        while (rs.next()) {
            countDesktop = rs.getInt(1);
        }
        db.close();
    } catch (Exception e) {
    }

    tmpQuery = "WITH T AS (SELECT *,ROW_NUMBER() OVER (ORDER BY title ASC) AS SNO FROM InOrderJob WHERE category LIKE '%Mobile Applications%') SELECT MAX(SNO) FROM T";
    db = new DbContext();
    try {
        ResultSet rs = db.executeQuery(tmpQuery);

        while (rs.next()) {
            countMobile = rs.getInt(1);
        }
        db.close();
    } catch (Exception e) {
    }
    
%>
<div class="clearfix"></div>
<section class="main-section parallex">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-8 col-sm-12 col-md-offset-2 col-xs-12 nopadding">
                <div class="search-form-contaner">
                    <h1 class="search-main-title"> One million success stories. Start yours today </h1>
                    <form class="form-inline" action="joblist.jsp">
                        <div class="col-md-7 col-sm-4 col-xs-12 nopadding">
                            <div class="form-group">

                                <input type="text" class="form-control" name="tags" placeholder="Search Keyword" value="">
                                <i class="icon-magnifying-glass"></i>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-3 col-xs-12 nopadding">
                            <div class="form-group">
                                <select class="select-category form-control" name="category" required>
                                    <option label="Select Option"></option>
                                    <option value="Web Applications">Web Applications</option>
                                    <option value="Desktop Applications">Desktop Applications</option>
                                    <option value="Mobile Applications">Mobile Applications</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-2 col-sm-2 col-xs-12 nopadding">
                            <div class="form-group form-action">
                                <button type="submit" class="btn btn-primary btn-search-submit">Search</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="advance-search light-blue">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12 nopadding">
                <form class="form-inline" action="jobList2.jsp" method="POST">
                    <div class="col-md-4 col-sm-3 col-xs-12">
                        <div class="form-group">
                            <label>Select Location</label>
                            <select class="select-location form-control" name="loctaion">
                                <option value="">&nbsp;</option>
                                <option value="Ha Noi">Ha Noi</option>
                                <option value="Hai Phong">Hai Phong</option>
                                <option value="Hue">Hue</option>
                                <option value="Da Nang">Da Nang</option>
                                <option value="Ho Chi Minh City">Ho Chi Minh City</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-3 col-xs-12">
                        <div class="form-group">
                            <label>Select Category</label>
                            <select class="select-category form-control" name="category">
                                <option label="Select Option"></option>
                                <option value="">&nbsp;</option>
                                <option value="Web Applications">Web Applications</option>
                                <option value="Desktop Applications">Desktop Applications</option>
                                <option value="Mobile Applications">Mobile Applications</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-3 col-xs-12">
                        <div class="form-group">
                            <label>Job Type</label>
                            <select class="select-category form-control" name="jobType">
                                <option value="">&nbsp;</option>
                                <option value="Full Time">Full Time</option>
                                <option value="Part Time">Part Time</option>
                                <option value="Remote">Remote</option>
                                <option value="Freelancer">Freelancer</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-3 col-xs-12">
                        <div class="form-group">
                            <label>Job Experience</label>
                            <select class="questions-category form-control" name="experience">
                                <option value="">&nbsp;</option>
                                <option value="Fresher">Fresher</option>
                                <option value="1 Year">1 Year</option>
                                <option value="2 Years">2 Years</option>
                                <option value="3 Years">3 Years</option>
                                <option value="4 Years">4 Years</option>
                                <option value="5 Years">5 Years</option>
                                <option value="6+ Years">6+ Years</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-3 col-xs-12">
                        <div class="form-group">
                            <label>Salary</label>
                            <select class="questions-category form-control" name="salary">
                                <option value="">&nbsp;</option>
                                <option value="Less than 100$">Less than 100$</option>
                                <option value="100$+">100$+</option>
                                <option value="500$+">500$+</option>
                                <option value="1,000$+">1,000$+</option>
                                <option value="5,000$+">5,000$+</option>
                                <option value="10,000$+">10,000$+</option>
                                <option value="100,000$+">100,000$+</option>
                                <option value="Negotiable">Negotiable</option>
                            </select>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-3 col-xs-12">
                        <div class="form-group form-action">
                            <button type="submit" class="btn btn-default btn-block"><i class="fa fa-search"></i>Search Job</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>

<section class="call-to-action-1">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="col-md-10 col-sm-10 col-xs-12">
                    <i class="icon-trophy"></i>
                    <div class="heading-detail">
                        <h3>World?s Best Job Portal Website</h3>
                        <p>Where you can find a lot of hot jobs in Viet Nam.</p>
                    </div>
                </div>
                <div class="col-md-2 col-sm-2 col-xs-12">
                    <a class="btn btn-default btn-block" href="postJob.jsp">Post Now</a>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="category-section-3 light-grey">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="Heading-title black">
                    <h1>Browse Categories</h1>
                    <p>Choose one of the hottest Categories.</p>
                </div>
            </div>
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="col-md-4 col-sm-6 col-xs-12">
                    <div class="category-section-3-box">
                        <div class="category-section-3-box-inner"> <i class="icon-browser"></i>
                            <h4> Web Applications </h4>
                            <span>( <%=countWeb%> )</span> </div>
                        <div class="category-section-3-box-over-text animated fadeIn">
                            <h4>Front End</h4>
                            <h4>back End</h4>
                            <h4>Core Programing</h4>
                            <p><a href="joblist.jsp?tags=&category=Web+Applications"> See All </a></p>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 col-sm-6 col-xs-12">
                    <div class="category-section-3-box">
                        <div class="category-section-3-box-inner"> <i class=" icon-tablet"></i>
                            <h4> Mobile Applications </h4>
                            <span>( <%=countMobile%> )</span> </div>
                        <div class="category-section-3-box-over-text animated fadeIn">
                            <h4>iOS APP</h4>
                            <h4>ANDROID</h4>
                            <h4>UI/UX DESIGNERS</h4>
                            <p><a href="joblist.jsp?tags=&category=Mobile+Applications"> See All </a></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 col-xs-12">
                    <div class="category-section-3-box">
                        <div class="category-section-3-box-inner"> <i class="icon-clipboard"></i>
                            <h4> Desktop Applications </h4>
                            <span>( <%=countDesktop%> )</span> </div>
                        <div class="category-section-3-box-over-text animated fadeIn">
                            <h4>Window Applications</h4>
                            <h4>Unix/Linux</h4>
                            <h4>iMac Apps</h4>
                            <p><a href="joblist.jsp?tags=&category=Desktop+Applications"> See All </a></p>
                        </div>
                    </div>
                </div>

                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="load-more-btn">
                        <button class="btn-default"> View All <i class="fa fa-angle-right"></i> </button>
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