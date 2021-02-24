/**
 * Document   : paymentPlan-controller.js
 * Version    : Mar 3, 2017
 * Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
 * Description: Angular for managing the payment plan
 */

(function(){
    var app=angular.module('mainApp',['ngSanitize']);
    
    /*CALORIE TABLE*/
    app.controller('calorieTableController', function ($scope,$http){
        $scope.sortType = 'food'; //set the default sort type
        $scope.sortReverse = null; //set the default sort order
        $scope.searchFood = ''; //Set the default search filter
	$scope.sortOrder="";
	$scope.sortQuery="";

	/*Sets the sort order value for sortOrder*/
	$scope.$watch('sortReverse',function (){
	    $scope.sortOrder = $scope.sortReverse?"Descending":
	    $scope.sortReverse===null?"":"Ascending";
	});
	
	
	$scope.$watch('searchFood',function (){
	    var textboxContent=$scope.searchFood;
	    $scope.sortQuery = $scope.searchFood===""?"":textboxContent;
	});
	
	
        /*grab list of food items and calories from MYSQL through servlet CalorieJSON*/
	$http({
		method : "GET",
		url : "CalorieJSON"
	    }).then(function mySucces(response) {
		$scope.foods = response.data;
		}, function myError(response) {
		    $scope.foods = response.statusText;
		});
    });
    
    /*TIPS TABLE*/
    app.controller('tipsTableController', function($scope){
        $scope.searchTips='';
        
        $scope.manageTipsAccordion = function(id){
          var x = document.getElementById(id);
            if (x.className.indexOf("w3-show") === -1) {
                x.className += " w3-show";
                x.previousElementSibling.className += " w3-red";
            } else { 
                x.className = x.className.replace(" w3-show", "");
                x.previousElementSibling.className = 
                x.previousElementSibling.className.replace(" w3-red", "");
            }  
        };
        
        $scope.tips = [
            {title:'5 Best Nutrition Tips To Start 2017 Right',
                id:'w3-show-tips-one',
                href:'http://www.huffingtonpost.ca/abby-langer/new-year-nutrition-_b_13865056.html',
                hrefText:'link to article',
                content:"<strong> Resolve to drop the extremes and be reasonable.</strong>\n\
                \n\
                <p>Eight per cent of people are successful with their New Years resolutions.</p>\n\
                \n\
                <p>I can guess why: they're too extreme! I see it ALL THE TIME! Client say to me, \n\
                'I'm going to exercise every day!' or, 'I'm never eating cake again!'. BS, people, \n\
                of course you're going to eat cake, and hello...no one exercises every day (at \n\
                least not for the long term!)</p>\n\
                \n\
                <p>It's awesome to want to make changes to your diet and lifestyle -- that's the \n\
                first step to success. But please don't risk failure by piling on the expectations. \n\
                Instead, let's start small.</p>\n\
                \n\n\
                <strong>If you don't know how, learn how to cook.</strong>\n\
                \n\
                <p><i><u>Roast a chicken</u></i> (sounds scary, but it's super easy and it will give you a \n\
                few days' worth of meals)</p>\n\
                \n\
                <p><i><u>Marinate tofu</u></i> (eat more plants! I can't stress that enough!)</p>\n\
                \n\
                <p><i><u>Steam rice</u></i> (guys, follow the instructions on the package...like I did for about four years)</p>\n\
                \n\
                <p><i><u>Cook fish</u></i> (and here, and here) (this is the number one food my clients are afraid to cook)\n\
                \n\
                <p><i><u>Use chickpeas and other beans for protein in a salad</u></i> (hint: chuck them in. Eat.)\n\
                \n\
                <p><i><u>Make a tahini dressing</u></i> (it goes on everything, it's so simple, and it's so so so yummy!)\n\
                \n\
                <p><i><u>Roast vegetables</u></i> (toss with olive oil and salt, put into a 350F oven until tender, turning once. That is all.)</p>\n\
                \n\n\
                <strong>If you're trying to lose weight, don't be fooled.</strong>\n\
                \n\
                <p>Whatever your issue, no diet shake, pill, coffee, or wrap (sigh) is going to end it for you.</p>\n\
                \n\
                <p>Remember what Glinda the Good Witch said to Dorothy? 'You've had the power all along my dear'.</p>\n\
                \n\
                <p>And you do. You might need a bit of guidance and direction from a professional like myself (FYI I do FaceTime \n\
                sessions for those of you who don't live in Toronto), but starting from a place of kindness towards yourself; finding \n\
                reasonable solutions (i.e. not jumping on the bandwagon of every new diet fad that presents itself); and understanding \n\
                that there will be setbacks and challenges can be your best approach to a healthy diet. Don't let someone selling a \n\
                lame fad convince you that you're powerless, because you're not.</p>\n\
                \n\
                <p>This is important: If you're overeating, figure out WHY you're overeating. It's rarely about food: Food is merely \n\
                the symptom. Get support from your family, friends, a professional; try to identify the feelings underneath \n\
                your eating habits. If you have underlying emotions tied to your food choices, then all the diet advice in the \n\
                world may not correct that.</p>\n\
                \n\
                <p>Clean out your closet first, if you know what I mean. It's tough, but afterward, you'll be free.</p>\n\
                \n\n\
                <strong>Lean BACK and don't strive for perfection.</strong>\n\
                \n\
                <p>There's no such thing. The all-around perfect diet is nonexistent, because everyone is different and \n\
                what's 'perfect' for you might not be 'perfect' for anyone else. But what is universal is how bad people feel \n\
                when they feel like failures. And striving for perfection is one great way to set yourself up for that.</p>\n\
                \n\
                <p>Instead of making food about punishment, make it about joy and nourishing your body with health. When you \n\
                dissociate guilt from food, you'll give yourself the opportunity to enjoy eating and move on without making it \n\
                about 'good' and 'bad' food and 'good' and 'bad' YOU. When you let food guilt rule you, you may have more trouble \n\
                losing or maintaining your weight than if you let it go.</p>\n\
                \n\
                <p>Don't give guilt that power. Oh -- and there's no such thing as \"guilt-free\" food. It's food, plain and simple.</p>\n\
                \n\n\
                <strong>Take setbacks in stride.</strong>\n\
                \n\
                <p>Have a busy week or two and let your workouts slide? Get back into it -- you haven't lost your muscle memory.<p>\n\
                \n\
                <p>Feel like you overdid it in the eating department over the holidays? Get yourself eating five and eight servings \n\
                (serving = ½ cup or 1 cup leafy) of vegetables a day to clean that diet up. And get rid of all that holiday chocolate \n\
                and crap you still have in the house.</p>\n\
                \n\
                <p>We all fall off the eating/exercise wagon. One key to success in leading a healthy life is how long you let yourself fall for.</p>\n\
                \n\
                <p>Get back up. Put the past in the past. Move forward.</p>\n\ "},
            
            {title:'5 Tips for Healthy Eating',
                id:'w3-show-tips-two',
                href:'http://www.dietitians.ca/Your-Health/Nutrition-A-Z/Healthy-Eating/imple-healthy-eating-tips-based-on-Canada%E2%80%99s-Food-G.aspx',
                hrefText:'Link to article',
                content:"No content yet"},
            
            {title:'How to Gain Weight Fast and Safely',
                id:'w3-show-tips-three',
                href:'https://authoritynutrition.com/how-to-gain-weight/',
                hrefText:'Link to article',
                content:"No content yet"},
            
            {title:'How to Lose Weight Fast: 3 Simple Steps, Based on Science',
                id:'w3-show-tips-four',
                href:'https://authoritynutrition.com/how-to-lose-weight-as-fast-as-possible/',
                hrefText:'Link to article',
                content:"No content yet"},
            
            {title:'Healthy Eating Tips for Seniors',
                id:'w3-show-tips-five',
                href:'https://www.ncoa.org/economic-security/benefits/food-and-nutrition/senior-nutrition/',
                hrefText:'Link to article',
                content:"No content yet"},
            
            {title:'Build Healthy Kids',
                id:'w3-show-tips-six',
                href:'http://www.buildhealthykids.com/dailynutrition.html',
                hrefText:'Link to article',
                content:"No content yet"}
            
        ];
	
    });
    
    /*FAQ TABLE*/
    app.controller('faqTableController', function($scope){
        $scope.searchTips='';
        
        $scope.manageFaqAccordion = function(id){
          var x = document.getElementById(id);
            if (x.className.indexOf("w3-show") === -1) {
                x.className += " w3-show";
                x.previousElementSibling.className += " w3-red";
            } else { 
                x.className = x.className.replace(" w3-show", "");
                x.previousElementSibling.className = 
                x.previousElementSibling.className.replace(" w3-red", "");
            }  
        };
        
        $scope.faqs = [
            {title:'What is Health To Go Nutrition Care (HTGNC)?',
                id:'w3-show-faq-one',
                content:"No content yet"},
            
            {title:'How long has the Health To Go Nutrition Care been in operation?',
                id:'w3-show-faq-one',
                content:"No content yet"}
        ];
    });
}());


