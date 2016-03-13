(function() {
    'use strict';
    angular.module('app')
        .controller('groupIntakeController', groupIntakeController);

    groupIntakeController.$inject = ['groupIntakeService', '$mdDialog', 'statecityzipService']
    function groupIntakeController(groupIntakeService, $mdDialog, statecityzipService) {
        var self = this;
        self.selectGroup = selectgroup;
        self.deleteGroup = deletegroup;
        self.saveGroup = savegroup;
        self.cancelEdit = cancelEdit;
        self.filtergroup = filtergroup;
        self.newGroup = newGroup;

        self.init = false;
        if (self.init === false) {
            activate();
        }

        function activate() {
            self.selected = null;
            self.groups = [];
            self.selectedIndex = 0;
            self.filterText = null;
            self.stateCityZip = [];
            self.master = {};
            // Load initial data
            getAllgroups();
            //getCityStateZipCodes();
            self.init = true;
        }

        //----------------------
        // Internal functions 
        //----------------------

        function newGroup(form, $event) {
            console.log('newGroup');
            if (form.$dirty && !form.$pristine) {
                var confirm = $mdDialog.confirm()
                    .title('WARNING: Unsaved Changes')
                    .content('You have unsaved changes.  Are you sure you want to lose them?')
                    .ok('Yes')
                    .cancel('No')
                    .targetEvent($event);

                $mdDialog.show(confirm).then(function() {
                    var original = angular.copy(self.master);
                    self.groups[self.selectedIndex] = original;
                      
                    self.selected = {};
                    self.selectedIndex = null;
                    self.master = {};
                    form.$setPristine();
                });
            } else {
                self.selected = {};
                self.selectedIndex = null;
                self.master = {};
                
            }
        }

        function selectgroup(group, index, form, $event) {

            console.log('selectGroup');
            if (form.$dirty && !form.$pristine) {
                var confirm = $mdDialog.confirm()
                    .title('WARNING: Unsaved Changes')
                    .content('You have unsaved changes.  Are you sure you want to lose them?')
                    .ok('Yes')
                    .cancel('No')
                    .targetEvent($event);

                $mdDialog.show(confirm).then(function() {
                    var original = angular.copy(self.master);
                    self.groups[self.selectedIndex] = original;

                    self.master = angular.copy(group);
                    self.selected = group;
                    self.selectedIndex = index;
                    form.$setPristine();
                });
            } else {
                self.master = angular.copy(group);
                self.selected = group;
                self.selectedIndex = index;
            }
        }

        function cancelEdit($event, form) {
            console.log('cancelEdit')
            var confirm = $mdDialog.confirm()
                .title('Are you sure?')
                .content('Are you sure want to cancel this edit?')
                .ok('Yes')
                .cancel('No')
                .targetEvent($event);

            $mdDialog.show(confirm).then(function() {
                var original = angular.copy(self.master);
                self.selected = original;
                self.groups[self.selectedIndex] = original;
                form.$setPristine();

            }, function() { });
        }

        function deletegroup($event) {
            console.log('deletegroup');
            var confirm = $mdDialog.confirm()
                .title('Are you sure?')
                .content('Are you sure want to delete this group?')
                .ok('Yes')
                .cancel('No')
                .targetEvent($event);


            $mdDialog.show(confirm).then(function() {
                groupIntakeService.deleteGroup(self.selected).then(function(affectedRows) {
                    self.groups.splice(self.groups.indexOf(self.selected), 1);
                    self.selectedIndex = 0;
                    self.selected = {};
                });
            }, function() { });
        }

        function savegroup($event) {
            console.log('saveGroup', self.selected);
            if (self.selected != null && self.selected.groupid != null) {
                console.log('saveGroup Updatings');
                groupIntakeService.updateGroup(self.selected).then(function(affectedRows) {
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
                console.log('getAllGroups newGroup');
                groupIntakeService.createGroup(self.selected).then(function(affectedRows) {
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
            console.log('getAllGroups');
            groupIntakeService.getGroups().then(function(groups) {
                console.log('groups', groups);
                self.groups = [].concat(groups);
                self.selected = groups[0];
                self.master = angular.copy(self.selected);
            });
        }

        function getCityStateZipCodes() {
            statecityzipService.getStateCityZip().then(function(result) {
                self.stateCityZip = [].concat(result);
            });
        }

        function filtergroup() {
            console.log('filtergroup');
            if (self.filterText == null || self.filterText == "") {
                getAllgroups();
            }
            else {
                groupIntakeService.getGroupByName(self.filterText).then(function(groups) {
                    self.groups = [].concat(groups);
                    self.selected = groups[0];
                    self.master = angular.copy(self.selected);
                });
            }
        }
    }

})();