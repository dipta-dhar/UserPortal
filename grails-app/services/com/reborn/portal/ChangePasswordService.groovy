package com.reborn.portal

import grails.web.servlet.mvc.GrailsParameterMap


class ChangePasswordService {

    def updateUserPassword(User user, GrailsParameterMap params) {
        user.properties = params
        def response = AppUtils.saveResponse(false, user)

        String previousPassword = params.previousPassword
        String newPassword = params.newPassword
        String confirmPassword = params.confirmPassword

        if (user) {
            if (previousPassword.encodeAsMD5() == user.getPassword()) {
                if (newPassword != previousPassword) {
                    if (newPassword == confirmPassword) {
                        user.password = confirmPassword
                        user.save(flush: true)
                        response.isSuccess = true
                    } else {
                        response = AppUtils.saveErrorMessage(0, "New Password & Confirm Password can't match!")
                    }
                } else {
                    response = AppUtils.saveErrorMessage(1, "Previous Password & New Password are same!!")
                }
            } else {
                response = AppUtils.saveErrorMessage(2, "Wrong Previous Password, please check!")
            }
        }
        return response
    }
}
