/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/*
    Document   : appointment-patient-controller.js
    Version    : April 3, 2017
    Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
    Description: angularJS for patient appointment booking JSP
*/

(function(){
    var app=angular.module("mainApp",[]);
    
    app.controller("appointment-controller",function ($scope,$http) {
	
	$scope.ngList1314=[];
	
	$scope.btnTime0809=function (date) {
	    $scope.START_TIME="08:00 AM";
	    $scope.END_TIME="09:00 AM";
	    $scope.BOOKING_DATE=date;
	    $scope.APPOINTMENT_ID=$scope.appointment0809;
	};
	
	$scope.btnTime1011=function (date) {
	    $scope.START_TIME="10:00 AM";
	    $scope.END_TIME="11:00 AM";
	    $scope.BOOKING_DATE=date;
	    $scope.APPOINTMENT_ID=$scope.appointment1011;
	};
	
	$scope.btnTime1314=function (date) {
	    $scope.START_TIME="01:00 PM";
	    $scope.END_TIME="02:00 PM";
	    $scope.BOOKING_DATE=date;
	    $scope.APPOINTMENT_ID=$scope.appointment1314;
	};
	
	$scope.btnTime1516=function (date) {
	    $scope.START_TIME="03:00 PM";
	    $scope.END_TIME="04:00 PM";
	    $scope.BOOKING_DATE=date;
	    $scope.APPOINTMENT_ID=$scope.appointment1516;
	};
	
	$scope.btnTime1716=function (date) {
	    $scope.START_TIME="05:00 PM";
	    $scope.END_TIME="06:00 PM";
	    $scope.BOOKING_DATE=date;
	    $scope.APPOINTMENT_ID=$scope.appointment1718;
	};
	
	$scope.btnTime1920=function (date) {
	    $scope.START_TIME="07:00 PM";
	    $scope.END_TIME="08:00 PM";
	    $scope.BOOKING_DATE=date;
	    $scope.APPOINTMENT_ID=$scope.appointment1920;
	};
	
	$scope.$watch("EXTENSION",function () {$scope.adjustEndTime();});
	
	var ext=$scope.EXTENSION; 
	$scope.adjustEndTime=function () {
	    if(ext==="30 minutes"){
		$scope.END_TIME==="08:00 PM" ? 
		$scope.END_TIME="08:30 PM":

		$scope.END_TIME==="06:00 PM" ?
		$scope.END_TIME="06:30 PM":

		$scope.END_TIME==="04:00 PM" ?
		$scope.END_TIME="04:30 PM":

		$scope.END_TIME==="01:00 PM" ?
		$scope.END_TIME="01:30 PM":

		$scope.END_TIME==="11:00 AM" ?
		$scope.END_TIME="11:30 AM":

		$scope.END_TIME="09:30 AM";
	    }else if(ext==="1 hour"){
		$scope.END_TIME==="08:00 PM" ? 
		$scope.END_TIME="08:59 PM":

		$scope.END_TIME==="06:00 PM" ?
		$scope.END_TIME="06:59 PM":

		$scope.END_TIME==="04:00 PM" ?
		$scope.END_TIME="04:59 PM":

		$scope.END_TIME==="01:00 PM" ?
		$scope.END_TIME="01:59 PM":

		$scope.END_TIME==="11:00 AM" ?
		$scope.END_TIME="11:59 AM":

		$scope.END_TIME="09:59 AM";
	    }else{
		$scope.END_TIME==="08:00 PM" ? 
		$scope.END_TIME="08:00 PM":

		$scope.END_TIME==="06:00 PM" ?
		$scope.END_TIME="06:00 PM":

		$scope.END_TIME==="04:00 PM" ?
		$scope.END_TIME="04:00 PM":

		$scope.END_TIME==="01:00 PM" ?
		$scope.END_TIME="01:00 PM":

		$scope.END_TIME==="11:00 AM" ?
		$scope.END_TIME="11:00 AM":

		$scope.END_TIME="09:00 AM";
	    };
	};
	
	
	
//	if(ext==="30 minutes"){
//	    $scope.adjustEndTime=function () {
//	    $scope.END_TIME==="08:00 PM" ? 
//	    $scope.END_TIME="08:30 PM":
//
//	    $scope.END_TIME==="06:00 PM" ?
//	    $scope.END_TIME="06:30 PM":
//
//	    $scope.END_TIME==="04:00 PM" ?
//	    $scope.END_TIME="04:30 PM":
//
//	    $scope.END_TIME==="01:00 PM" ?
//	    $scope.END_TIME="01:30 PM":
//
//	    $scope.END_TIME==="11:00 AM" ?
//	    $scope.END_TIME="11:30 AM":
//
//	    $scope.END_TIME="09:30 AM";
//	    };
//	}else if(ext==="1 hour"){
//	    $scope.END_TIME==="08:00 PM" ? 
//	    $scope.END_TIME="08:59 PM":
//
//	    $scope.END_TIME==="06:00 PM" ?
//	    $scope.END_TIME="06:59 PM":
//
//	    $scope.END_TIME==="04:00 PM" ?
//	    $scope.END_TIME="04:59 PM":
//
//	    $scope.END_TIME==="01:00 PM" ?
//	    $scope.END_TIME="01:59 PM":
//
//	    $scope.END_TIME==="11:00 AM" ?
//	    $scope.END_TIME="11:59 AM":
//
//	    $scope.END_TIME="09:59 AM";
//	}else{
//	    $scope.END_TIME==="08:00 PM" ? 
//	    $scope.END_TIME="08:00 PM":
//
//	    $scope.END_TIME==="06:00 PM" ?
//	    $scope.END_TIME="06:00 PM":
//
//	    $scope.END_TIME==="04:00 PM" ?
//	    $scope.END_TIME="04:00 PM":
//
//	    $scope.END_TIME==="01:00 PM" ?
//	    $scope.END_TIME="01:00 PM":
//
//	    $scope.END_TIME==="11:00 AM" ?
//	    $scope.END_TIME="11:00 AM":
//
//	    $scope.END_TIME="09:00 AM";
//	}
    });
}());