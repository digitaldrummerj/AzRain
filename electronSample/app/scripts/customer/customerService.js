(function () {
    'use strict';
    var mysql = require('mysql');
    
    // Creates MySql database connection
    var connection = mysql.createConnection({
        host: "localhost",
        user: "root",
        password: "password",
        database: "customer_manager"
    });
    
    angular.module('app')
        .service('customerService', ['$q', '$http', CustomerService]);
    
   
    function CustomerService($q, $http) {
        var defaultPort = "3000";
        var defaultServer = "192.168.11.29";
      
        return {
            getCustomers: getCustomers,
            getById: getCustomerById,
            getByName: getCustomerByName,
            create: createCustomer,
            destroy: deleteCustomer,
            update: updateCustomer
        };

        function getCustomers() {
            /*var deferred = $q.defer();
            var query = "SELECT * FROM customers";
            connection.query(query, function (err, rows) {
                if (err) deferred.reject(err);
                deferred.resolve(rows);
            });
            return deferred.promise;
            */
            
            var query = 'Groupsetups';
            var port = defaultPort;
            var server = defaultServer;
  
            var url = 'http://'+server+':'+port+'/api/'+query;
            return $http.get(url).then(function(result){
                return result.data;
            });
        }
        
        function getCustomerById(id) {
            var deferred = $q.defer();
            var query = "SELECT * FROM customers WHERE customer_id = ?";
            connection.query(query, [id], function (err, rows) {
                if (err) deferred.reject(err);
                deferred.resolve(rows);
            });
            return deferred.promise;
        }
        
        function getCustomerByName(name) {
            var deferred = $q.defer();
            var query = "SELECT * FROM customers WHERE name LIKE  '" + name + "%'";
            connection.query(query, [name], function (err, rows) {
                console.log(err)
                if (err) deferred.reject(err);
                
                deferred.resolve(rows);
            });
            return deferred.promise;
        }
        
        function createCustomer(customer) {
            var deferred = $q.defer();
            var query = "INSERT INTO customers SET ?";
            connection.query(query, customer, function (err, res) {
                console.log(err)
                if (err) deferred.reject(err);
                console.log(res)
                deferred.resolve(res.insertId);
            });
            return deferred.promise;
        }
        
        function deleteCustomer(id) {
            var deferred = $q.defer();
            var query = "DELETE FROM customers WHERE customer_id = ?";
            connection.query(query, [id], function (err, res) {
                if (err) deferred.reject(err);
                console.log(res);
                deferred.resolve(res.affectedRows);
            });
            return deferred.promise;
        }
        
        function updateCustomer(customer) {
            var deferred = $q.defer();
            var query = "UPDATE customers SET name = ? WHERE customer_id = ?";
            connection.query(query, [customer.name, customer.customer_id], function (err, res) {
                if (err) deferred.reject(err);
                deferred.resolve(res);
            });
            return deferred.promise;
        }
    }
})();