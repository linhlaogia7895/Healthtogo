/**
 * Document   : staff.js
 * Version    : Jan 6, 2017
 * Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
 * Description: Javascript for staff page
 */

var previousLogoWidth;
var newPageWidth;
var newNavWidth;
var canSee;

$(document).ready(function (){
    registerListenersCommon();
});


/**
 * Function to initiate the listeners for main page
 */
function registerListenersCommon(){
    setNavBarElementsStatuses();
    
    previousLogoWidth = $('#logo').width();
    
    $(window).on({
        resize: 
            function(){
                navbarToggleUpdateElementsCommon();
        }
    });
    
    modalInvoicePopup();
    
}


/**
 * 
 * Function to launch Create Invoice Popup
 */
function modalInvoicePopup()
{
    $('#invoice-popup').click(function(){
        $('#modal-invoice-popup').modal();
    });
        
}