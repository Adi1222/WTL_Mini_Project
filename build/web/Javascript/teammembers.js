/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function (e){
   console.log('Loaded');
   $('#home').removeClass('active');
    $('#students').addClass('active');
   $.ajax({
       url: '../StudentModule/loadteam.jsp',
       success: function(data, textStatus, jqXHR) {
           $('#loader').hide();
           $('#students-container').html(data);
       },
       fail: function(res) {
           console.log(res);
       }
   });
});