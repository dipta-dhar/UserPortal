<meta name="layout" content="main2"/>
<title><g:message code="user" args="['List']"/></title>

<div class="card">
    <div class="card-header page-title">
        <g:message code="user" args="['List']"/>

        %{--Actions--}%
        <span class="float-right">

            %{--Search Panel --}%
            <div class="btn-group">
                <g:form controller="user" action="index" method="GET">
                    <div class="input-group" id="search-area">
                        <g:select name="colName" class="form-control"
                                  from="[firstName: 'First Name', lastName: 'Last Name', email: 'Email', phoneNumber: 'Phone']"
                                  value="${params?.colName}" optionKey="key" optionValue="value"/>
                        <g:textField name="colValue" class="form-control" value="${params?.colValue}"/>
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="submit">Search</button>
                        </span>
                    </div>
                </g:form>
            </div>
        </span>
    </div>

    %{--Table Panel--}%
    <div class="card-body">
        <table class="table table-bordered">
            <thead class="thead-light">
            <tr>
                <g:sortableColumn property="firstName" title="${g.message(code: "first.name")}"/>
                <g:sortableColumn property="lastName" title="${g.message(code: "last.name")}"/>
                <g:sortableColumn property="age" title="${g.message(code: "age")}"/>
                <g:sortableColumn property="email" title="${g.message(code: "email")}"/>
                <g:sortableColumn property="phoneNumber" title="${g.message(code: "phone.number")}"/>
                <th class="action-row"><g:message code="action"/></th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${userList}" var="info">
                <tr>
                    <td>${info?.firstName}</td>
                    <td>${info?.lastName}</td>
                    <td>${info?.age}</td>
                    <td>${info?.email}</td>
                    <td>${info?.phoneNumber}</td>

                    %{--Table Actions --}%
                    <td>
                        <div class="btn-group">
                            <g:link controller="user" action="details" class="btn btn-success" id="${info.id}">
                                <i class="fas fa-eye"></i>
                            </g:link>
                            <g:link controller="user" action="edit" class="btn btn-primary" id="${info.id}">
                                <i class="fas fa-edit"></i>
                            </g:link>
                            <g:link controller="user" action="delete" id="${info.id}" class="btn btn-danger delete-confirmation">
                                <i class="fas fa-trash"></i>
                            </g:link>
                        </div>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>
        %{--Pagination Area--}%
        <div class="paginate">
            <g:paginate total="${total ?: 0}"/>
        </div>
    </div>
</div>