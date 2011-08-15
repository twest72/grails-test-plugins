
<%@ page import="de.adesso.grails.start.Motorrad" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'motorrad.label', default: 'Motorrad')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'motorrad.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'motorrad.name.label', default: 'Name')}" />
                        
                            <th><g:message code="motorrad.hersteller.label" default="Hersteller" /></th>
                        
                            <g:sortableColumn property="herstellungsDatum" title="${message(code: 'motorrad.herstellungsDatum.label', default: 'Herstellungs Datum')}" />
                        
                            <g:sortableColumn property="beschreibung" title="${message(code: 'motorrad.beschreibung.label', default: 'Beschreibung')}" />
                        
                            <g:sortableColumn property="geange" title="${message(code: 'motorrad.geange.label', default: 'Geange')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${motorradInstanceList}" status="i" var="motorradInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${motorradInstance.id}">${fieldValue(bean: motorradInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: motorradInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: motorradInstance, field: "hersteller.name")}</td>
                        
                            <td><g:formatDate date="${motorradInstance.herstellungsDatum}" /></td>
                        
                            <td>${fieldValue(bean: motorradInstance, field: "beschreibung")}</td>
                        
                            <td>${fieldValue(bean: motorradInstance, field: "geange")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${motorradInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
