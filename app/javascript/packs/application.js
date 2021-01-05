require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
require("trix")
require("@rails/actiontext")
require("jquery")

import 'chart.js'
import 'moment'
import 'chartkick'
import 'bootstrap'
import 'jquery.easing/jquery.easing.js'
import 'chart.js'
import './basic-qr-code-reader.js'
import 'datatables.net-bs4/js/dataTables.bootstrap4'
import '@fortawesome/fontawesome-free/js/all'
import 'select2'
import 'select2/dist/css/select2.css'
import 'select2-bootstrap4-theme/dist/select2-bootstrap4'
import './src/application.scss'
import 'assets/javascripts/sb-admin-2.min.js'
import 'assets/stylesheets/sb-admin-2.min.css'
import ahoy from "ahoy.js"
import 'bootstrap-datepicker'
import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"

const application = Application.start()
const context = require.context("../controllers", true, /\.js$/)
application.load(definitionsFromContext(context))
const images = require.context('../images', true) 
const imagePath = (name) => images(name, true)

document.addEventListener('DOMContentLoaded', function() {
  $("select").select2({
    theme: 'bootstrap4',
  })

  $("#remote-container").on('shown.bs.modal', function () {
    $("#edit_pm_schedule_eqp_object").trigger('focus')
  })
  $('.datepicker input').datepicker({
    todayBtn: "linked",
    todayHighlight: true,
    autoclose: true,
    zindex: 2048,
  })
  $("#sidebarToggle, #sidebarToggleTop").on('click', function(e) {
    $("body").toggleClass("sidebar-toggled")
    $(".sidebar").toggleClass("toggled")
    if ($(".sidebar").hasClass("toggled")) {
      $('.sidebar .collapse').collapse('hide')
    }
  })
  $('#dataTable').DataTable({
    "paging":   false
  })
})

$(function () {
  $(document).on('change', '.remote-select', function (e) {
    var target = $(this).attr('data-target')
    var url = $(this).find(":selected").attr('data-url')
    if (url){
      $.ajax({
        url: url,
        method: 'GET',
        success: function (json) {
          var target_select = $(target)
          target_select.empty()
          json.map(function (item) {
            value = $('<option></option>').attr('value', item.id).text(item.code)
            target_select.append(value)
          })
          target_select.trigger("chosen:updated")
        },
        error: function () { }
      })
    }
  })
})
