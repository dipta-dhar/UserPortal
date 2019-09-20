<meta name="layout" content="main2"/>
<title><g:message code="user" args="['Details']"/></title>

<div class="card">
    <div class="card-header text-center page-title">
        <g:message code="user" args="['Details']"/>
    </div>

    <div class="card-body">
        <g:if test="${user}">
            <table class="table table-striped">
                <tr>
                    <th class="text-right"><g:message code="first.name"/></th>
                    <td class="text-left">${user.firstName}</td>
                </tr>
                <tr>
                    <th class="text-right"><g:message code="last.name"/></th><td
                        class="text-left">${user.lastName}</td>
                </tr>
                <tr>
                    <th class="text-right"><g:message code="age"/></th><td
                        class="text-left">${user.age}</td>
                </tr>
                <tr>
                    <th class="text-right"><g:message code="phone.number"/></th><td
                        class="text-left">${user.phoneNumber}</td>
                </tr>
                <tr>
                    <th class="text-right"><g:message code="email"/></th><td class="text-left">${user.email}</td>
                </tr>
            </table>

            <div class="form-action-panel col-md-6 offset-md-4">
                <g:link controller="user" action="index" class="btn btn-primary"><g:message code="cancel"/></g:link>
            </div>
        </g:if>
    </div>
</div>
