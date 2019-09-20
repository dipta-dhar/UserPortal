package com.reborn.portal


class UIHelperTagLib {
    static namespace = "UIHelper"

    AuthenticationService authenticationService

    /** render error message and show it to user for invalid input */
    def renderErrorMessage = { attrs, body ->
        def model = attrs.model
        String fieldName = attrs.fieldName
        String errorMessage = attrs.errorMessage ? g.message(code: attrs.errorMessage) : g.message(code: "invalid.input")
        if (model && model.errors && model.errors.getFieldError(fieldName)) {
            out << "<small class='form-text text-danger''><strong>${errorMessage}</strong></small>"
        }
    }

    /** showing logged in member name and dropdown option to logout from the application */
    def userActionMenu = { attrs, body ->
        out << '<li class="nav-item dropdown">'
        out << g.link(class: "nav-link dropdown-toggle", "data-toggle": "dropdown", "aria-haspopup": "true", "aria-expanded": "false") {
            authenticationService.getUserName()
        }
        out << '<div class="dropdown-menu dropdown-menu-right", "aria-labelledby": "navbarDropdown">'
        if (!authenticationService.isAdminUser()) {
            out << g.link(controller: "changePassword", action: "edit", id: authenticationService.getLoginUserId(), class: "dropdown-item") {
                g.message(code: "change.password")
            }
        }
        out << g.link(controller: "authentication", action: "logout", class: "dropdown-item") {
            g.message(code: "logout")
        }
        out << "</div></li>"
    }

    /** showing navigation menu depends user type */
    def leftNavigation = { attrs, body ->
        List navigations = []

        if (authenticationService.isAdminUser()) {
            navigations.add([controller: "user", action: "index", name: "User List"])
        } else {
            navigations.add([controller: "profile", action: "details", id: authenticationService.getLoginUserId(), name: "Profile Page"])
            navigations.add([controller: "changePassword", action: "edit", id: authenticationService.getLoginUserId(), name: "Change Password"])
        }

        navigations.each { menu ->
            if (menu.id > 0) {
                out << g.link(controller: menu.controller, action: menu.action, id: menu.id, class: "list-group-item list-group-item-action bg-light") {
                    g.message(code: menu.name, args: [''])
                }
            } else {
                out << g.link(controller: menu.controller, action: menu.action, class: "list-group-item list-group-item-action bg-light") {
                    g.message(code: menu.name, args: [''])
                }
            }
        }
    }

    /** get application base URL */
    def appBaseURL = { attrs, body ->
        out << AppUtils.baseURL();
    }
}
