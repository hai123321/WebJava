<%-- 
    Document   : postJob
    Created on : Dec 2, 2016, 2:07:47 PM
    Author     : WindyKiss
--%>

<%@include file="included/header.jsp" %>

<%@include file="included/body.jsp" %>
<section class="job-breadcrumb">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-sm-7 co-xs-12 text-left">
                <h3>Post A Job</h3>
            </div>
            <div class="col-md-6 col-sm-5 co-xs-12 text-right">
                <div class="bread">
                    <ol class="breadcrumb">
                        <li><a href="index.jsp">Home</a> </li>
                        <li class="active">Post Job</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="post-job">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="box-panel">
                    <div class="Heading-title black">
                        <h3>Post A job</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor.At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium</p>
                    </div>
                    <form class="row" action="CreatePostServlet" method="POST">
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <label>Job Title</label>
                                <input type="text" placeholder="Job Title" class="form-control" name="title" required>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <label>Location</label>
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
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <label>Job Category</label>
                                <select class="questions-category form-control" multiple="multiple" name="category">
                                    <option value="Web Applications">Web Applications</option>
                                    <option value="Desktop Applications">Desktop Applications</option>
                                    <option value="Mobile Applications">Mobile Applications</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <label>Job Type</label>
                                <select class="questions-category form-control" name="type">
                                    <option value="Full Time">Full Time</option>
                                    <option value="Part Time">Part Time</option>
                                    <option value="Remote">Remote</option>
                                    <option value="Freelancer">Freelancer</option>
                                </select>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <label>Job Experience</label>
                                <select class="questions-category form-control" name="exp">
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
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <label>Expected Salary</label>
                                <select class="questions-category form-control" name="salary">
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
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="form-group">
                                <label>Tags</label>
                                <input type="text" id="tags" value="software ,laravel, html" class="form-control" data-role="tagsinput" name="tags">
                            </div>
                        </div>
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="form-group">
                                <label>Job Details</label>
                                <textarea name="detail" id="ckeditor"></textarea>
                            </div>
                        </div>
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <button class="btn btn-default pull-right">Publish Job <i class="fa fa-angle-right"></i></button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<div class=" brand-logo-area clients-bg ">
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

