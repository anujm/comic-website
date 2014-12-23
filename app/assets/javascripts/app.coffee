comic_website = angular.module('comic_website',[
  'templates',
  'ngRoute',
  'ngResource',
  'controllers',
])

comic_website.config([ '$routeProvider',
  ($routeProvider)->
    $routeProvider
    .when('/',
      templateUrl: "show.html"
      controller: 'ComicsController'
    )
])

controllers = angular.module('controllers', [])
