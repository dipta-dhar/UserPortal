package com.reborn.portal

import grails.web.servlet.mvc.GrailsParameterMap


class UserService {

    /** Save user information */
    def save(GrailsParameterMap params) {
        User user = new User(params)
        def response = AppUtils.saveResponse(false, user)
        if (user.validate()) {
            user.age = AppUtils.getAge(user.getBirthDate(), new Date())
            user.save(flush: true)
            if (!user.hasErrors()) {
                response.isSuccess = true
            }
        }
        return response
    }

    /** Update user information */
    def update(User user, GrailsParameterMap params) {
        user.properties = params
        def response = AppUtils.saveResponse(false, user)
        if (user.validate()) {
            user.save(flush: true)
            if (!user.hasErrors()) {
                response.isSuccess = true
            }
        }
        return response
    }

    /** get user model using ID */
    def getById(Serializable id) {
        return User.get(id)
    }

    /** get user list & ordered by ID */
    def list(GrailsParameterMap params) {
        params.max = params.max ?: GlobalConfig.itemsPerPage()
        List<User> userList = User.createCriteria().list(params) {
            if (params?.colName && params?.colValue) {
                like(params.colName, "%" + params.colValue + "%")
            }
            if (!params.sort) {
                order("id", "desc")
            }
            eq("userType", GlobalConfig.USER_TYPE.USER)
        }
        return [list: userList, count: userList.totalCount]
    }

    /** Delete the user */
    def delete(User user) {
        try {
            user.delete(flush: true)
        } catch (Exception e) {
            println(e.getMessage())
            return false
        }
        return true
    }

    /** Check user is exist or not */
    def getUserByEmail(String email) {
        User user = User.findByEmail(email)
        if (user) {
            return true
        }
        return false
    }
}
