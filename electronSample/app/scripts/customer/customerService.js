(function () {
    'use strict';
       
    angular.module('app')
        .service('customerService', CustomerService);
    
   CustomerService.$inject = ['$q', '$http'];

    function CustomerService($q, $http) {
        
      
        return {
        
        };        
    }
})();