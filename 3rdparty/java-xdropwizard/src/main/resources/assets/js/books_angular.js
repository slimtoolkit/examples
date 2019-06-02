angular.module('sampleApp', [])
  .controller('sampleAppController', ['$scope', '$http', function($scope, $http) {

    $scope.books = [];

    $http.get('/service/book/all').success(function(data) {
      console.log("returned data: "+data);
      $scope.books = data;
    }).
    error(function(data, status, headers, config) {
      console.log(data);
    });

  }]);
