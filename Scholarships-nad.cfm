<!DOCTYPE html>
<html lang="en">

<!DOCTYPE html>
<html lang="en">

<head>
    <!--meta tag start-->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="ETSCollegeBound">
    <meta name="author" content="ETS">
    <meta name="copyright" content="ETS">

    <!--title-->
    <title>ETS College</title>

    <!-- faveicon start   -->
    <link rel="icon" href="images/favicon.png" type="image/x-icon">

    <!-- stylesheet start -->
    <link rel="stylesheet" type="text/css" href="css/style.css">

</head>
<cfparam name="enter_form" default="false">
<cfparam name="parentStudent" default="P">
<cfparam name="ToDoExplore" default="ToDO">
<cfparam name="gradeLevel" default="1">
<cfparam name="CheckListHeader" default="">
<cfparam name="itemcount" default="0">

<cfif #enter_form# eq "true">
<CFSTOREDPROC procedure="dbo.PReturnCheckListTbl"  datasource="EtsCollegeBound">       
   <CFPROCPARAM type="IN" cfsqltype="CF_SQL_VARCHAR" VALUE=#parentStudent# 		null="No">	
   <CFPROCPARAM type="IN" cfsqltype="CF_SQL_VARCHAR" VALUE=#gradeLevel#		null="No"><CFPROCPARAM type="IN" cfsqltype="CF_SQL_VARCHAR" VALUE=#ToDoExplore# 		null="No">		
   
	<CFPROCRESULT NAME = RETURN_CHECKLIST>
 </CFSTOREDPROC>
</cfif>

<cfset GradeLevelText = ""> 
      
    <cfif #gradeLevel# eq "1">
    <cfset GradeLevelText = "10th Grade">
    <cfelseif #gradeLevel# eq "2">
    <cfset GradeLevelText = "11th Grade">
    <cfelseif #gradeLevel# eq "3">
    <cfset GradeLevelText = "12th Grade">
    <cfelseif #gradeLevel# eq "4">
    <cfset GradeLevelText = "9th Grade">
    <cfelseif #gradeLevel# eq "5">
    <cfset GradeLevelText = "Adult Education">
    <cfelseif #gradeLevel# eq "6">
    <cfset GradeLevelText = "Elementary School">
    <cfelseif #gradeLevel# eq "7">
    <cfset GradeLevelText = "Late Check">
    <cfelseif #gradeLevel# eq "8">
    <cfset GradeLevelText = "Middle School">
    <cfelse>
    <cfset GradeLevelText = "For Your Selected Grade">	
    </cfif>
    	


<cfif #parentStudent# eq "P">
 	<cfset CheckListHeader = "Parents">
 <cfelseif #parentStudent# eq "S" >
 	<cfset CheckListHeader = "Students">	
 </cfif>

<cfif #ToDoExplore# eq "ToDo">
 	<cfset ToDoExploreHeader = "To DO">
 <cfelseif #ToDoExplore# eq "ToExplore" >
 	<cfset ToDoExploreHeader = "To Explore">	
 </cfif>

	<cfscript>
		EtQueries = createObject("component","EtsCollegeQueries");				
		EtReturnGradeLevel = EtQueries.getLookupGradeLevel();				
	</cfscript>
<body>
    <header>
        <div class="top-header">
            <div class="container">
                <div class="row">
                    <div class="col-md-5 col-sm-5 col-xs-5">
                        <ul class="tophead-link">
                            <li><a href="about.html"><i > Welcome to ETS College Bound </i></a></li>
                        </ul>
                    </div>

                    <div class="col-md-7 col-sm-7 col-xs-7 tophead-right">
                        <ul class="tophead-link">
                            <li><a href=""><i class="fa fa-mobile" aria-hidden="true"></i></a>
                            </li>
                            <li><a href="signin.html"><i class="fa fa-lock" aria-hidden="true"></i> Sign</a>
                            </li>
                            <li><a href="register.html"><i class="fa fa-key" aria-hidden="true"></i> Register</a>
                            </li>
                        </ul>
                    </div>

                </div>
            </div>
        </div>

        <!-- Start Navigation -->
        <div id="masthead" class="site-header menu">
            <div class="container">
                <div class="site-branding">
                    <div id="site-identity">
                        <h1 class="site-title"><a href="index.html"  rel="home">ETS College<!-- <img src="images/logo.png" alt="logo"> --></a></h1>
                    </div>
                    <!-- #site-identity -->
                </div>
                <!-- .site-branding -->
                <div class="header-nav-search">
                    <div class="header-search">
                        <i class="fa fa-search top-search"></i>
                        <div class="search-popup">
                            <form role=search action="search" class="search-wrapper">
                                <div>
                                    <input type="text" name="search" placeholder="Type your keyword">
                                    <input type="submit" name="button" class="pop-search">
                                </div>
                            </form>
                            <div class="search-overlay"></div>
                        </div>
                    </div>
                    <div class="toggle-button">
                        <span></span>
                        <span></span>
                        <span></span>
                    </div>
                    <div id="main-navigation">
                        <nav class="main-navigation">
                            <div class="close-icon">
                                <i class="fa fa-close"></i>
                            </div>
                            <ul>
                    <li class="current-menu-item "><a href="index.html">Home</a></li>
                      
                                <li><a href="about.html">About</a> </li>
                                    
                              
                                <li><a href="contact.html">Contact</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Navigation -->
    </header>
	
    <section class="breadcrumb" style="background-image: url(images/background/breadcrumb.jpg);">
        <div class="breadcrumb-overlay"></div>
        <div class="container">
            <h1><a href="teacher-details.html">Scholarship </a></h1>
            <span><a href="index.html">Home</a></span><span><i class="fa fa-angle-right"></i>Scholarship Details</span>
        </div>
    </section>
    <section class="teacher-details-page inner-page">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-sm-4">
                    <div class="teacher-profile">
                       <cfform name="checklist" action="CheckListTable3.cfm">
                        <div class="teacher-name text-center">
						<h2>Search </h2>
                               <h5 align="left">Scholarship Name</h5>
                                <input type="text" name="scholarName"  id="scholarName"></input>
								<h5 align="left">Organization Name</h5>
							<input type="text" name="scholarName"  id="scholarName"></input>
                                
							
							 <h5 align="left">Deadline Month</h5>
                                <input type="text" name="scholarName"  id="scholarName"></input>
							<!-- <cfselect id="expMonthName"  name="expMonthName" query="EtReturnLookupMonth" display="LookupMonthName" value="MonthIntValue" placeholder="Select a Month"/>            
			-->
			
			<h5 align="left">Fund Start</h5>
                                <input type="text" name="fundStart"  id="fundStart"></input>
								<h5 align="left">Fund End</h5>
                                <input type="text" name="fundEnd"  id="fundEnd"></input>
                            
                        </div>
                        <div class="teacher-social-icon text-center">
						<input type="submit" value="Return Checklist"></input>
						<CFINPUT type="hidden" name="enter_form" value="true">	
                                                    </div>
						</cfform>
                    </div>
                </div>
                <div class="col-md-8 col-sm-8">
                    <div class="teacher-details">
                        <div class="course-tab-desc">
                            <div class="title inner-page-title">
                                <h3>Checklist</h3>
                            </div>
                            <p>Some description on what this checklist is all about.....then.... bibendum maecenas pellentesque id rutrum, praesent habitant varius interdum  litora.</p>
                            </div>
                       <cfif #enter_form# eq "true"> 
					   <cfoutput query="RETURN_SCHOLARSHIPS">
					    <div class="course-tab-desc teacher-subject">
                            <!--<div class="title inner-page-title">
                                <h3></h3>
                            </div>-->
                            <p><a href="#"><B>Showing :</B> <cfoutput> #ToDoExploreHeader# CheckList for #GradeLevelText# #CheckListHeader#. </cfoutput></a></p>
                        </div>
						
						 
                        <div class="curriculum-table teacher-course-table">
                            
                            <div class="table-responsive">
                                <table class="table-responsive">
									   <cfif #ToDoExplore# eq "ToDo">
									   		 <th>To Do</th> 
											 <th>To Do link</th>
									   	<cfelse>
												<th>To Explore</th> 
												<th>To Explore link</th> 
												
										</cfif>
  								    <tbody>
                                         <cfoutput query="RETURN_CHECKLIST">
                                    	     <tr>
                                         	    <td><span>#ToText#</span></td>
												<cfif #ToLink# neq "None">
                                            	  <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#ToLink#" class="btn btn-primary">Open</a></td>
                                             	  <cfelse>
                                                   <td>&nbsp;&nbsp;&nbsp;&nbsp;Not Available</td>
                                       			 </cfif> 
                                                    </tr>
										</cfoutput>
                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
						</cfoutput>
						</cfif>
						
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Stat Footer -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-sm-12 col-xs-12">
                    <div class="footer-widget">
                        <h2>ETS</h2>
                        <div class="widget-content">
                            <div class="text">consects adipiscing elit enean commodo ligula.</div>
                            <address>
                                <p><i class="fa fa-map-marker"></i> Chennai , India</p>
                                <p><i class="fa fa-phone"></i>+1 720 xxx-xxxx</p>
                                <p><i class="fa fa-envelope"></i> License to ETS</p>
                            </address>
                        </div>
                    </div>
                </div>

              

                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="footer-widget subscribe-widget">
                        <h2>Newsletter</h2>
                        <div class="widget-content">
                            <div class="text">Lorem ipsum dolor sit amet, adipiscing </div>
                            <div class="newsletter-form">
                                <form>
                                    <div class="form-group">
                                        <input type="email" name="email" value="" placeholder="Email Address..." required>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-primary button">suscribe now<span class="btn-shape"></span></button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </footer>
    <!--Footer Bottom-->
    <div class="footer-bottom">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-sm-6">
                    <div class="text text-left">Copyrights &copy; <a href="##">ETS</a>. All Rights Reserved</div>
                </div>
                <div class="col-md-6 col-sm-6">
                    <ul class="social-links text-right">
                        <li><a href="##"><i class="fa fa-facebook"></i></a></li>
                        <li class="active"><a href="##"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="##"><i class="fa fa-youtube"></i></a></li>
                        <li><a href="##"><i class="fa fa-instagram"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <!-- scroll top -->
    <a class="scroll-top fa fa-angle-up" href="javascript:void(0)"></a>
    <!-- srolltop end -->

    <script src=js/jquery-3.2.1.min.js></script>
    <script src=js/bootstrap.min.js></script>
    <script src=js/owl.carousel.min.js></script>
    <script src=js/isotope.pkgd.min.js></script>
    <script src=js/jquery.fancybox.min.js></script>
    <script src=js/jquery.counterup.min.js></script>
    <script src=js/waypoints.min.js></script>
    <script src=js/jquery.magnific-popup.min.js></script>
    <script src=js/countdown.js></script>
    <script src=js/wow.min.js></script>
    <script src=js/script.js></script>
</body>

</html>