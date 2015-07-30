
<%@ page import="auction.Seller" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'seller.label', default: 'Seller')}" />
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
	        		<g:submitButton name="search" class="search" value="${message(code: 'default.button.search.label', default: 'Search Seller')}" />
	        	</span>
	        	<g:link action="list">Show All</g:link>
	        </g:form>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'seller.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="firstName" title="${message(code: 'seller.firstName.label', default: 'First Name')}" />
                        
                            <g:sortableColumn property="lastName" title="${message(code: 'seller.lastName.label', default: 'Last Name')}" />
                        
                            <g:sortableColumn property="streetAddress" title="${message(code: 'seller.streetAddress.label', default: 'Street Address')}" />
                        
                            <g:sortableColumn property="city" title="${message(code: 'seller.city.label', default: 'City')}" />
                        
                            <g:sortableColumn property="state" title="${message(code: 'seller.state.label', default: 'State')}" />
                            
                            <g:sortableColumn property="parentNames" title="${message(code: 'seller.parentNames.label', default: 'Parent Names')}" />
                            
                            <g:sortableColumn property="club" title="${message(code: 'seller.club.label', default: 'Club')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${sellerInstanceList}" status="i" var="sellerInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${sellerInstance.id}">${fieldValue(bean: sellerInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: sellerInstance, field: "firstName")}</td>
                        
                            <td>${fieldValue(bean: sellerInstance, field: "lastName")}</td>
                        
                            <td>${fieldValue(bean: sellerInstance, field: "streetAddress")}</td>
                        
                            <td>${fieldValue(bean: sellerInstance, field: "city")}</td>
                        
                            <td>${fieldValue(bean: sellerInstance, field: "state")}</td>
                            
                            <td>${fieldValue(bean: sellerInstance, field: "parentNames")}</td>
                            
                            <td>${fieldValue(bean: sellerInstance, field: "club")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${sellerInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
