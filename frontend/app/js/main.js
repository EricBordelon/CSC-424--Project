/**
* Code by Eric Bordelon. Maybe.
 */

/**
 * Main AngularJS Web Application
 */
var app = angular.module('tutorialWebApp', [
  'ngRoute'
]);

/**
 * Configure the Routes
 */
app.config(['$routeProvider', function ($routeProvider) {
  $routeProvider
    // Home
    .when("/", {templateUrl: "partials/home.html", controller: "PageCtrl"})
    // Pages
    .when("/about", {templateUrl: "partials/about.html", controller: "PageCtrl"})
    .when("/faq", {templateUrl: "partials/faq.html", controller: "PageCtrl"})
	.when("/signIn", {templateUrl: "partials/signIn.html", controller: "PageCtrl"})
    .when("/signUp", {templateUrl: "partials/signUp.html", controller: "PageCtrl"})
	.when("/add", {templateUrl: "partials/add.html", controller: "PageCtrl"})
	.when("/addChem", {templateUrl: "partials/addChem.html", controller: "PageCtrl"})
	.when("/addCit", {templateUrl: "partials/addCit.html", controller: "PageCtrl"})
	.when("/addTox", {templateUrl: "partials/addTox.html", controller: "PageCtrl"})
	.when("/addExp", {templateUrl: "partials/addExp.html", controller: "PageCtrl"})
	.when("/addTarg", {templateUrl: "partials/addTarg.html", controller: "PageCtrl"})
	//Also get rid of add.html sooner or later
	.when("/search", {templateUrl: "partials/search.html", controller: "PageCtrl"})
    // else 404
    .otherwise("/404", {templateUrl: "partials/404.html", controller: "PageCtrl"});
}]);

/**
 * Controls all other Pages
 */
app.controller('PageCtrl', function (/* $scope, $location, $http */) {
  console.log("Page Controller reporting for duty.");

});

/**
* Object creator functions
*/
function  chemical(){}

function  assay(){}

function  target(){}
function target_id(){}

function  toxicity(){}

function  citation(){}
function citation_id(){}
