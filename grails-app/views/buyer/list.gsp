
<%@ page import="auction.Buyer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'buyer.label', default: 'Buyer')}" />
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
	        	<div>
		        	<g:radioGroup name="searchType" values="['all', 'byBuyerNum']"  labels="['All', 'By Buyer Number']" value="${currentSearchType}">
						<g:message code="${it.label}" />: ${it.radio}
					</g:radioGroup>
	        	</div>
	        	<g:textField name="searchCriteria" />
	        	<span class="button"><g:submitButton name="search" class="search" value="${message(code: 'default.button.search.label', default: 'Search Buyer')}" /></span>
	        	<g:link action="list" params="[searchType:currentSearchType]">Show All</g:link>
	        </g:form>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                            <g:sortableColumn property="buyerNumber" title="${message(code: 'buyer.buyerNumber.label', default: 'Buyer Number')}" />
                            <g:sortableColumn property="name" title="${message(code: 'buyer.name.label', default: 'Name')}" />
                            <g:sortableColumn property="streetAddress" title="${message(code: 'buyer.streetAddress.label', default: 'Street Address')}" />
                            <g:sortableColumn property="city" title="${message(code: 'buyer.city.label', default: 'City')}" />
                            <g:sortableColumn property="state" title="${message(code: 'buyer.state.label', default: 'State')}" />
                            <g:sortableColumn property="phoneNumber" title="${message(code: 'buyer.phoneNumber.label', default: 'Phone #')}" />
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${buyerInstanceList}" status="i" var="buyerInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td><g:link action="show" id="${buyerInstance.id}">${fieldValue(bean: buyerInstance, field: "buyerNumber")}</g:link></td>
                            <td>${fieldValue(bean: buyerInstance, field: "name")}</td>
                            <td>${fieldValue(bean: buyerInstance, field: "streetAddress")}</td>
                            <td>${fieldValue(bean: buyerInstance, field: "city")}</td>
                            <td>${fieldValue(bean: buyerInstance, field: "state")}</td>
                            <td>${fieldValue(bean: buyerInstance, field: "phoneNumber")}</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${buyerInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
