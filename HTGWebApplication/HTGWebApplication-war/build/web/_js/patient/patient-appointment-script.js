/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/*
    Document   : appointment-patient-script.js
    Version    : April 3, 2017
    Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
    Description: javascript for patient appointment booking JSP
*/

$(document).ready(function (){
    registerListeners();
});

/**
 * Method to register listeners for appointment-patient.jsp
 */
function registerListeners(){
    modalPatientAppointmentBookerPopup();    
    modalCancelPatientAppointmentPopup();
    popupMessageModal();
}

/**
 * Function to launch appointment booker modal popup
 */
function modalPatientAppointmentBookerPopup(){
    $('.patient-appointment-booker').click(function (){
        $('#modal-appointment-booker-popup').modal();
    });
}

/**
 * Function to cancel an appointment modal popup
 */
function modalCancelPatientAppointmentPopup(){
    $('.patient-cancel-booked-appointment').click(function (){
        $('#modal-cancel-appointment-popup').modal();
    });
}

/**
 * Handles the logout modal popup message on home page
 */
function popupMessageModal(){
    var msg = $('#message-text').text();
    if(msg!==""){
        $('#modal-messages-popup').modal();
    }
}