<html>
<head>
<meta name="layout" content="main" />
</head>
<body>

	<div class="nav">
        <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
    </div>
    <div class="body">
		<g:form method="post" enctype="multipart/form-data" action="importObject" controller="import">
			<input type="file" name="myFile" />
			<select name="type" >
				<option value="SELLERS">Sellers</option>
				<option value="ANIMALS">Animals</option>
				<option value="BUYERS">Buyers</option>
				<option value="CHAMPIONS">Champions</option>
			</select>
			<input type="submit" />
		</g:form>
		<g:if test="${flash.message}">
			<div id="message" class="message">
				${flash.message}
			</div>
		</g:if>
	</div>
</body>
</html>