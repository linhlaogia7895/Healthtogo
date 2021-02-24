/**
 * Document   : common-to-all-script.js
 * Version    : Jan 3, 2017
 * Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
 * Description: Javascript for all html pages
 */

window.onload = initProcess2;

var previousLogoWidth;
var newPageWidth;
var newNavWidth;
var canSee;

/**
 * Function to initiate the entire JS for main page
 */
function initProcess2(){
    previousLogoWidth = $('#logo').width();
    registerListenersCommon();
}

/**
 * Function to initiate the listeners for main page
 */
function registerListenersCommon(){
    
    $(window).on({
        resize: 
            function(){
                navbarToggleUpdateElements2();
        }
    });
    
    modalLoginPopup();
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
 * Function that responds to window RESIZE event listener
 */
function navbarToggleUpdateElements2(){
    adjustLogo();
    adjustNavbar();
    adjustFooterFont();
    
    /*for testing*/
    getDynamicWightHeight();
}

/**
 *  makes sure the navbar will have padding on each side by making its
 *  width less by 10 points from page width
 */
function adjustNavbar(){
    
    newPageWidth = $('.page').width();
    $('.navbar').width(newPageWidth - 10);
}

/**
 * Function to adjust logo on page resize
 */
function adjustLogo(){
    //Checks if the main navbar is visible
        canSee = $("#myNavbar").is(":visible");
        if(canSee != true){
                                                
            //sets the new logo width
            $('#logo').width($('.page').width() / 2);
            
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
            
            //sets logo width to original width
            $('#logo').width(previousLogoWidth);
        }
}

/*adjusts the footer font*/
function adjustFooterFont(){
    var size = $('.main-img').width();
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
