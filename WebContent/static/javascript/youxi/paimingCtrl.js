app.controller("paimingCtrl", function($scope, ppsService, $filter) {
	$scope.ps = ppsService.pss;
	//$scope.ps = $filter('orderBy')($scope.ps);
});