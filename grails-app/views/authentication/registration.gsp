<meta name="layout" content="public"/>
<title><g:message code="registration.page"/></title>

<script type="text/javascript">
    function validateEmail(email) {
        var regex = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return regex.test(email);
    }

    function emailCheck() {
        var emailId = document.getElementById("emailid").value;

        if (emailId != "" && validateEmail(emailId)) {
            $("#email-availability-status").html("Format OK").show();
            document.getElementById("submit").disabled = false;
            $("#email-availability-status").css("color", "green");

            USERPORTAL.ajax.call({
                url: "${createLink(controller:'authentication', action:'checkEmailAvailable')}",
                data: ({emailId: emailId}),
                success: function (data) {
                    if (data.msg) {
                        $("#email-availability-status").html("Already used").show();
                        document.getElementById("submit").disabled = true;
                        $("#email-availability-status").css("color", "red");
                    } else {
                        $("#email-availability-status").html("OK").show();
                        document.getElementById("submit").disabled = false;
                        $("#email-availability-status").css("color", "green");
                    }
                },
                error: function () {
                    alert('error');
                }
            });
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

<div id="global-wrapper">
    <div id="content-wrapper">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <g:img dir="images" file="user.png" class="profile-img"/>
                    <h1 class="text-center login-title">Registration Panel</h1>

                    <div class="card">
                        <div class="card-body">
                            <g:form controller="authentication" action="doRegistration" class="">
                                <div class="form-group row">
                                    <label class="col-md-4 col-form-label text-md-right"><g:message
                                            code="first.name"/></label>

                                    <div class="col-md-6">
                                        <g:textField name="firstName" class="form-control" required="required"/>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-4 col-form-label text-md-right"><g:message
                                            code="last.name"/></label>

                                    <div class="col-md-6">
                                        <g:textField name="lastName" class="form-control" required="required"/>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-4 col-form-label text-md-right"><g:message
                                            code="address"/></label>

                                    <div class="col-md-6">
                                        <g:textField name="address" class="form-control" required="required"/>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-4 col-form-label text-md-right"><g:message
                                            code="phone.number"/></label>

                                    <div class="col-md-6" id="phone-number-div">
                                        <input type="phone" name="phoneNumber" id="numberId"
                                               onkeyup="return validatePhoneNumber(this.value)" value="" required
                                               class="form-control"/>
                                    </div><span id="number-validate-status"></span>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-4 col-form-label text-md-right"><g:message
                                            code="email"/></label>

                                    <div class="col-md-6" id="email-div">
                                        <input type="email" name="email" id="emailid" onblur="emailCheck()" value=""
                                               required
                                               class="form-control"/>
                                    </div><span id="email-availability-status"></span>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-4 col-form-label text-md-right"><g:message
                                            code="birth.date"/></label>
                                    <g:jqDatePicker name="birthDate" id="datetimepicker1"/>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-4 col-form-label text-md-right"><g:message
                                            code="password"/></label>

                                    <div class="col-md-6">
                                        <g:passwordField name="password" class="form-control"
                                                         required="required"/>
                                    </div>
                                </div>

                                <div class="col-md-6 offset-md-4">
                                    <g:submitButton name="registration" value="Registration" id="submit"
                                                    class="btn btn-primary"/>
                                    <g:link controller="authentication" action="login"
                                            class="btn btn-primary"><g:message
                                            code="cancel"/></g:link>

                                </div>

                            </g:form>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

