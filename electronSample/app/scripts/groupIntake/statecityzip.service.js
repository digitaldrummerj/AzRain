(function () {
    'use strict';
    angular.module('app')
        .service('statecityzipService', statecityzipService);
    
    statecityzipService.$inject = ['$http', 'serverinfo'];
   
    function statecityzipService($http, serverinfo) {
        var object = 'Statecityzips';

        return {
            getStateCityZip: getStateCityZip
        };

/*            getByName: getCustomerByName,
            create: createCustomer,
            destroy: deleteCustomer,
            update: updateCustomer
*/

        function getApiUrl(){
            return 'http://' + serverinfo.server + ':' + serverinfo.port + '/api/' + object;
        }

        function getStateCityZip() {            
            return $http.get(getApiUrl()).then(function(result){
                return result.data;
            });
        }
        

    }
})();