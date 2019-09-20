package com.reborn.portal


class UserController {

    UserService userService

    def index() {
        def response = userService.list(params)
        [userList: response.list, total: response.count]
    }

    /** User details view */
    def details(Integer id) {
        def response = userService.getById(id)
        if (!response) {
            redirect(controller: "user", action: "index")
        } else {
            [user: response]
        }
    }

    def create() {
        [user: flash.redirectParams]
    }

    /** save the user information */
    def save() {
        def response = userService.save(params)
        if (!response.isSuccess) {
            flash.redirectParams = response.model
            flash.message = AppUtils.infoMessage(g.message(code: "unable.to.save"), false)
            redirect(controller: "user", action: "create")
        } else {
            flash.message = AppUtils.infoMessage(g.message(code: "saved"))
            redirect(controller: "user", action: "index")
        }
    }

    /** return edit view page when the user update method called */
    def edit(Integer id) {
        if (flash.redirectParams) {
            [user: flash.redirectParams]
        } else {
            def response = userService.getById(id)
            if (!response) {
                flash.message = AppUtils.infoMessage(g.message(code: "invalid.entity"), false)
                redirect(controller: "user", action: "index")
            } else {
                [user: response]
            }
        }
    }

    /** get the user information edit view page by user ID */
    def update() {
        def response = userService.getById(params.id)
        if (!response) {
            flash.message = AppUtils.infoMessage(g.message(code: "invalid.entity"), false)
            redirect(controller: "user", action: "index")
        } else {
            response = userService.update(response, params)
            if (!response.isSuccess) {
                flash.redirectParams = response.model
                flash.message = AppUtils.infoMessage(g.message(code: "unable.to.update"), false)
                redirect(controller: "user", action: "edit")
            } else {
                flash.message = AppUtils.infoMessage(g.message(code: "updated"))
                redirect(controller: "user", action: "index")
            }
        }
    }

    /** Delete the user by using user ID */
    def delete(Integer id) {
        def response = userService.getById(id)
        if (!response) {
            flash.message = AppUtils.infoMessage(g.message(code: "invalid.entity"), false)
            redirect(controller: "user", action: "index")
        } else {
            response = userService.delete(response)
            if (!response) {
                flash.message = AppUtils.infoMessage(g.message(code: "unable.to.delete"), false)
            } else {
                flash.message = AppUtils.infoMessage(g.message(code: "deleted"))
            }
            redirect(controller: "user", action: "index")
        }
    }
}
