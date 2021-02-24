/**
 * Document   : staff-library-controller.js
 * Version    : Jan 23, 2017
 * Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
 * Description: Angular for managing the library table
 */

(function(){
    var app=angular.module('nutritionistApp',['ngSanitize']);
    var app2=angular.module('manageJournalApp',['ngSanitize']);
    var app3=angular.module('newInvoice',[]);
    app.controller('patientTableController', function ($scope,$http){
        //$scope.sortType = 'food'; //set the default sort type
        //$scope.sortReverse = null; //set the default sort order
        //$scope.searchFood = ''; //Set the default search filter
	//$scope.sortOrder = "";
	
        /*grab list of food items and calories from MYSQL through servlet CalorieJSON*/
	$http({
		method : "POST",
		url : "PatientJSON"
	    }).then(function mySucces(response) {
		$scope.patient = response.data;
		}, function myError(response) {
		    $scope.patient = response.statusText;
		});
	
    });
    app2.controller('patientJournalController', function ($scope,$http){
        var id = getQueryVariable("id");
	var name = getQueryVariable("name");
        /*grab list of food items and calories from MYSQL through servlet CalorieJSON*/
	$http({
		method : "POST",
		url : "PatientJournalJSON",
                data : { patientId : id }
	    }).then(function mySucces(response) {
		$scope.journal = response.data;
		}, function myError(response) {
		    $scope.journal = response.statusText;
            });
        $scope.name=name;
        $scope.details=function(x){
            $("#plan-detail-popup").modal();
            
            $http({
		method : "POST",
		url : "DietPlanJSON",
                data : { dietPlanId : x.DIET_PLAN_NUMBER }
	    }).then(function mySucces(response) {
		$scope.diet = response.data;
		}, function myError(response) {
		    $scope.diet = response.statusText;
            });
            $http({
		method : "POST",
		url : "RecordJSON",
                data : { recordId : x.RECORD_NUMBER }
	    }).then(function mySucces(response) {
		$scope.record = response.data;
		}, function myError(response) {
		    $scope.record = response.statusText;
            });
	};
	
    });
    function getQueryVariable(variable) {
        var query = window.location.search.substring(1);
        var vars = query.split("&");
        for (var i=0;i<vars.length;i++) {
          var pair = vars[i].split("=");
          if (pair[0] == variable) {
            return pair[1];
          }
        } 
        
    }
    app3.controller('createInvoice', function ($scope){
        
         $scope.subTotal=0;
         $scope.taxRate=0;
         $scope.taxAmount=0;
	
    });
}());