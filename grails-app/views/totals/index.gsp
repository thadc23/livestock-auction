<html>
<head>
<meta name="layout" content="main" />
</head>
<body>
	<div class="nav">
        <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
    </div>
    <div style="width:700px;">
    	<table style="border: 0; border-collapse: collapse; padding: 0; width: 700px;margin-top: 50px;">
    		<g:each in="${totals}" var="total">
    			<tr>
    				<td style="font-size: 18; font-weight: bold;text-align: right;vertical-align: middle;">${total.destination}</td>
    				<td style="border: 1px solid black; width:20%;">
    					<table style="border: 0;">
	    					<g:each in="${total.speciesCount}" var="sCount">
	    						<tr>
	    							<td>${sCount.key}</td>
	    							<td>${sCount.value}</td>
	    						</tr>
	    					</g:each>
    					</table>
    				</td>
    			</tr>
    		</g:each>
    	</table>
    </div>
</body>
</html>