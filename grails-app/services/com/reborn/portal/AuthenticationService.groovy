package com.reborn.portal


class AuthenticationService {

    private static final String AUTHORIZED = "AUTHORIZED"


    /** Login user  authorization session create */
    def setUserAuthorization(User user) {
        def authorization = [isLoggedIn: true, user: user]
        AppUtils.getAppSession()[AUTHORIZED] = authorization
    }

    /** Login and set the user authorization */
    def doLogin(String email, String password) {
        password = password.encodeAsMD5()
        User user = User.findByEmailAndPassword(email, password)
        if (user) {
            setUserAuthorization(user)
            return true
        }
        return false
    }

    /** Check the logged in user authorization status */
    boolean isAuthenticated() {
        def authorization = AppUtils.getAppSession()[AUTHORIZED]
        if (authorization && authorization.isLoggedIn) {
            return true
        }
        return false
    }

    /** get Logged in user */
    def getUser() {
        def authorization = AppUtils.getAppSession()[AUTHORIZED]
        return authorization?.user
    }

    /** return Logged in user Name */
    def getUserName() {
        def user = getUser()
        return "${user.firstName} ${user.lastName}"
    }

    /** check is it ADMIN user & return */
    def isAdminUser() {
        def user = getUser()
        if (user && user.userType == GlobalConfig.USER_TYPE.ADMIN) {
            return true
        }
        return false
    }

    /** get Logged in user ID */
    def getLoginUserId() {
        def user = getUser()
        if (user) {
            return user.getId()
        }
        return 0
    }
}
