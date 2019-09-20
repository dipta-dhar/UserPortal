<div class="form-group row">
    <label class="col-md-4 col-form-label text-md-right"><g:message
            code="first.name"/></label>

    <div class="col-md-6">
        <g:textField name="firstName" class="form-control" required="required" value="${user?.firstName}"/>
    </div>
    <UIHelper:renderErrorMessage fieldName="firstName" model="${user}" errorMessage="please.enter.first.name"/>
</div>

<div class="form-group row">
    <label class="col-md-4 col-form-label text-md-right"><g:message
            code="last.name"/></label>

    <div class="col-md-6">
        <g:textField name="lastName" class="form-control" required="required" value="${user?.lastName}"/>
    </div>
</div>

<div class="form-group row">
    <label class="col-md-4 col-form-label text-md-right"><g:message
            code="email.address"/></label>

    <div class="col-md-6" id="email-div">
        <input type="email" name="email" id="emailid" onblur="emailCheck()" value="${user?.email}" required
               class="form-control"/>
    </div>
    <span id="email-availability-status"></span>
</div>

<div class="form-group row">
    <label class="col-md-4 col-form-label text-md-right"><g:message
            code="phone.number"/></label>

    <div class="col-md-6" id="phone-number-div">
        <input type="phone" name="phoneNumber" id="numberId"
               onkeyup="return validatePhoneNumber(this.value)" value="${user?.phoneNumber}" required
               class="form-control"/>
    </div><span id="number-validate-status"></span>

</div>

<g:if test="${!edit}">
    <div class="form-group">
        <label><g:message code="password"/> *</label>
        <g:passwordField name="password" class="form-control" value="${user?.password}"
                         placeholder="Please Enter Password"/>
        <UIHelper:renderErrorMessage fieldName="password" model="${user}" errorMessage="Please Enter a Password."/>
    </div>
</g:if>