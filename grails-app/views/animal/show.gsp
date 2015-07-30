
<%@ page import="auction.Animal" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'animal.label', default: 'Animal')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="animal.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: animalInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="animal.tagNumber.label" default="Tag Number" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: animalInstance, field: "tagNumber")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="animal.weight.label" default="Weight" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: animalInstance, field: "weight")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="animal.lotNumber.label" default="Lot #" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: animalInstance, field: "lotNumber")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="animal.destination.label" default="Destination" /></td>
                            
                            <td valign="top" class="value"><g:link controller="destination" action="show" id="${animalInstance?.destination?.id}">${animalInstance?.destination?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="animal.purchases.label" default="Purchases" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${animalInstance.purchases}" var="p">
                                    <li><g:link controller="purchase" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="animal.species.label" default="Species" /></td>
                            
                            <td valign="top" class="value"><g:link controller="species" action="show" id="${animalInstance?.species?.id}">${animalInstance?.species?.name}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="animal.marketBid.label" default="Market Bid" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: animalInstance, field: "marketBid")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="animal.seller.label" default="Seller" /></td>
                            
                            <td valign="top" class="value"><g:link controller="seller" action="show" id="${animalInstance?.seller?.id}">${animalInstance?.seller}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="animal.pricePerPound.label" default="Price Per Pound" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: animalInstance, field: "pricePerPound")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${animalInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
