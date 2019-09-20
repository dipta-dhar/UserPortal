package com.reborn.portal


class GlobalConfig {
    public static final def USER_TYPE = [
            ADMIN: "ADMIN",
            USER : "USER",
    ]

    public static Integer itemsPerPage() {
        return 5
    }
}
