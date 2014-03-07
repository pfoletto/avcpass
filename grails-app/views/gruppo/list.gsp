

<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'gruppo.label', default: 'Gruppo')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-gruppo" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="ruolo" title="${message(code: 'gruppo.ruolo.label', default: 'Ruolo')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${gruppoInstanceList}" status="i" var="gruppoInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${gruppoInstance.id}">${fieldValue(bean: gruppoInstance, field: "ruolo")}</g:link></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${gruppoInstanceCount}" />
	</div>
</section>

</body>

</html>
