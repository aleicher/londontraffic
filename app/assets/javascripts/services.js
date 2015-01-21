angular.module('trafficApp.services', [])
  .service('DisruptionsSvc', ['$http', '$q',
    function($http, $q) {
      var apiUrl = "/api/v1/disruptions";
      this.getDisruptions = function() {
        var deferred = $q.defer();
        $http({
          method: 'GET',
          url: apiUrl
        }).success(function(data) {
          deferred.resolve(data);
        }).error(function() {
          deferred.reject('There was an error');
        });
        return deferred.promise;
      };
    }
  ]);
