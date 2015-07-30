<html>
	<head>
		<title>Starke County Auction Reports</title>
		<meta name="layout" content="main" />
	</head>
	
	<body>
		<div class="nav">
        	<span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
    	</div>
		<table style="border: 0;">
			<tr>
				<td><g:jasperReport jasper="Buyer Summary" format="PDF" name="Buyer Summary" /></td>
				<td><g:jasperReport jasper="Lot Sheets.jasper" format="PDF" name="Lot Sheets" /></td>
				<td><g:jasperReport jasper="Checks.jasper" format="PDF" name="Checks" /></td>
			</tr>
			<tr>
				<td><g:jasperReport jasper="All Buyers By Buyer Number" format="PDF" name="All Buyers" /></td>
				<td><g:jasperReport jasper="Buyer Labels" format="PDF" name="Buyer Labels" /></td>
				<td><g:jasperReport jasper="Buyer Who Did Not Buy" format="PDF" name="Buyers Who Did Not Buy" /></td>
			</tr>
			<tr>
				<td><g:jasperReport jasper="Champions Sale Summary" format="PDF" name="Champions Sale Summary" /></td>
				<td><g:jasperReport jasper="Checkoffs" format="PDF" name="Checkoffs" /></td>
				<td><g:jasperReport jasper="Destination Report" format="PDF" name="Destination Report" /></td>
			</tr>
			<tr>
				<td><g:jasperReport jasper="Invoices Not Paid" format="PDF" name="Invoices Not Paid" /></td>
				<td><g:jasperReport jasper="Resale Summary" format="PDF" name="Resale Summary" /></td>
				<td><g:jasperReport jasper="Resale Summary Individual" format="PDF" name="Resale Summary Individual" /></li>
			</tr>
			<tr>
				<td><g:jasperReport jasper="Sale Bill" format="PDF" name="Sale Bill" /></td>
				<td><g:jasperReport jasper="Sale Summary" format="PDF" name="Sale Summary" /></td>
				<td><g:jasperReport jasper="Summary By Species" format="PDF" name="Species Summary" /></td>
			</tr>
		</table>
		
	</body>
</html>