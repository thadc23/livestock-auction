
<%@ page import="auction.Animal" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'animal.label', default: 'Animal')}" />
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
            <g:form action="search" method="post">
	        	<g:textField name="searchCriteria" />
	        	<span class="button">
	        		<g:submitButton name="search" class="search" value="${message(code: 'default.button.search.label', default: 'Search Animal Tag Number')}" />
	        	</span>
	        </g:form>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'animal.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="tagNumber" title="${message(code: 'animal.tagNumber.label', default: 'Tag Number')}" />
                        
                            <g:sortableColumn property="weight" title="${message(code: 'animal.weight.label', default: 'Weight')}" />
                            
                            <g:sortableColumn property="lotNumber" title="${message(code: 'animal.lotNumber.label', default: 'Lot #')}" />
                   	    
                            <th><g:message code="animal.destination.label" default="Destination" /></th>
                   	    
                            <g:sortableColumn property="species" title="${message(code: 'animal.species.label', default: 'Species')}" />
                            
                            <g:sortableColumn property="seller" title="${message(code: 'animal.seller.label', default: 'Seller')}" />
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${animalInstanceList}" status="i" var="animalInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${animalInstance.id}">${fieldValue(bean: animalInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: animalInstance, field: "tagNumber")}</td>
                        
                            <td>${fieldValue(bean: animalInstance, field: "weight")}</td>
                        
                            <td>${fieldValue(bean: animalInstance, field: "lotNumber")}</td>
                        
                            <td>${fieldValue(bean: animalInstance, field: "destination")}</td>
                        
                            <td>${fieldValue(bean: animalInstance, field: "species.name")}</td>
                            
                            <td>${fieldValue(bean: animalInstance, field: "seller")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${animalInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
