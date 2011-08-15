
<%@ page import="de.adesso.grails.start.Hersteller" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'hersteller.label', default: 'Hersteller')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'hersteller.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'hersteller.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="aktiv" title="${message(code: 'hersteller.aktiv.label', default: 'Aktiv')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${herstellerInstanceList}" status="i" var="herstellerInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${herstellerInstance.id}">${fieldValue(bean: herstellerInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: herstellerInstance, field: "name")}</td>
                        
                            <td><g:formatBoolean boolean="${herstellerInstance.aktiv}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${herstellerInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
