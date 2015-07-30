
<%@ page import="auction.Champion" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'champion.label', default: 'Champion')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'champion.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'champion.name.label', default: 'Name')}" />
                        
                            <th><g:message code="champion.animal.label" default="Animal" /></th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${championInstanceList}" status="i" var="championInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${championInstance.id}">${fieldValue(bean: championInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: championInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: championInstance, field: "animal")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${championInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
