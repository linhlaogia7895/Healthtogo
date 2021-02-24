/**
 * Document   : advertisements.js
 * Version    : Jan 28, 2017
 * Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
 * Description: Javascript for advertisements.jsp
 */

$(document).ready(function (){
    advertsListeners();
});

/**
 * Function to launch listeners for nutrition-library.jsp
 */
function advertsListeners(){
    
    datePicker2();
    popupMessageModal();
    adjustPageHeight();
    tableHeaderTitleStyle();
    defaultTable();
    onClickCalorieTable();
    onClickTipsTable();
    onClickFAQTable();
    checkTableSelectorPerClickedLinkedOnHomePage();
    tableSelectorPerIconClick();
    fileUploading();
    
}

function fileUploading(){
    $(".fileUpload").fileinput({
        uploadExtraData: {kvId: '10'}
    });
    $(".btn-warning").on('click', function () {
        var $el = $(".fileUpload");
        if ($el.attr('disabled')) {
            $el.fileinput('enable');
        } else {
            $el.fileinput('disable');
        }
    });
    $(".btn-info").on('click', function () {
        $(".fileUpload").fileinput('refresh', {previewClass: 'bg-info'});
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
 * Still on testing
 */
function adjustPageHeight(){
    var ht=$('nav[class="w3-sidenav w3-black"]').height();
    console.log("nav height: "+ht);
}

/**
 * Function that shows the table clicked from under quick links on index.jsp
 */
function checkTableSelectorPerClickedLinkedOnHomePage(){
    var ts=$('#tableSelector').text();
    if(ts!==null || ts!=="" ){
        switch(ts){
            case "news":
                $('#news-table').show(2000);
                $('#promos-table').hide();
                $('#career-table').hide();
                $('#intern-table').hide();
                $('#volunteer-table').hide();
                break;
            case "promos":
                $('#news-table').hide();
                $('#promos-table').show(2000);
                $('#career-table').hide();
                $('#intern-table').hide();
                $('#volunteer-table').hide();
                break;
            case "career":
                $('#news-table').hide();
                $('#promos-table').hide();
                $('#career-table').show(2000);
                $('#intern-table').hide();
                $('#volunteer-table').hide();
                break;
	    case "intern":
                $('#news-table').hide();
                $('#promos-table').hide();
                $('#career-table').hide();
                $('#intern-table').show(2000);
                $('#volunteer-table').hide();
                break;
	    case "volunteer":
		$('#news-table').hide();
		$('#promos-table').hide();
		$('#career-table').hide();
		$('#intern-table').hide();
		$('#volunteer-table').show(2000);
                break;
            default:
        }
    }
}



function tableSelectorPerIconClick(){
    $('.news-section-icon').click(function (){
	$('#news-table').show(2000);
	$('#promos-table').hide();
	$('#career-table').hide();
	$('#intern-table').hide();
	$('#volunteer-table').hide();
    });
    
    $('.promos-section-icon').click(function (){
	$('#news-table').hide();
	$('#promos-table').show(2000);
	$('#career-table').hide();
	$('#intern-table').hide();
	$('#volunteer-table').hide();
    });
    
    $('.careers-section-icon').click(function (){
	$('#news-table').hide();
	$('#promos-table').hide();
	$('#career-table').show(2000);
	$('#intern-table').hide();
	$('#volunteer-table').hide();
    });
    
    $('.interns-section-icon').click(function (){
	$('#news-table').hide();
	$('#promos-table').hide();
	$('#career-table').hide();
	$('#intern-table').show(2000);
	$('#volunteer-table').hide();
    });
    
    $('.volunteers-section-icon').click(function (){
	$('#news-table').hide();
	$('#promos-table').hide();
	$('#career-table').hide();
	$('#intern-table').hide();
	$('#volunteer-table').show(2000);
    });
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
    $('#news-table').show(2000);
	$('#promos-table').hide();
	$('#career-table').hide();
	$('#intern-table').hide();
	$('#volunteer-table').hide();
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