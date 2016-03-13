(function () {
    'use strict';
    angular.module('app')
        .controller('groupIntakeController', groupIntakeController);

    groupIntakeController.$inject = ['groupIntakeService', '$mdDialog', 'statecityzipService']
    function groupIntakeController(groupIntakeService, $mdDialog, statecityzipService) {
        var self = this;

        self.selected = null;
        self.groups = [];
        self.selectedIndex = 0;
        self.filterText = null;
        self.selectGroup = selectgroup;
        self.deleteGroup = deletegroup;
        self.saveGroup = savegroup;
        self.cancelEdit = cancelEdit;
        self.filtergroup = filtergroup;
        self.newGroup = newGroup;
        self.stateCityZip = [];
        // Load initial data
        getAllgroups();
        //getCityStateZipCodes();
        self.master = {};
        //----------------------
        // Internal functions 
        //----------------------

        function newGroup(){
            self.selected = {};
            self.selectedIndex = null;
        }
        function selectgroup(group, index) {
            self.master = angular.copy(group); 
            self.selected = angular.isNumber(group) ? self.groups[index] : group;
            self.selectedIndex = angular.isNumber(group) ? group: index;
        }
        
        function cancelEdit(){
            console.log('cancelEdit')
            self.selected = self.master;
            self.groups[self.selectedIndex] = self.master;

        }

        function deletegroup($event) {
            var confirm = $mdDialog.confirm()
                                   .title('Are you sure?')
                                   .content('Are you sure want to delete this group?')
                                   .ok('Yes')
                                   .cancel('No')
                                   .targetEvent($event);
            
            
            $mdDialog.show(confirm).then(function () {
                groupIntakeService.deleteGroup(self.selected).then(function (affectedRows) {
                    self.groups.splice(self.groups.indexOf(self.selected), 1);
                    self.selectedIndex = 0;
                    self.selected = {};
                });
            }, function () { });
        }
        
        function savegroup($event) {
            console.log('saveGroup', self.selected);
            if (self.selected != null && self.selected.groupid != null) {
                groupIntakeService.updateGroup(self.selected).then(function (affectedRows) {
                    $mdDialog.show(
                        $mdDialog
                            .alert()
                            .clickOutsideToClose(true)
                            .title('Success')
                            .content('Data Updated Successfully!')
                            .ok('Ok')
                            .targetEvent($event)
                    );
                });
            }
            else {
                groupIntakeService.createGroup(self.selected).then(function (affectedRows) {
                    console.log('affectedRows', affectedRows);
                    self.groups = self.groups.concat(affectedRows);

                    $mdDialog.show(
                        $mdDialog
                            .alert()
                            .clickOutsideToClose(true)
                            .title('Success')
                            .content('Data Added Successfully!')
                            .ok('Ok')
                            .targetEvent($event)
                    );
                });
            }
        }
        
        
        function getAllgroups() {
            groupIntakeService.getGroups().then(function (groups) {
                console.log('groups', groups);
                self.groups = [].concat(groups);
                self.selected = groups[0];
            });
        }
        
        function getCityStateZipCodes(){
            statecityzipService.getStateCityZip().then(function(result){
                self.stateCityZip = [].concat(result);
            });
        }

        function filtergroup() {
            console.log('filtergroup');
            if (self.filterText == null || self.filterText == "") {
                getAllgroups();
            }
            else {
                groupIntakeService.getGroupByName(self.filterText).then(function (groups) {
                    self.groups = [].concat(groups);
                    self.selected = groups[0];
                });
            }
        }
    }

})();