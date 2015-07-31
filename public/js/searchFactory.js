githubUserSearch.factory('Search', ['$http', function($http) {
  var queryUrl = 'http://localhost:9292/githubsearch';
  return {
    query: function(searchTerm) {
      return $http({
        url: queryUrl,
        method: 'GET',
        params: {
          'search_term': searchTerm
        }
      }); 
    }
  }
}]);