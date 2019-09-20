package com.reborn.portal


class UserInterceptor {

    AuthenticationService authenticationService

    boolean before() {
        if (authenticationService.isAdminUser()) {
            return true
        }
        flash.message = AppUtils.infoMessage("You are not Authorized!", false)
        redirect(controller: "user", action: "index")
        return false
    }
}
