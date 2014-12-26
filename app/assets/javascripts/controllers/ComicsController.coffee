controllers = angular.module('controllers')
controllers.controller("ComicsController", [ '$scope', '$routeParams', '$location', '$resource',
  ($scope,$routeParams,$location,$resource)->
    $scope.next = (comic_id) ->
      Comic = $resource('/comics/:comicId', { comicId: "@id", format: 'json' })
      Comic.get({comicId:parseInt(comic_id) + 1}, (results)-> $scope.comic = results)

    $scope.prev = (comic_id) ->
      Comic = $resource('/comics/:comicId', { comicId: "@id", format: 'json' })
      Comic.get({comicId:parseInt(comic_id) - 1}, (results)-> $scope.comic = results)

    $scope.random = () ->
      Comic = $resource('/comics/random', {format: 'json'})
      Comic.get({}, (results)-> $scope.comic = results)

    Comic = $resource('/comics/', {format: 'json'})
    Comic.get({}, (results)-> $scope.comic = results)

#    $scope.search = (keywords)->  $location.path("/").search('keywords',keywords)
#    Comic = $resource('/comics/:comicId', { comicId: "@id", format: 'json' })
#
#    if $routeParams.keywords
#      Comic.query(keywords: $routeParams.keywords, (results)-> $scope.comics = results)
#    else
#      $scope.comics = []
])