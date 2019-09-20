package com.reborn.portal

class ProfileController {

    UserService userService

    def index() {
        def response = userService.list(params)
        [userList: response.list, total: response.count]
    }

    def details(Integer id) {
        def response = userService.getById(id)
        if (!response) {
            redirect(controller: "user", action: "index")
        } else {
            [user: response]
        }
    }
}
