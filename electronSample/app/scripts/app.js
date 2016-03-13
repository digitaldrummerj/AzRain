
(function () {
    'use strict';
    
    var _templateBase = './scripts';
    
    angular.module('app', [
        'ngRoute',
        'ngMaterial',
        'ngAnimate'
    ])
    .config(['$routeProvider', function ($routeProvider) {
            $routeProvider.when('/', {
                templateUrl: _templateBase + '/customer/customer.html' ,
                controller: 'customerController',
                controllerAs: '_ctrl'
            });
              $routeProvider.when('/groupintake', {
                templateUrl: _templateBase + '/groupIntake/groupIntake.html' ,
                controller: 'groupIntakeController',
                controllerAs: '_ctrl'
            });
            $routeProvider.otherwise({ redirectTo: '/' });
        }
    ])
    .constant('serverinfo', {
        port: "3000",
        server: "localhost"
    });

})();