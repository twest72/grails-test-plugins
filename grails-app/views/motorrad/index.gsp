<!DOCTYPE HTML>
<%@page import="org.compass.core.util.ClassUtils"%>
<html>
	<head>
	    <meta charset="UTF-8">
        
        <g:set var="entityName" value="${message(code: 'motorrad.label', default: 'Motorrad')}" />
        
	    <title><g:message code="meine.motorraeder" /></title>
	
		<gui:resources components="richEditor"/>
	
	    <!-- Linking styles -->
<!-- 	    <link rel="stylesheet" href="css/style.css" type="text/css" media="screen"> -->
<!-- 	    <link rel="stylesheet" href="css/menu.css" type="text/css" media="screen"> -->
<!-- 	    <link rel="stylesheet" href="css/meteor-slides.css" type="text/css" media="screen"> -->
        <link rel="stylesheet" href="${resource(dir:'css',file:'style.css')}" type="text/css" media="screen" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'menu.css')}" type="text/css" media="screen" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'meteor-slides.css')}" type="text/css" media="screen" />
	    <!--[if IE 7]>
	    <style>
	    .promo_area {padding:0;}
	    .promo_area .meteor-nav .prev a {top:236px;}
	    .promo_area .meteor-nav .next a {top:236px;}
	    </style>
	    <![endif]-->
	
	    <!-- Linking scripts -->
<!-- 	    <script src="js/jquery.js" type="text/javascript"></script> -->
<!-- 	    <script src="js/jquery.cycle.all.js" type="text/javascript"></script> -->
<!-- 	    <script src="js/script.js" type="text/javascript"></script> -->
<!-- 	    <script src="js/slideshow.js" type="text/javascript"></script> -->
	    <script src="${resource(dir:'js',file:'jquery.js')}" type="text/javascript"></script>
	    <script src="${resource(dir:'js',file:'jquery.cycle.all.js')}" type="text/javascript"></script>
	    <script src="${resource(dir:'js',file:'script.js')}" type="text/javascript"></script>
	    <script src="${resource(dir:'js',file:'slideshow.js')}" type="text/javascript"></script>
	    <export:resource />
		<rateable:resources />
	</head>
	<body>
		<div class="top" style="color: white;">Hallo <sec:username />!<br/><g:link controller="logout">Logout</g:link></div>
	    <div class="mid"></div>
	    <div class="bottom"></div>
	
	    <!-- Defining the header section of the page -->
	    <header>
			<div class="marg">
			    <div class="header">
			        <div class="logo">
			            <a href="#" title="${message(code: 'meine.motorraeder')}"><span class="l"><g:message code="meine.motorraeder" /></span></a>
			        </div>
			        <div class="nav">
			            <!-- Defining the navigation menu -->
			            <ul>
			                <li><a href="#"><span class="l"></span><span class="m">${ entityName }</span><span class="r"></span></a>
			                    <ul class="sub-menu">
			                        <li><g:link class="create" action="create"><g:message code="anlegen" /></g:link></li>
			                        <li><g:link class="list" action="list"><g:message code="liste" /></g:link></li>
			                    </ul>
			                </li>
			                <li><a href="#"><span class="l"></span><span class="m"><g:message code="hersteller" /></span><span class="r"></span></a>
			                    <ul class="sub-menu">
			                        <li><g:link class="create" controller="hersteller" action="create"><g:message code="anlegen" /></g:link></li>
			                        <li><g:link class="list" controller="hersteller" action="list"><g:message code="liste" /></g:link></li>
			                    </ul>
			                </li>
			                <li><a href="${createLink(uri: '/')}"><span class="l"></span><span class="m">Back</span><span class="r"></span></a></li>
			            </ul>
			            <div class="clear"></div>
			        </div>
			    </div>
			</div>
	    </header>
	
	    <!-- Defining the main content section of the page -->
	    <div class="content">
			<!-- Rest content of main area -->
			<div class="marg main">
			    <div class="con">
			        <div class="con_t"></div>
			        <div class="con_bg">
			            <div class="con_wrap">
			
			                <!-- column #1 -->
			                <div class="block">
			                    <div class="btitle">About us</div>
			                    <div>
			                        <img src="${resource(dir:'images',file:'about_us2.jpg')}" alt="About us" title="About us" width="250px"/>
			                    </div>
			                    <div class="bcon">
			                        <div>About us - description, about us - description, about us - description</div>
			                    </div>
								
			                    <div class="bcon">
				                    <div>Download der <g:message code="motorraeder" />:</div>
									<export:formats />
								</div>
			                    
			                    <div class="bcon">
								    <g:form action="index" id="searchableForm" name="searchableForm" method="get">
								        <g:textField name="q" value="${params.q}" size="30"/> <input type="submit" value="Search" />
								    </g:form>
									<g:if test="${searchResult?.total > 0}">
										<g:each var="result" in="${searchResult.results}" status="index">
										<div>
											<g:set var="className" value="${org.compass.core.util.ClassUtils.getShortName(result.getClass())}" />
											<g:set var="link" value="${createLink(controller: className[0].toLowerCase() + className[1..-1], action: 'show', id: result.id)}" />
											<g:set var="desc" value="${result.toSearchResult()}" />
											<g:if test="${desc.size() > 20}">
												<g:set var="desc" value="${desc[0..20] + '...'}" />
											</g:if>
											<a href="${link}"> ${index + 1}. ${className} - ${desc.encodeAsHTML()}</a>
											</div>
										</g:each>
									</g:if>
								</div>
							</div>
							
			                <!-- column #2 -->
			                <div class="block">
								<div class="btitle"><g:message code="motorraeder" /></div>
			                    <g:render template="motorradCard" collection="${ motorradInstanceList }" var="motorrad"></g:render>
			                </div>
			
			                <!-- column #3 -->
			                <div class="block">
			                    <div class="btitle">All posts</div>
								<comments:render bean="${motorradInstanceList.get(0)}" />
			                </div>
			                <div class="clear"></div>
			
			            </div>
			        </div>
			        <div class="con_b"></div>
			    </div>
			</div>
	    </div>
	
	    <footer><!-- Defining the footer section of the page -->
	    </footer>
	</body>
</html>
