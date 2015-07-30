
<%@ page import="auction.Species" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'species.label', default: 'Species')}" />
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
            <g:hasErrors bean="${speciesInstance}">
            <div class="errors">
                <g:renderErrors bean="${speciesInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${speciesInstance?.id}" />
                <g:hiddenField name="version" value="${speciesInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="species.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: speciesInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" maxlength="20" value="${speciesInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="animals"><g:message code="species.animals.label" default="Animals" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: speciesInstance, field: 'animals', 'errors')}">
                                    
<ul>
<g:each in="${speciesInstance?.animals?}" var="a">
    <li><g:link controller="animal" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="animal" action="create" params="['species.id': speciesInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'animal.label', default: 'Animal')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="checkoffAmount"><g:message code="species.checkoffAmount.label" default="Checkoff Amount" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: speciesInstance, field: 'checkoffAmount', 'errors')}">
                                    <g:textField name="checkoffAmount" value="${fieldValue(bean: speciesInstance, field: 'checkoffAmount')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="checkoffType"><g:message code="species.checkoffType.label" default="Checkoff Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: speciesInstance, field: 'checkoffType', 'errors')}">
                                    <g:select name="checkoffType.id" from="${auction.CheckoffType.list()}" optionKey="id" value="${speciesInstance?.checkoffType?.id}"  />
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
