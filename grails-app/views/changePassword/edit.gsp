<meta name="layout" content="main2"/>
<title><g:message code="change.password" /></title>

<div class="card">
    <div class="card-header text-center page-title">
        <g:message code="change.password" args="['Change']"/>
    </div>

    <div class="card-body">
        <g:form controller="changePassword" action="updatePassword">
            <g:hiddenField name="id" value="${user.id}"/>
            <g:render template="form"/>

            <div class="col-md-6 offset-md-4">
                <g:submitButton class="btn btn-primary" name="login" value="${g.message(code: "change.password")}"/>
                <g:link controller="profile" action="details" id="${user.id}" class="btn btn-primary"><g:message
                        code="clear"/></g:link>

            </div>
        </g:form>
    </div>
</div>