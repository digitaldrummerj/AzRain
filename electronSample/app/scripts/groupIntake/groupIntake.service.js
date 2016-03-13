(function () {
    'use strict';
    angular.module('app')
        .service('groupIntakeService', groupIntakeService);
    
    groupIntakeService.$inject = ['$http', 'serverinfo'];
   
    function groupIntakeService($http, serverinfo) {
        var object = 'Groupsetups';

        return {
            getGroups: getGroups,
            getGroupById: getGroupById,
            createGroup: createGroup,
            deleteGroup: deleteGroup,
            updateGroup: updateGroup,
            getGroupByName: getGroupByName
        };

        function getApiUrl(){
            return 'http://' + serverinfo.server + ':' + serverinfo.port + '/api/' + object;
        }

        function getGroups() {            
            return $http.get(getApiUrl()).then(function(result){
                return result.data;
            });
        }
        
        function getGroupById(id) {
         return $http.get(getApiUrl() + '/' + id).then(function(result){
                return result.data;
            });   
        }
        
        function getGroupByName(filterText) {
            console.log('filter group', JSON.stringify(filterText));
            var filter = 
            {"filter": {"where": {"groupname": {"like": "%"+ filterText +"%"}}}}
            http://localhost:3000/api/Groupsetups?filter=[object%20Object]
            return $http.get(getApiUrl(), filter).then(function(result){
                console.log('filter response', result);
                return result.data;
            });
        }
        
        function createGroup(newGroup) {

            console.log('createGroup service', newGroup);

            return $http.post(getApiUrl(), newGroup).then(function(response){
                console.log('createGroup', response);
                return response.data;
            })
        }

        function deleteGroup(group){
            return $http.delete(getApiUrl() + "/" + group.groupid).then(function(result){
                console.log('delete result', result);
                return result;
            })
        }

        function updateGroup(group) {
            return $http.put(getApiUrl() + "/" + group.groupid, group).then(function(result){
                return result;
            })
            
        }        
    }
})();