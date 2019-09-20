package com.reborn.portal

import org.grails.web.util.WebUtils


class AppUtils {

    /** save the success status of respective model */
    static saveResponse(Boolean isSuccess, def model) {
        return [isSuccess: isSuccess, model: model]
    }

    /** get the latest user session to check authorization */
    static getAppSession() {
        return WebUtils.retrieveGrailsWebRequest().session
    }

    /** to show flash message after user interaction */
    static infoMessage(String message, boolean status = true) {
        return [info: message, success: status]
    }

    /** get the project base URL context path */
    static String baseURL() {
        return "${getAppSession().getServletContext().getContextPath()}/"
    }

    /** save error message with different id so that we can invoke the error message depends on errorId */
    static saveErrorMessage(Integer errorId, String message) {
        return [errorId: errorId, errorMessage: message]
    }

    /** Calculate user age between two DATE object */
    static Integer getAge(Date birthday, Date offset) {
        def birthdayThisYear = offset.clone().clearTime()
        birthdayThisYear[Calendar.MONTH] = birthday[Calendar.MONTH]
        birthdayThisYear[Calendar.DATE] = birthday[Calendar.DATE]

        offset[Calendar.YEAR] - birthday[Calendar.YEAR] - (birthdayThisYear > offset ? 1 : 0)
    }
}
