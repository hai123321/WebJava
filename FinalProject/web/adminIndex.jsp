<%-- 
    Document   : adminIndex
    Created on : Dec 7, 2016, 9:54:07 PM
    Author     : WindyKiss
--%>

<%@include file="included/header.jsp" %>

<%@include file="included/adminBody.jsp" %>


        <section class="advance-search light-blue">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12 nopadding">
                        <form class="form-inline" action="jobListAdmin.jsp" method="POST">
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

        <%@include file="included/footer.jsp" %>


</body>

</html>