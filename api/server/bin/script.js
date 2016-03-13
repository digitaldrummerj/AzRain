var loopback = require('loopback');
var ds = loopback.createDataSource('mssql', {
    "host": "192.168.11.29",
    "database": "RescuingAnimalsInNeed",
    "password": "2320",
    "name": "mssql",
    "user": "Wayne",
    "connector": "mssql"
});

ds.discoverPrimaryKeys('groupsetup', function(err, models) {
    console.log('keys', models);
});

ds.discoverForeignKeys('groupsetup', function(err, models) {
    console.log('foreign', models);
});

ds.discoverExportedForeignKeys('groupsetup', function(err, models) {
    console.log('exported', models);
});

ds.discoverSchema('groupsetup', {owner: 'dbo'}, function (err, models) {
    console.log('schema', models);
});

//return;
// // Discover and build models from INVENTORY table
// ds.discoverAndBuildModels('groupsetup', {visited: {}, associations: true},
//     function(err, models) {
//         console.log(models);
//   // Now we have a list of models keyed by the model name
//   // Find the first record from the inventory
//         console.log(models.Groupsetup);
//   models.Groupsetup.findOne({}, function (err, inv) {
//     if(err) {
//       console.error(err);
//       return;
//     }
//     console.log("\nGroup SEtup: ", inv);
//     // Navigate to the product model
//     inv.Groupemergencynumbers(function (err, prod) {
//       console.log("\Group Emergency Numbers: ", prod);
//       console.log("\n ------------- ");
//     });
//   });
// });