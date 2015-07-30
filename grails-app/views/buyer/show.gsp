
<%@ page import="auction.Buyer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'buyer.label', default: 'Buyer')}" />
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
                            <td valign="top" class="name"><g:message code="buyer.buyerNumber.label" default="Buyer Number" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: buyerInstance, field: "buyerNumber")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="buyer.name.label" default="Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: buyerInstance, field: "name")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="buyer.streetAddress.label" default="Street Address" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: buyerInstance, field: "streetAddress")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="buyer.city.label" default="City" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: buyerInstance, field: "city")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="buyer.state.label" default="State" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: buyerInstance, field: "state")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="buyer.zip.label" default="Zip" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: buyerInstance, field: "zip")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="buyer.phoneNumber.label" default="Phone Number" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: buyerInstance, field: "phoneNumber")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="buyer.purchases.label" default="Purchases" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${buyerInstance.purchases}" var="p">
                                    <li><g:link controller="purchase" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="buyer.paid.label" default="Paid" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${buyerInstance?.paid}" /></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${buyerInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
