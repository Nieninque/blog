/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

window.addEventListener("DOMContentLoaded", function () {
  var form = document.getElementById("formCategory");

document.getElementById("byCategory").addEventListener("change", function () {
  form.submit();
});
});
