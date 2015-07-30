
<%@ page import="auction.Seller" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'seller.label', default: 'Seller')}" />
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
            <g:hasErrors bean="${sellerInstance}">
            <div class="errors">
                <g:renderErrors bean="${sellerInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${sellerInstance?.id}" />
                <g:hiddenField name="version" value="${sellerInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="firstName"><g:message code="seller.firstName.label" default="First Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sellerInstance, field: 'firstName', 'errors')}">
                                    <g:textField name="firstName" maxlength="15" value="${sellerInstance?.firstName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="lastName"><g:message code="seller.lastName.label" default="Last Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sellerInstance, field: 'lastName', 'errors')}">
                                    <g:textField name="lastName" maxlength="25" value="${sellerInstance?.lastName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="streetAddress"><g:message code="seller.streetAddress.label" default="Street Address" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sellerInstance, field: 'streetAddress', 'errors')}">
                                    <g:textField name="streetAddress" maxlength="50" value="${sellerInstance?.streetAddress}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="city"><g:message code="seller.city.label" default="City" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sellerInstance, field: 'city', 'errors')}">
                                    <g:textField name="city" maxlength="20" value="${sellerInstance?.city}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="state"><g:message code="seller.state.label" default="State" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sellerInstance, field: 'state', 'errors')}">
                                    <g:textField name="state" maxlength="20" value="${sellerInstance?.state}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="zip"><g:message code="seller.zip.label" default="Zip" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sellerInstance, field: 'zip', 'errors')}">
                                    <g:textField name="zip" maxlength="5" value="${sellerInstance?.zip}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="parentNames"><g:message code="seller.parentNames.label" default="Parent Names" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sellerInstance, field: 'parentNames', 'errors')}">
                                    <g:textField name="parentNames" maxlength="75" value="${sellerInstance?.parentNames}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="club"><g:message code="seller.club.label" default="Club" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sellerInstance, field: 'club', 'errors')}">
                                    <g:textField name="club" maxlength="30" value="${sellerInstance?.club}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="animals"><g:message code="seller.animals.label" default="Animals" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sellerInstance, field: 'animals', 'errors')}">
                                    
<ul>
<g:each in="${sellerInstance?.animals?}" var="a">
    <li><g:link controller="animal" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="animal" action="create" params="['seller.id': sellerInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'animal.label', default: 'Animal')])}</g:link>

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
