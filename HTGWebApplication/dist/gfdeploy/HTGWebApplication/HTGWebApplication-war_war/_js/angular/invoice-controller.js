/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
(function(){
    var app=angular.module('invoiceApp',['ngSanitize']);

    
    app.controller('invoiceController', function ($scope,$http){
        //$scope.patientId = '';
        //$scope.checkPay=true;
	$http({
		method : "POST",
		url : "InvoiceJSON"
	    }).then(function mySucces(response) {
		$scope.invoice = response.data;
		}, function myError(response) {
		    $scope.invoice = response.statusText;
		});
	var checkp=$scope.checkPay;
        $scope.$watch('checkPay',function (x){
	    x.status == "incomplete" ? $scope.checkPay=false: $scope.checkPay=true;
	});
//        $scope.details=function(x){
//            $("#plan-detail-popup").modal();
//            x.activityCompleted == "Not Complete" ? $("#activityProgress").show() : $("#activityProgress").hide();
//            $http({
//		method : "POST",
//		url : "DietPlanJSON",
//                data : { dietPlanId : x.DIET_PLAN_NUMBER }
//	    }).then(function mySucces(response) {
//		$scope.diet = response.data;
//		}, function myError(response) {
//		    $scope.diet = response.statusText;
//            });
//            $http({
//		method : "POST",
//		url : "RecordJSON",
//                data : { recordId : x.RECORD_NUMBER }
//	    }).then(function mySucces(response) {
//		$scope.record = response.data;
//		}, function myError(response) {
//		    $scope.record = response.statusText;
//            });
//	};
    });
}());