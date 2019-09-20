package com.reborn.portal


class User {

    Integer id
    String firstName
    String lastName
    String password
    String address
    String phoneNumber
    String email
    Integer age
    String userType = GlobalConfig.USER_TYPE.USER
    Boolean isActive = true
    Date birthDate

    Date dateCreated
    Date lastUpdated

    static constraints = {
        age(nullable: true)
        password(blank: false)
        address(nullable: true)
        lastName(nullable: true)
        phoneNumber(nullable: false)
        email(email: true, nullable: false, unique: true, blank: false)
    }

    def beforeInsert() {
        this.password = this.password.encodeAsMD5()
    }

    def beforeUpdate() {
        this.password = this.password.encodeAsMD5()
    }
}
