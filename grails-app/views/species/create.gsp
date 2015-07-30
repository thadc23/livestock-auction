
<%@ page import="auction.Species" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'species.label', default: 'Species')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${speciesInstance}">
            <div class="errors">
                <g:renderErrors bean="${speciesInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
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
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
