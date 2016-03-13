(function() {
    'use strict';
    angular.module('app')
        .service('statecityzipService', statecityzipService);

    statecityzipService.$inject = ['$http', 'serverinfo'];

    function statecityzipService($http, serverinfo) {
        var object = 'Statecityzips';

        return {
            getStateCityZip: getStateCityZip,
            filterByZip: filterByZip
        };


        /*            getByName: getCustomerByName,
                    create: createCustomer,
                    destroy: deleteCustomer,
                    update: updateCustomer
        */

        //Filter EX: {"limit":20, "where":{"zipcode": "99551"}}
        //Filter Ex: {"limit":20, "where":{"zipcode": {"like": "995%"}}}

        function getApiUrl() {
            return 'http://' + serverinfo.server + ':' + serverinfo.port + '/api/' + object;
        }

        function getStateCityZip() {
            var filter = {"limit": 20};
            return $http.get(getApiUrl() + "?filter=" + encodeURI(JSON.stringify(filter))).then(function(result) {
                return result.data;
            });
        }

        function filterByZip(zipcode) {
            var zipcode = "%" + zipcode + "%";
            var filter = { "limit": 20, "where": { "zipcode": { like: zipcode } } };
            console.log('filter zipcode', filter, encodeURI(JSON.stringify(filter)));
            //http://localhost:3000/api/Groupsetups?filter=[object%20Object]
            
            return $http.get(getApiUrl() + "?filter=" + encodeURI(JSON.stringify(filter))).then(function(result) {
                console.log('filter response', result);
                return result.data;
            });
        }


    }
})();