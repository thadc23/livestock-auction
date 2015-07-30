<html>
<head>
<meta name="layout" content="main" />
<g:javascript src="invoice.js" />
</head>
<body>
	<div class="nav">
        <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
    </div>
    <div class="body">
		<h1>Invoice</h1>
		<g:form method="post" action="create" controller="invoice" onsubmit="return validateForm();">
			<div class="dialog invoiceTable">
				<table class="invoiceTable">
				    <tbody>
				        <tr class="prop">
				            <td valign="top" class="name">
				                <label for="species"><g:message code="animal.species.label" default="Species" /></label>
				            </td>
				            <td valign="top" class="value ${hasErrors(bean: animalInstance, field: 'species', 'errors')}">
								<g:select name="species" from="${auction.Species.list()}" optionKey="id" value="${speciesId}"/>
				            </td>
				            <td></td>
				        </tr>
				        <tr class="prop">
				            <td valign="top" class="name">
				                <label for="tagNumber"><g:message code="animal.tagNumber.label" default="Tag #" /></label>
				            </td>
				            <td valign="top" class="value ${hasErrors(bean: animalInstance, field: 'tagNumber', 'errors')}">
								<g:textField name="tagNum" />
				            </td>
				            <td><img id="rightArrowAnimal" class="imageLink" src="${resource(dir:'images',file:'rightArrow.gif')}" alt="Add Animal" height="23px" width="23px" onclick="${remoteFunction(controller:'invoice', action:'getAnimal', onSuccess:'updateAnimalTable(data);', params:'\'tagNum=\' + $(\'#tagNum\').val() + \'&species=\' + $(\'#species\').val()' )}"/></td>
				        </tr>
				        <tr class="prop">
				            <td valign="top" class="name">
				                <label for="marketBid"><g:message code="animal.marketBid.label" default="Market Bid" /></label>
				            </td>
				            <td valign="top" class="value ${hasErrors(bean: animalInstance, field: 'marketBid', 'errors')}">
								<g:textField name="marketBid" disabled="disabled" />
				            </td>
				            <td></td>
				        </tr>
				        <tr class="prop">
				            <td valign="top" class="name">
				                <label for="totalCost"><g:message code="animal.total.label" default="Total" /></label>
				            </td>
				            <td valign="top" class="value">
								<g:textField name="totalCost" disabled="disabled" />
				            </td>
				            <td></td>
				        </tr>
				        <tr class="prop">
				            <td valign="top" class="name">
				                <label for="pricePerPound"><g:message code="animal.pricePerPound.label" default="Bid" /></label>
				            </td>
				            <td valign="top" class="value ${hasErrors(bean: animalInstance, field: 'pricePerPound', 'errors')}">
								<g:textField name="pricePerPound" />
				            </td>
				            <td></td>
				        </tr>
				        <tr class="prop">
				            <td valign="top" class="name">
				                <label for="buyerNum"><g:message code="buyer.buyerNumber.label" default="Buyer #" /></label>
				            </td>
				            <td valign="top" class="value">
								<g:textField name="buyerNum" />
								<g:hiddenField name="buyerNums" />
								<g:hiddenField name="buyerAmounts" />
				            </td>
				            <td><img class="imageLink" src="${resource(dir:'images',file:'rightArrow.gif')}" alt="Add Buyer" height="23px" width="23px" onclick="${remoteFunction(controller:'invoice', action:'getBuyer', onSuccess:'updateBuyerTable(data);', params:'\'buyerNum=\' + $(\'#buyerNum\').val()' )}"/></td>
				        </tr>
				        <tr class="prop">
				            <td valign="top" class="name">
				                <label for="destination"><g:message code="destination.name.label" default="Destination" /></label>
				            </td>
				            <td valign="top" class="value ${hasErrors(bean: destinationInstance, field: 'name', 'errors')}">
								<g:select name="destination" from="${auction.Destination.list()}" optionKey="id" noSelection="['null': '']" onchange="calculateTotalCost();"/>
				            </td>
				            <td></td>
				        </tr>
				        <tr class="buttons">
				        	<td colspan="2" class="button">
					        	<g:submitButton name="save" class="save" value="${message(code: 'default.button.save.label', default: 'Save')}"/>
				        	</td>
				        	<td><button type="button" id="calculate" onclick="calculateTotalCost();">Calculate</button></td>
				        </tr>
				  	</tbody>
				</table>
			</div>
			<table id="animals" class="tableList" title="Animal">
				<caption>Animal</caption>
				<tr>
					<th class="removeColumn"></th>
					<th class="tagNumberColumn">Tag #</th>
					<th class="sellerColumn">Seller</th>
					<th class="weightColumn">Weight</th>
				</tr>
			</table>
			<table id="buyers" class="tableList" title="Buyers">
				<caption>Buyers</caption>
				<tr>
					<th class="removeColumn"></th>
					<th class="buyerNumberColumn">Buyer #</th>
					<th class="buyerNameColumn">Buyer Name</th>
					<th class="amountDueColumn">Amount Due</th>
				</tr>
				<tr id="totalAmountRow">
					<td></td>
					<td></td>
					<td></td>
					<td><g:textField name="totalAmount" value="0" disabled="disabled" class="amountDueColumn"/></td>
				</tr>
			</table>
		</g:form>
		<g:if test="${flash.message}">
			<div id="message" class="message">
				${flash.message}
			</div>
		</g:if>
	</div>
	<g:textField name="invoiceBuyerNum" />
	<button type="button" onclick="${remoteFunction(controller:'invoice', action:'print', onSuccess:'checkPrintResult(data);' ,params:'\'buyerNum=\' + $(\'#invoiceBuyerNum\').val()' )}">Print</button>
</body>
</html>