<meta name="layout" content="public"/>
<title><g:message code="login.page" /></title>

<div id="global-wrapper">
    <div id="content-wrapper">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <g:img dir="images" file="user.png" class="profile-img"/>
                    <h1 class="text-center login-title">Login Panel</h1>

                    <div class="card">
                        <g:form controller="authentication" action="doLogin" class="form-signin">
                            <div class="form-group">
                                <label class="text-center login-form-level"><g:message code="email.address"/></label>
                                <g:textField name="email" class="form-control" required="required"/>
                            </div>

                            <div class="form-group">
                                <label class="text-center login-form-level"><g:message code="password"/></label>
                                <g:passwordField name="password" class="form-control"
                                                 required="required"/>
                            </div>

                            <div class="row">
                                <div class="col-xs-6 col-sm-6 col-md-6">
                                    <g:submitButton class="btn btn-lg btn-primary btn-block" name="login"
                                                    value="Login"/>
                                </div>

                                <div class="col-xs-6 col-sm-6 col-md-6">
                                    <g:submitButton class="btn btn-lg btn-primary btn-block" name="clear"
                                                    value="Clear"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-md-12 control">
                                    <div style="border-bottom: 1px solid#888; padding-top:25px; font-size:85%"
                                         class="text-center login-form-level">
                                        Are you new here?
                                        <g:link controller="authentication" action="registration"
                                                class="">Register Now</g:link>
                                    </div>
                                </div>
                            </div>

                        </g:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>