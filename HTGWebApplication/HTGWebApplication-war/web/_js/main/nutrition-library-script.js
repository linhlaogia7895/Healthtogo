/**
 * Document   : nutrition-library.js
 * Version    : Jan 6, 2017
 * Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
 * Description: Javascript for nutrition-library.jsp
 */

$(document).ready(function (){
    libraryListeners();
});

/**
 * Function to launch listeners for nutrition-library.jsp
 */
function libraryListeners(){
    popupMessageModal();
//    servletMessagePopupAndDestroy();
    tableHeaderTitleStyle();
    defaultTable();
    onClickCalorieTable();
    onClickTipsTable();
    onClickFAQTable();
    checkTableSelector();
    datePicker2();
}


/**
 * Function to show/hide date picker
 */
function datePicker2(){
    $( function() {
        var dateToday = new Date();
        var yrRange = (dateToday.getFullYear()-100) + ":" + dateToday.getFullYear();
        $( ".datepicker2" ).datepicker({
            yearRange : yrRange,
            dateFormat: 'mm/dd/yy',
            changeMonth: true,
            changeYear: true,
            showAnim: 'show'
        });
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

/**
 * Function that shows the table clicked from under quick links on index.jsp
 */
function checkTableSelector(){
    var ts=$('#tableSelector').text();
    if(ts!==null || ts!=="" ){
        switch(ts){
            case "calorie":
                $('.calorie-table-body').show(2000);
                $('.tips-table-body').hide();
                $('.faq-table-body').hide();
                break;
            case "tips":
                $('.calorie-table-body').hide();
                $('.tips-table-body').show(2000);
                $('.faq-table-body').hide();
                break;
            case "faq":
                $('.calorie-table-body').hide();
                $('.tips-table-body').hide();
                $('.faq-table-body').show(2000);
                break;
            default:
        }
    }
}

/**
 * Function to set as uniform the styles for the table headers
 */
function tableHeaderTitleStyle(){
    $('thead tr td a').click(function (){
        $(this).css('color','white')
                .css('font-weight','bold')
                .css('text-decoration','none');
    });
}

/**
 * Function to set which default table to show and hide
 */
function defaultTable(){
    $('.calorie-table-body').show(2000);
    $('.tips-table-body').hide();
    $('.faq-table-body').hide();
}

/**
 * Function to make the calorie table to show and hide the rest
 */
function onClickCalorieTable(){
    $('.calorie-table-icon').click(function(){
        $('.tips-table-body').hide();
        $('.faq-table-body').hide();
        $('.calorie-table-body').show(2000);
    });
}

/**
 * Function to make the tips table to show and hide the rest
 */
function onClickTipsTable(){
    $('.tips-table-icon').click(function(){
        $('.calorie-table-body').hide();
        $('.faq-table-body').hide();
        $('.tips-table-body').show(2000);
    });
}

/**
 * Function to make the faq table to show and hide the rest
 */
function onClickFAQTable(){
    $('.faq-table-icon').click(function(){
        $('.calorie-table-body').hide();
        $('.tips-table-body').hide();
        $('.faq-table-body').show(2000);
    });
}