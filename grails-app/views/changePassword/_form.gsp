<div class="form-group row">
    <label class="col-md-4 col-form-label text-md-right">
        <g:message code="previous.password"/>
    </label>

    <div class="col-md-6">
        <g:passwordField name="previousPassword" class="form-control" required="required"/>
        <UIHelper:renderErrorMessage fieldName="previousPassword" model="${user}" errorMessage="Please Enter Previous Password."/>
    </div>
</div>

<div class="form-group row">
    <label class="col-md-4 col-form-label text-md-right">
        <g:message code="new.password"/>
    </label>

    <div class="col-md-6">
        <g:passwordField name="newPassword" class="form-control" required="required"/>
        <UIHelper:renderErrorMessage fieldName="newPassword" model="${user}" errorMessage="Please Enter New Password."/>
    </div>
</div>

<div class="form-group row">
    <label class="col-md-4 col-form-label text-md-right"><g:message
            code="confirm.password"/></label>

    <div class="col-md-6">
        <g:passwordField name="confirmPassword" class="form-control" required="required"/>
        <UIHelper:renderErrorMessage fieldName="confirmPassword" model="${user}" errorMessage="Please Enter Confirm Password."/>
    </div>
</div>
