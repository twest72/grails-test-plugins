

<%@ page import="de.adesso.grails.start.Motorrad" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'motorrad.label', default: 'Motorrad')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${motorradInstance}">
            <div class="errors">
                <g:renderErrors bean="${motorradInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${motorradInstance?.id}" />
                <g:hiddenField name="version" value="${motorradInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="motorrad.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: motorradInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${motorradInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="hersteller"><g:message code="motorrad.hersteller.label" default="Hersteller" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: motorradInstance, field: 'hersteller', 'errors')}">
                                    <g:select name="hersteller.id" from="${de.adesso.grails.start.Hersteller.list()}" optionKey="id" value="${motorradInstance?.hersteller?.id}" optionValue="name" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="herstellungsDatum"><g:message code="motorrad.herstellungsDatum.label" default="Herstellungs Datum" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: motorradInstance, field: 'herstellungsDatum', 'errors')}">
                                    <g:datePicker name="herstellungsDatum" precision="day" value="${motorradInstance?.herstellungsDatum}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="beschreibung"><g:message code="motorrad.beschreibung.label" default="Beschreibung" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: motorradInstance, field: 'beschreibung', 'errors')}">
                                    <g:textArea name="beschreibung" cols="40" rows="5" value="${motorradInstance?.beschreibung}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="geange"><g:message code="motorrad.geange.label" default="Geange" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: motorradInstance, field: 'geange', 'errors')}">
                                    <g:textField name="geange" value="${fieldValue(bean: motorradInstance, field: 'geange')}" />
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
