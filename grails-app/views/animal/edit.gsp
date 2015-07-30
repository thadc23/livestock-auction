
<%@ page import="auction.Animal" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'animal.label', default: 'Animal')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${animalInstance}">
            <div class="errors">
                <g:renderErrors bean="${animalInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${animalInstance?.id}" />
                <g:hiddenField name="version" value="${animalInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="tagNumber"><g:message code="animal.tagNumber.label" default="Tag Number" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: animalInstance, field: 'tagNumber', 'errors')}">
                                    <g:textField name="tagNumber" value="${fieldValue(bean: animalInstance, field: 'tagNumber')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="weight"><g:message code="animal.weight.label" default="Weight" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: animalInstance, field: 'weight', 'errors')}">
                                    <g:textField name="weight" value="${fieldValue(bean: animalInstance, field: 'weight')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="lotNumber"><g:message code="animal.lotNumber.label" default="Lot #" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: animalInstance, field: 'lotNumber', 'errors')}">
                                    <g:textField name="lotNumber" value="${animalInstance?.lotNumber}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="destination"><g:message code="animal.destination.label" default="Destination" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: animalInstance, field: 'destination', 'errors')}">
                                    <g:select name="destination.id" from="${auction.Destination.list()}" optionKey="id" value="${animalInstance?.destination?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="purchases"><g:message code="animal.purchases.label" default="Purchases" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: animalInstance, field: 'purchases', 'errors')}">
                                    
<ul>
<g:each in="${animalInstance?.purchases?}" var="p">
    <li><g:link controller="purchase" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="purchase" action="create" params="['animal.id': animalInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'purchase.label', default: 'Purchase')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="species"><g:message code="animal.species.label" default="Species" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: animalInstance, field: 'species', 'errors')}">
                                    <g:select name="species.id" from="${auction.Species.list()}" optionKey="id" value="${animalInstance?.species?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="marketBid"><g:message code="animal.marketBid.label" default="Market Bid" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: animalInstance, field: 'marketBid', 'errors')}">
                                    <g:textField name="marketBid" value="${fieldValue(bean: animalInstance, field: 'marketBid')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="seller"><g:message code="animal.seller.label" default="Seller" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: animalInstance, field: 'seller', 'errors')}">
                                    <g:select name="seller.id" from="${auction.Seller.list()}" optionKey="id" value="${animalInstance?.seller?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="pricePerPound"><g:message code="animal.pricePerPound.label" default="Price Per Pound" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: animalInstance, field: 'pricePerPound', 'errors')}">
                                    <g:textField name="pricePerPound" value="${fieldValue(bean: animalInstance, field: 'pricePerPound')}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
