/**
 * Document   : common-to-all-script.js
 * Version    : Jan 3, 2017
 * Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
 * Description: Javascript for all html pages
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
    
    modalLoginPopup();
    modalContactPopup();
    modalSignUpPopup();
    modalRequireLoginPopup();
    modalForgotPasswordPopup();
    datePicker();
    datePickerHire();
    slideshow();
    toggleToolTip();
    loggedInUserLinkToPage();
    hideUpdate();
    hideDeactivate();
    hideReactivate();
    hideDelete();
    hideResetLogin();
    hideLock();
    hideUnlock();
    hideUpdatePatient();
    hideDeactivatePatient();
    hideReactivatePatient();
    hideDeletePatient();
    popupMessageModal();
}


/**
 * Unimplemented yet
 */
function loggedInUserLinkToPage(){
    var loggedIn = $('.logged-in').text();
    if(loggedIn.indexOf("admin")>-1){
        
    }
}

/**
 * On load, sets up the page elements that should be showing and not-showing
 */
function setNavBarElementsStatuses(){
    $('.not-showing').hide();
    $('.showing').show();
}

/**
 * Function to toggle tooltips and popovers
 */
function toggleToolTip(){
    
    $('[data-toggle="popover"]').popover({
        trigger: 'focus'
    });
    
    $('.office-address').popover({
        trigger: 'hover'
    });
}

/**
 * Function to slideshow the header logo
 */
function slideshow(){
    $(".slideshow > div:gt(0)").hide();

    setInterval(function() {
        $('.slideshow > div:first')
          .fadeOut(1000)
          .next()
          .fadeIn(1000)
          .end()
          .appendTo('.slideshow');
    },  2000);
}

/**
 * Function to remove the html popup of the message from servlet
 */
function servletMessagePopupAndDestroy(){
    $('.modal-messages-popup').modal().hide(8000,function (){
        $(this).empty().remove();
    });
}

/**
 * Function to launch the modal login popup
 */
function modalLoginPopup(){
    $("#my-login").click(function(){
        $("#modal-login-popup").modal();
    });    
}

/**
 * Function to launch contact popup
 */
function modalContactPopup(){
    $('#contact-popup').click(function(){
        $('#modal-contact-popup').modal();
    });
}

/**
 * Function to launch sign up popup
 */
function modalSignUpPopup(){
    $('.sign-up').click(function (){
        $('#modal-sign-up-popup').modal();
    });
}

/**
 * Function to launch require login popup
 */
function modalRequireLoginPopup(){
    $('.require-login').click(function (){
        $('#modal-require-login-popup').modal();
    });
}

function modalForgotPasswordPopup(){
    $('#forgot-password').click(function (){
        $('#modal-forgot-password-popup').modal();
    });
}

/**
 * Function to show/hide date picker
 */
function datePicker(){
    $( function() {
        var dateToday = new Date();
        var yrRange = (dateToday.getFullYear()-100) + ":" + dateToday.getFullYear();
        $( "#datepicker" ).datepicker({
            yearRange : yrRange,
            dateFormat: 'mm/dd/yy',
            changeMonth: true,
            changeYear: true,
            showAnim: 'show'
        });
    });
}
/**
 * Function to show/hide date picker
 */
function datePickerHire(){
    $( function() {
        var dateToday = new Date();
        var yrRange = (dateToday.getFullYear()-100) + ":" + dateToday.getFullYear();
        $( "#datepickerHire" ).datepicker({
            yearRange : yrRange,
            dateFormat: 'mm/dd/yy',
            changeMonth: true,
            changeYear: true,
            showAnim: 'show'
        });
    });
}

/**
 * Function that responds to window RESIZE event listener
 */
function navbarToggleUpdateElementsCommon(){
    adjustLogo();
    adjustFooterFont();
    
    /*for testing*/
    getDynamicWightHeight();
}

/**
 * Function to adjust logo on page resize
 */
function adjustLogo(){
    //Checks if the main navbar is visible
    canSee = $("#myNavbar").is(":visible");
    if(canSee != true){

        //sets the new logo width, alters the logo effects
        $("div[id^='slides']").removeClass('slideshow');
        $('#slides img').addClass('hovereffect');
        $('.logos').width($('.page').width() / 2);
        
        
        
        /*sets the navbar-brand text as the navbar shrinks while 
        the links change into the hamburger menu*/
        $('.navbar-brand').text('Health To Go Nutrition Care');    
        newPageWidth = $('.page').width();
        if(newPageWidth < 255){
            $('.navbar-brand').text('HTGNC');
        }
        else if($('.page').width() < 325){
            $('.navbar-brand').text('HTG Nutrition Care');
        }
    }
    else{
        //removes the navbar-brand text
        $('.navbar-brand').text('');

        //sets logo width to original width, alters the logo effects
        $('.logos').width(previousLogoWidth);
        $("div[id^='slides']").addClass('slideshow');
        $('#slides img').removeClass('hovereffect');
    }
}

/*adjusts the footer font*/
function adjustFooterFont(){
    var size = $('.page').width() - 30;
    if(size < 232){
        /*adds 3 breaks*/
        $('footer p').html('Copyright &copy; Health To Go, Inc. <br> 403-3995382' + 
                '<br> <a href="mailto:amina.ashraf@yahoo.com">amina.ashraf@yahoo.com</a>' + 
                '<br> Designed by: M.R.M.T.R. ');        
    }else if(size < 460){
        
        /*adds a break*/
        $('footer p').html('Copyright &copy; Health To Go, Inc. <strong>|</strong> 403-3995382' + 
                '<br> <a href="mailto:amina.ashraf@yahoo.com">amina.ashraf@yahoo.com</a>' + 
                '<strong>|</strong> Designed by: M.R.M.T.R. ');        
        
    }else if(size < 585){
        $('footer p').css('font-size','10px');

        /*removes the break*/
        $('footer p').html('Copyright &copy; Health To Go, Inc. <strong>|</strong> 403-3995382' + 
                '<strong>|</strong> <a href="mailto:amina.ashraf@yahoo.com">amina.ashraf@yahoo.com</a>' + 
                '<strong>|</strong> Designed by: M.R.M.T.R. ');        
    }else if(size < 670){
        $('footer p').css('font-size','13px');        
    }else if(size < 770){
        $('footer p').css('font-size','15px');
    }else if(size < 900){
        $('footer p').css('font-size','17px');
    }else{
        $('footer p').css('font-size','20px');
    }
}

/**
 * for testing purposes
 */
function getDynamicWightHeight(){
    $('#sWidth').text($('.main-img').width());
    $('#sHeight').text($('.main-img').height());
    
/*   
    to be added into jsp/html file
    Height: <span id="sHeight">0</span><br>
    Width: <span id="sWidth">0</span>
*/
}

/**
 * for testing purposes
 */
function toggleDisplay(showE, hideE){
    
    $(showE).hover(function(){
        $(this).fadeOut(1000);
        $(hideE).fadeIn(1000);
    },function(){
        $(hideE).fadeOut(1000);
        $(this).fadeIn(1000);
    });
}

    //function to show and hide when update button is clicked
function hideUpdate(){
    $(document).ready(function(){
    $("#update").hide();
    $("#updateStaff").click(function(){
        $("#update").show();
    });
});
}
function hideDeactivate(){
$(document).ready(function(){
    $("#deactivate").hide();
    $("#deactivateStaff").click(function(){
        $("#deactivate").show();
    });
});
}
function hideReactivate(){
$(document).ready(function(){
    $("#reactivate").hide();
    $("#reactivateStaff").click(function(){
        $("#reactivate").show();
    });
});
}
function hideDelete(){
$(document).ready(function(){
    $("#delete").hide();
    $("#deleteStaff").click(function(){
        $("#delete").show();
    });
});
}

function hideLock(){
$(document).ready(function(){
    $("#lockLogin").hide();
    $("#lockStaff").click(function(){
        $("#lockLogin").show();
    });
});
}

function hideUnlock(){
$(document).ready(function(){
    $("#unlockLogin").hide();
    $("#unlockStaff").click(function(){
        $("#unlockLogin").show();
    });
});
}
/**
 * Handles the logout modal popup message on home page
 */
function popupMessageModal(){
    var msg = $('#message-text').text();
    if(msg!=""){
        $('#modal-messages-popup').modal().fadeout(8000,function (){
            $(this).empty().remove();
        });
        
    }
}
function hideResetLogin(){
    
    $(document).ready(function(){
    $("#resetLogin").hide();
    $("#resetPassword").click(function(){
        $("#resetLogin").show();
    });
});

}

function hideUpdatePatient(){
    
    $(document).ready(function(){
    $("#patientUpdate").hide();
    $("#updatePatientAccount").click(function(){
        $("#patientUpdate").show();
    });
});

}

function hideDeactivatePatient(){
    
    $(document).ready(function(){
    $("#patientDeactivate").hide();
    $("#deactivatePatientAccount").click(function(){
        $("#patientDeactivate").show();
    });
});

}

function hideReactivatePatient(){
    
    $(document).ready(function(){
    $("#patientReactivate").hide();
    $("#reactivatePatientAccount").click(function(){
        $("#patientReactivate").show();
    });
});

}

function hideDeletePatient(){
    
    $(document).ready(function(){
    $("#patientDelete").hide();
    $("#deletePatientAccount").click(function(){
        $("#patientDelete").show();
    });
});

}
