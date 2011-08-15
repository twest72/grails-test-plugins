
<%@ page import="de.adesso.grails.start.Motorrad" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'motorrad.label', default: 'Motorrad')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="motorrad.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: motorradInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="motorrad.name.label" default="Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: motorradInstance, field: "name")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="motorrad.hersteller.label" default="Hersteller" /></td>
                            
                            <td valign="top" class="value"><g:link controller="hersteller" action="show" id="${motorradInstance?.hersteller?.id}">${motorradInstance?.hersteller?.name}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="motorrad.herstellungsDatum.label" default="Herstellungs Datum" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${motorradInstance?.herstellungsDatum}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="motorrad.beschreibung.label" default="Beschreibung" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: motorradInstance, field: "beschreibung")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="motorrad.geange.label" default="Geange" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: motorradInstance, field: "geange")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${motorradInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
