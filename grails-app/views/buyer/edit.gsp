
<%@ page import="auction.Buyer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'buyer.label', default: 'Buyer')}" />
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
            <g:hasErrors bean="${buyerInstance}">
            <div class="errors">
                <g:renderErrors bean="${buyerInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${buyerInstance?.id}" />
                <g:hiddenField name="version" value="${buyerInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="buyerNumber"><g:message code="buyer.buyerNumber.label" default="Buyer Number" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: buyerInstance, field: 'buyerNumber', 'errors')}">
                                    <g:textField name="buyerNumber" value="${fieldValue(bean: buyerInstance, field: 'buyerNumber')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="buyer.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: buyerInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" maxlength="75" value="${buyerInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="streetAddress"><g:message code="buyer.streetAddress.label" default="Street Address" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: buyerInstance, field: 'streetAddress', 'errors')}">
                                    <g:textField name="streetAddress" maxlength="50" value="${buyerInstance?.streetAddress}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="city"><g:message code="buyer.city.label" default="City" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: buyerInstance, field: 'city', 'errors')}">
                                    <g:textField name="city" maxlength="20" value="${buyerInstance?.city}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="state"><g:message code="buyer.state.label" default="State" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: buyerInstance, field: 'state', 'errors')}">
                                    <g:textField name="state" maxlength="20" value="${buyerInstance?.state}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="zip"><g:message code="buyer.zip.label" default="Zip" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: buyerInstance, field: 'zip', 'errors')}">
                                    <g:textField name="zip" maxlength="5" value="${buyerInstance?.zip}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="phoneNumber"><g:message code="buyer.phoneNumber.label" default="Phone Number" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: buyerInstance, field: 'phoneNumber', 'errors')}">
                                    <g:textField name="phoneNumber" value="${buyerInstance?.phoneNumber}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="purchases"><g:message code="buyer.purchases.label" default="Purchases" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: buyerInstance, field: 'purchases', 'errors')}">
                                    
<ul>
<g:each in="${buyerInstance?.purchases?}" var="p">
    <li><g:link controller="purchase" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="purchase" action="create" params="['buyer.id': buyerInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'purchase.label', default: 'Purchase')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="paid"><g:message code="buyer.paid.label" default="Paid" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: buyerInstance, field: 'paid', 'errors')}">
                                    <g:checkBox name="paid" value="${buyerInstance?.paid}" />
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
