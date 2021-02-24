/**
 * Document   : password-validation.js
 * Version    : Jan 14, 2017
 * Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
 * Description: Javascript for validating the password and confirm password
 */

(function() {

    /* declaring the angular module mainApp. ngMEssages manages the state of internal messages 
     * within its container element */
    var app = angular.module("mainApp", ["ngMessages"]);

    /* angular directive for the password input */
    var checkPassword = function($timeout){
        return {
            restrict: 'AE',
            scope: {
                checkPasswordVar: "="
            },
            require: 'ngModel',
            link: function (scope, element, attributes, ngModel){
                
                /*$timeout option to prevent validator from running on system load, as it only gets a null value*/
                $timeout(function(){
                    
                    /* $validators returns a boolean = whether the argument/element is valid or not */
                    ngModel.$validators.checkPassword = function (modelValue){
                        var len = modelValue.length;
                        var num = modelValue.replace(/\D/g,'').length;
                        var uppercaseLetters = modelValue.replace(/[^A-Z]/g, '').length;
                        var lowercaseLetters = modelValue.replace(/[^a-z]/g, '').length;
                        var specialChars = modelValue.replace(/[^!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/g, '').length;

                        return len >= 8 && num >= 1 && uppercaseLetters >=1 && lowercaseLetters >= 1 && specialChars >= 1;
                    };
                });
                
                /* telling angular to keep watch of the variable for changes */
                scope.$watch("checkPasswordVar", function() {
                    ngModel.$validate();
                });
            }
        };
    };


    /* angular directive for the confirm password input */
    var compareTo = function() {
        return    {
            require: "ngModel",
            scope:  {
                otherModelValue: "=compareTo"
                    },
            link: function(scope, element, attributes, ngModel) {
                
                /* $validators returns a boolean = whether the argument/element is valid or not */
                ngModel.$validators.compareTo = function(modelValue) {
                    return modelValue === scope.otherModelValue;
                };

                /* telling angular to keep watch of the variable for changes */
                scope.$watch("otherModelValue", function() {
                  ngModel.$validate();
                });
            }
        };
    };

    app.directive("compareTo", compareTo);
    app.directive("checkPassword",checkPassword);

}());


