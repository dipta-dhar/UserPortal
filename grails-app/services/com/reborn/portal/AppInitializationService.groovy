package com.reborn.portal


class AppInitializationService {

    static initialize() {
        initUser()
    }

    private static initUser() {
        if (User.count() == 0) {
            User user = new User()
            user.firstName = "System"
            user.lastName = "Admin"
            user.email = "admin@localhost.local"
            user.password = "admin"
            user.phoneNumber = "01800000000"
            user.address = "Mohakhali DOHS"
            user.birthDate = new Date()
            user.age = 30
            user.userType = GlobalConfig.USER_TYPE.ADMIN
            user.save(flash: true)
        }
    }
}
