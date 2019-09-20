package com.reborn.portal


class JQueryDatePickerTagLib {

    def jqDatePicker = { attrs, body ->
        def out = out
        def name = attrs.name    //The name attribute is required for the tag to work seamlessly with grails
        def id = attrs.id ?: name
        def minDate = attrs.minDate
        def showDay = attrs.showDay
        def val = attrs.value ?: ''

        out.println "<div class=\"col-md-6 input-group date\" id=\"datetimepicker1\">"

        //Create date text field and supporting hidden text fields need by grails
        out.println "<input type=\"text\" name=\"${name}\" id=\"${id}\" value=\"${val}\" class=\"form-control\"/>"
        out.println "<input type=\"hidden\" name=\"${name}\" id=\"${id}\" value=\"date.struct\" />"
        out.println "<input type=\"hidden\" name=\"${name}_day\" id=\"${id}_day\" />"
        out.println "<input type=\"hidden\" name=\"${name}_month\" id=\"${id}_month\" />"
        out.println "<input type=\"hidden\" name=\"${name}_year\" id=\"${id}_year\" />"

        out.println "<span class=\"input-group-addon\" id=\"cal-icon\" >"
        out.println "<span class=\"fa fa-calendar-alt fa-2x\" />"

        out.println "</span>"
        out.println "</div>"

        //Code to parse selected date into hidden fields required by grails
        out.println "<script type=\"text/javascript\"> \$(document).ready(function(){"
        //out.println "\$(\"input[name='${name}']\").datepicker({"
        out.println "\$(\"div[id='datetimepicker1']\").datepicker({"
        out.println "onClose: function(dateText, inst) {"
        out.println "\$(\"input[name='${name}']\").attr(\"value\",dateText);"
        out.println "\$(\"input[name='${name}_month']\").attr(\"value\",new Date(dateText).getMonth() +1);"
        out.println "\$(\"input[name='${name}_day']\").attr(\"value\",new Date(dateText).getDate());"
        out.println "\$(\"input[name='${name}_year']\").attr(\"value\",new Date(dateText).getFullYear());"
        out.println "}"

        //If you want to customize using the jQuery UI events add an if block an attribute as follows
        if (minDate != null) {
            out.println ","
            out.println "minDate: ${minDate}"
        }

        if (showDay != null) {
            out.println ","
            out.println "beforeShowDay: function(date){"
            out.println "var day = date.getDay();"
            out.println "return [day == ${showDay},\"\"];"
            out.println "}"
        }

        out.println "});"

        if (val != '') {
            out.println("\n")
            out.println "\$(\"input[name='${name}_month']\").attr(\"value\",new Date('${val}').getMonth() +1);"
            out.println "\$(\"input[name='${name}_day']\").attr(\"value\",new Date('${val}').getDate());"
            out.println "\$(\"input[name='${name}_year']\").attr(\"value\",new Date('${val}').getFullYear());"
        }

        out.println "})</script>"
    }
}
