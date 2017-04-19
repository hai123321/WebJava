<%-- 
    Document   : adminBody
    Created on : Dec 7, 2016, 11:03:27 PM
    Author     : WindyKiss
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="jdbc.DbContext"%>
</head>
<%
    int userID = session.getAttribute("userID") != null ? (Integer) session.getAttribute("userID") : 0;

    int countNoti = 0;

    String bodyQuery = "WITH T AS (SELECT TOP 5 *,ROW_NUMBER() OVER (ORDER BY date DESC) AS SNO FROM Notification WHERE isRead = 0 AND userID = " + userID + " ) SELECT MAX(SNO) FROM T";
    DbContext dbContext = new DbContext();
    try {
        ResultSet rs = dbContext.executeQuery(bodyQuery);

        while (rs.next()) {
            countNoti = rs.getInt(1);
        }
        dbContext.close();
    } catch (Exception e) {
    }
    bodyQuery = "SELECT TOP 5 * FROM Notification WHERE isRead = 0 AND userID = " + userID + " ORDER BY date DESC";
%>
<body>
    <div class="page">
        <div id="spinner">
            <div class="spinner-img"> <img alt="Opportunities Preloader" src="images/loader.gif" />
                <h2>Please Wait.....</h2>
            </div>
        </div>
        <nav id="menu-1" class="mega-menu fa-change-black" data-color=""> 
            <section class="menu-list-items container"> 
                <ul class="menu-logo">
                    <li> <a href="adminIndex.jsp"> <img src="images/logo.png" alt="logo" class="img-responsive"> </a> </li>
                </ul>
                <ul class="menu-links pull-right">       
                    <%
                        if (userID != 0) {

                    %>
                    <li>
                        <a>
                            <i class="fa fa-bell-o"></i>
                            <span class="label label-warning"><%=countNoti%></span>
                        </a>
                        <ul class="drop-down-multilevel left-side">
                            <%
                                dbContext = new DbContext();
                                try {
                                    ResultSet rs = dbContext.executeQuery(bodyQuery);
                                    while (rs.next()) {
                                        int notiID = rs.getInt(1);
                                        String noti = rs.getString(4);
                                        String redirect = rs.getString(5);

                            %>

                            <li>
                                <a href="<%=redirect%>&notiID=<%=notiID%>">
                                    <span>
                                        <i class="fa fa-users text-aqua"></i> <%=noti%>
                                    </span>

                                </a>
                            </li>
                            <%                                    }
                                    dbContext.close();
                                } catch (Exception e) {
                                    System.out.println(e);
                                }
                            %>

                        </ul>

                    </li>
                    <%
                        }
                    %>


                    <li class="no-bg"><a href="adminUserList.jsp" class="p-job"><i class="fa fa-plus-square"></i>User List</a></li>
                        <%
                            if (session.getAttribute("userID") == null) {


                        %>
                    <li class="no-bg login-btn-no-bg"><a href="login.jsp" class="login-header-btn"><i class="fa fa-sign-in"></i> Log in</a></li>
                        <%                    } else {

                        %>
                    <li class="profile-pic">
                        <a href="javascript:void(0)"> <img src="images/admin.jpg" alt="user-img" class="img-circle" width="36"><span class="hidden-xs hidden-sm">Admin</span><i class="fa fa-angle-down fa-indicator"></i> </a>
                        <ul class="drop-down-multilevel left-side">
                            <li><a href="LogoutServlet"><i class="fa fa-power-off"></i> Logout</a></li>
                        </ul>
                    </li>
                    <%                        }
                    %>
                </ul>
            </section>
        </nav>
        <div class="clearfix"></div>
