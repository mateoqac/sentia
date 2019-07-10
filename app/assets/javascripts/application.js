// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

$(document).ready(function(){
  lookUp();
  $('#name').click(function (){
    alert('name')
    //  $.ajax({
    //   url: 'users/sort.js',
    //   type: 'GET',
    //   async: false,
    //   cache: false,
    //   data: jQuery.param({ sort: 'name', direction : "ASC"})
    // })
    return true
  })

  $('#date').click(function (){
    alert('DATE')
    // $.ajax({
    //   url: 'users/sort.js',
    //   type: 'GET',
    //   async: false,
    //   cache: false,
    //   data: jQuery.param({ sort: 'date', direction : "ASC"})
    // })
    return true
  })

  $('#number').click(function (){
    alert('number')
    $.ajax({
      url: "users/sort",
      type: 'POST',
      data: {
        sort : "number",
        direction : "ASC"
      },
      dataType : 'script'
  })
  return false
  })
})

function clickable(){

  
}

function lookUp() {

  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("input-search");
  filter = input.value.toUpperCase();
  table = document.getElementById("table");
  tr = table.getElementsByTagName("tr");

  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    } 
  }
}