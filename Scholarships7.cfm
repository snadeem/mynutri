<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Bravo Multi purpose HTML5 website Template</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />
<meta name="author" content="http://templateq.com" />
<!-- css -->
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/fancybox/jquery.fancybox.css" rel="stylesheet">
<link href="css/jcarousel.css" rel="stylesheet" />
<link href="css/flexslider.css" rel="stylesheet" />
<!-- Vendor Styles -->
<link href="css/magnific-popup.css" rel="stylesheet"> 
<!-- Block Styles -->
<link href="css/style.css" rel="stylesheet" />
<link href="css/gallery-1.css" rel="stylesheet">
<link href="css/stylesheet.css" rel="stylesheet">
 
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
<cfparam name="id" default="1">
<cfparam name="ScholarID" default="1">
<cfparam name="EnterForm" default="false">
<cfparam name="scholarName" default="">
<cfparam name="orgName" default="">
<cfparam name="expMonthName" default="">
<cfparam name="fundStart" default="">
<cfparam name="fundEnd" default="">


<cfscript>
	EtQueries = createObject("component","EtsCollegeQueries");		
	EtReturnLookupMonth = EtQueries.getLookupMonths();		
</cfscript>

<cfif #EnterForm# eq "true">
	<CFSTOREDPROC procedure="dbo.PReturnScholarships2"  datasource="EtsCollegeBound">       
		<CFPROCPARAM type="IN" cfsqltype="CF_SQL_VARCHAR"VALUE=#scholarName# dbvarname="@scholarName" 		null="No">
		<CFPROCPARAM type="IN" cfsqltype="CF_SQL_VARCHAR"VALUE=#orgName# dbvarname="@orgName" 		null="No">
		<CFPROCPARAM type="IN" cfsqltype="CF_SQL_VARCHAR"VALUE=#expMonthName# dbvarname="@expMonthName" 		null="No">
		<CFPROCPARAM type="IN" cfsqltype="CF_SQL_VARCHAR"VALUE=#fundStart# dbvarname="@fundStart" 		null="No">
		<CFPROCPARAM type="IN" cfsqltype="CF_SQL_VARCHAR"VALUE=#fundEnd# dbvarname="@fundEnd" 		null="No">
			<CFPROCRESULT NAME = RETURN_SCHOLARSHIPS>
	</CFSTOREDPROC>
</cfif>
 


</head>
<body>
<div id="wrapper">
<div class="topbar">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <p class="pull-left hidden-xs">Welcome</p>
        <p class="pull-right"><i class="fa fa-phone"></i>Tel No. (720) 253-7093</p>
      </div>
    </div>
  </div>
</div>
	<!-- start header -->
		<header>
        <div class="navbar navbar-default navbar-static-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.html"><img src="img/logo.png" alt="logo"/></a>
                </div>
                <div class="navbar-collapse collapse ">
                    <ul class="nav navbar-nav">
                        <li><a href="index.html">Home</a></li> 
						 <li class="dropdown">
                        <a href="#" data-toggle="dropdown" class="dropdown-toggle">About Us <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="about.html">Company</a></li>
                            <li><a href="#">Our Team</a></li>
                            <li><a href="#">News</a></li> 
                            <li><a href="#">Investors</a></li>
                        </ul>
                    </li> 
						<li><a href="services.html">Services</a></li>
                        <li class="active"><a href="portfolio.html">Portfolio</a></li>
                        <li><a href="pricing.html">Pricing</a></li>
                        <li><a href="contact.html">Contact</a></li>
                    </ul>
                </div>
            </div>
        </div>
	</header><!-- end header -->
	<section id="inner-headline">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h2 class="pageTitle">Scholarships</h2>
			</div>
		</div>
	</div>
	</section>
	<section id="content">
	<div class="container">
	
						<div class="row"> 
							<div class="col-md-12">
								<div class="container" >
									<h3>Learn and Search through 1000s of Scholarships</h3>
									<p>We have collected thousands of scholarships and made them searchable for your convenience.  <br />
                                   	
                                   	Amounts, Purpose and funds are part of the detail.  We have also included links for further detail and how to apply. <br />
                                   	
                                   	<i>You can fill out all or none of the form fields.</i><br /><br />
                                                                                                       	
                                   	Good luck with your search. Remember, half the battle is actually applying for the scholarships.
                                   	</p>
                                    	<p>
            
                <cfform id="ScholarshipSearchForm" action="Scholarships7.cfm" method="POST"  name="ScholarshipSearchForm">
                
             <div align="center">   
	       
			</div>
            <div class="row">
			<label for="scholarName">Scholarship Name</label>
			<cfinput type="text"  
			   	   placeholder="Scholarship Name" name="scholarName"  id="scholarName"
			            />
			  <p class="help-block"></p>
		 
	         </div> 	
                <div class="row">
			<label for="orgName">Organization Name</label>
			<cfinput type="text"  
			   	   placeholder="Full Name" name="orgName"  id="orgName"
			            />
			  <p class="help-block"></p>
		   </div>
			  
              <div class="row">
			<label for="expMonthName">Deadline Month</label>			
			 <cfselect id="expMonthName"  name="expMonthName" query="EtReturnLookupMonth" display="LookupMonthName" value="MonthIntValue" placeholder="Select a Month"/>            
			  <p class="help-block"></p>
		   </div>
               
                 <div class="row">
			<label for="fundStart">Fund Start</label>
				 <cfinput type="text" id="fundStart"  
			   	   placeholder="Fund Min" name="fundStart"  
			           />
			     <label for="fundEnd">Fund End</label>      
			     <cfinput type="text" id="fundEnd" 
			   	   placeholder="Fund Max" name="fundEnd" 
			            />
		</div>
               		 
	     <div class="row" > 
	     <label for="hrid"></label> 
	     <hr id="hrid" color="#067E18" />
	     </div>
	     <div class="row" > 
	     <label for="EnterForm"></label> 
	     <cfINPUT type="hidden" name="EnterForm" value="true">
	    <cfinput type="submit" name="btnSubmit" value="Search For Scholarships" id="EnterForm" ><br />
		 </div>
          </cfform>	
		                         		
                                    	</p>
								</div>  
							</div>
						</div> 
						
	</div>
	</section>
    <cfif #EnterForm# eq "true">		  	
			  <!-- Start Gallery 1-2 -->
    <section id="gallery-1" class="content-block section-wrapper gallery-1">
    	 	<div class="container">
            <!---<cfdump var="#EtReturnScholar#">
			<cfoutput>you are here!</cfoutput>--->
            <!-- /.gallery-filter -->
            
            <div class="container">
				<div class="row">		
               		<div class="span4">
               			<!---<table class="table table-striped">
               			<cfoutput query="RETURN_SCHOLARSHIPS">
               				<tr>
               					<td>
               					#Link#	
               					</td>
               				</tr>
               				</cfoutput>
               			</table>--->
               			<cfform name="leftSchorDisplay" id="leftSchorDisplay">
               			<cfgrid format="html" name="DisplayScholarships" autowidth="yes" height="600" query="RETURN_SCHOLARSHIPS" width="400"                                          								
								preservePageOnSort="yes"
								selectMode="row"
								selectOnLoad="yes"
								font="Verdana"
								fontsize="11"
								label="yes" 
								stripeRows="yes"
								stripeRowColor="##63D4FF"
								selectColor="##06E85F" bindOnLoad="no"> 
                             	
                              	<cfgridcolumn name="ScholarshipId" display="No" header="">
                              	<cfgridcolumn name="Link" display="Yes" header="Scholarship Name"> 
                              	<cfgridcolumn name="Organization" display="No" header="Organization">
                              	<cfgridcolumn name="Deadline" display="No" header="Deadline">                             	                                         ,              	                              	                             
                              </cfgrid>
                          </cfform>    
               		</div>
					<div class="span8">
						<cfformitem type="html" enabled="yes" visible="yes" bind="Link Name: {DisplayScholarships.selectedItem.Link}"/>
						
						<cfformitem type="html" enabled="yes" visible="yes" bind="Link Name: {DisplayScholarships.selectedItem.Link}"/>
					</div>
               
				</div>
			</div>
               
                
            <!-- /.row --> 
        <!-- /.container -->
		</div>
    </section>
		</cfif>
    <!--// End Gallery 1-2 -->  
	</div>
	<footer>
	<div class="container">
	
		<div class="row">
			<div class="col-lg-3">
				<div class="widget">
					<h5 class="widgetheading">Our Contact</h5>
					<address>
					<strong>Bootstrap company Inc</strong><br>
					JC Main Road, Near Silnile tower<br>
					 Pin-21542 NewYork US.</address>
					<p>
						<i class="icon-phone"></i> (123) 456-789 - 1255-12584 <br>
						<i class="icon-envelope-alt"></i> email@domainname.com
					</p>
				</div>
			</div>
			<div class="col-lg-3">
				<div class="widget">
					<h5 class="widgetheading">Quick Links</h5>
					<ul class="link-list">
						<li><a href="#">Latest Events</a></li>
						<li><a href="#">Terms and conditions</a></li>
						<li><a href="#">Privacy policy</a></li>
						<li><a href="#">Career</a></li>
						<li><a href="#">Contact us</a></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-3">
				<div class="widget">
					<h5 class="widgetheading">Latest posts</h5>
					<ul class="link-list">
						<li><a href="#">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</a></li>
						<li><a href="#">Pellentesque et pulvinar enim. Quisque at tempor ligula</a></li>
						<li><a href="#">Natus error sit voluptatem accusantium doloremque</a></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-3">
					<div class="widget">
					<h5 class="widgetheading">Recent News</h5>
					<ul class="link-list">
						<li><a href="#">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</a></li>
						<li><a href="#">Pellentesque et pulvinar enim. Quisque at tempor ligula</a></li>
						<li><a href="#">Natus error sit voluptatem accusantium doloremque</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div id="sub-footer">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="copyright">
						<p>
							<span>&copy; Bootstrap Template 2016 All right reserved. Template By </span><a href="http://templateq.com/" target="_blank">templateq</a>
						</p>
					</div>
				</div>
				<div class="col-lg-6">
					<ul class="social-network">
						<li><a href="#" data-placement="top" title="Facebook"><i class="fa fa-facebook"></i></a></li>
						<li><a href="#" data-placement="top" title="Twitter"><i class="fa fa-twitter"></i></a></li>
						<li><a href="#" data-placement="top" title="Linkedin"><i class="fa fa-linkedin"></i></a></li>
						<li><a href="#" data-placement="top" title="Pinterest"><i class="fa fa-pinterest"></i></a></li>
						<li><a href="#" data-placement="top" title="Google plus"><i class="fa fa-google-plus"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	</footer>
</div>
<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
<!-- javascript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="js/jquery.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.fancybox.pack.js"></script>
<script src="js/jquery.fancybox-media.js"></script>  
<script src="js/jquery.flexslider.js"></script>
<!-- Vendor Scripts -->
<script src="js/modernizr.custom.js"></script>
<script src="js/jquery.isotope.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/animate.js"></script>
<script src="js/custom.js"></script>
 
</body>
</html>