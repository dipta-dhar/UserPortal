<meta name="layout" content="main2"/>
<title><g:message code="user" args="['Edit']"/></title>

<script type="text/javascript">
    function validateEmail(email) {
        var regex = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return regex.test(email);
    }

    function emailCheck() {
        var emailId = document.getElementById("emailid").value;

        if (emailId != "" && validateEmail(emailId)) {
            $("#email-availability-status").html("OK").show();
            document.getElementById("submit").disabled = false;
            $("#email-availability-status").css("color", "green");
        } else {
            $("#email-availability-status").html("Invalid Format").show();
            document.getElementById("submit").disabled = true;
            $("#email-availability-status").css("color", "red");
        }
    }

    function validatePhoneNumber(mobile) {
        var regex = /^(?:\+88|01)?(?:\d{11}|\d{13})$/;

        if (mobile == '' || !mobile.match(regex)) {
            $("#number-validate-status").html("Invalid number").show();
            document.getElementById("submit").disabled = true;
            $("#number-validate-status").css("color", "red");
            return false;
        } else {
            $("#number-validate-status").html("OK").show();
            document.getElementById("submit").disabled = false;
            $("#number-validate-status").css("color", "green");
            return true;
        }
    }
</script>

<div class="card">
    <div class="card-header">
        <g:message code="user" args="['Update']"/>
    </div>

    <div class="card-body">
        <g:form controller="user" action="update">
            <g:hiddenField name="id" value="${user.id}"/>
            <g:render template="form" model="[edit: 'yes']"/>
            <div class="form-action-panel col-md-6 offset-md-4">
                <g:submitButton class="btn btn-primary" id="submit" name="update" value="${g.message(code: "update")}"/>
                <g:link controller="user" action="index" class="btn btn-primary"><g:message code="cancel"/></g:link>
            </div>
        </g:form>
    </div>
</div>