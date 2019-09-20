<meta name="layout" content="main2"/>
<title><g:message code="profile.page" /></title>

<div class="card">
    <div class="card-header text-center page-title">
        <g:message code="user" args="['Profile']"/>
    </div>

    <div class="card-body">
        <g:if test="${user}">
            <table class="table table-striped">
                <tr>
                    <th class="text-right"><g:message code="first.name"/> </th>
                    <td class="text-left">${user.firstName}</td>
                </tr>
                <tr>
                    <th class="text-right"><g:message code="last.name"/></th><td
                        class="text-left">${user.lastName}</td>
                </tr>
                <tr>
                    <th class="text-right"><g:message code="address"/></th><td
                        class="text-left">${user.address}</td>
                </tr>
                <tr>
                    <th class="text-right"><g:message code="phone.number"/></th><td
                        class="text-left">${user.phoneNumber}</td>
                </tr>
                <tr>
                    <th class="text-right"><g:message code="email"/></th><td class="text-left">${user.email}</td>
                </tr>
                <tr>
                    <th class="text-right"><g:message code="birth.date"/></th><td
                        class="text-left">${user.birthDate}</td>
                </tr>
            </table>
        </g:if>
    </div>
</div>