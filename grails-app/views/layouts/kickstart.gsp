<!DOCTYPE html>
<%-- <html lang="${org.springframework.web.servlet.support.RequestContextUtils.getLocale(request).toString().replace('_', '-')}"> --%>
<html lang="it">

<head>
	<title><g:layoutTitle default="${meta(name:'app.name')}" /></title>
	
    <meta charset="utf-8">
    <meta name="viewport"		content="width=device-width, initial-scale=1.0">
    <meta name="description"	content="">
    <meta name="author"			content="">
    
	<link rel="shortcut icon"		href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
	
	<link rel="apple-touch-icon"	href="assets/ico/apple-touch-icon.png">
    <link rel="apple-touch-icon"	href="assets/ico/apple-touch-icon-72x72.png"	sizes="72x72">
    <link rel="apple-touch-icon"	href="assets/ico/apple-touch-icon-114x114.png"	sizes="114x114">
	
	<%-- Manual switch for the skin can be found in /view/_menu/_config.gsp --%>
	<r:require modules="jquery"/> <%-- jQuery is required for Bootstrap! --%>
	<r:require modules="bootstrap"/>
	<r:require modules="bootstrap_utils"/>
        
	<r:layoutResources />
	<g:layoutHead />

	<!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
	<!--[if lt IE 9]>
		<script src="https://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

	<%-- For Javascript see end of body --%>

        
</head>

<body>
<g:if test="${session.user.ruolo == 2}">
        	<g:render template="/_menu/navbar"/>														
</g:if>
<g:else>
	<g:render template="/_menu/navbarUtente"/>														

</g:else>  
	
        <br>
	
	<g:render template="/layouts/content"/>														

	<!-- Included Javascript files and other resources -->


	<r:layoutResources />
</body>

</html>