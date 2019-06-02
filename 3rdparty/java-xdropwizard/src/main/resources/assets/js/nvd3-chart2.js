var app = angular.module('plunker', ['nvd3']);

app.controller('MainCtrl', function($scope, $http) {
  $scope.options = {
            chart: {
                type: 'lineChart',
                height: 450,
                margin : {
                    top: 20,
                    right: 20,
                    bottom: 40,
                    left: 55
                },
                x: function(d){ return d.x; },
                y: function(d){ return d.y; },
                xAxis: {
                    axisLabel: 'X'
                },
                yAxis: {
                    axisLabel: 'Y',
                    tickFormat: function(d){
                        return d3.format('.02f')(d);
                    },
                    axisLabelDistance: 30
                },
                callback: function(chart){
                    console.log("!!! lineChart callback !!!");
                }
            },
            title: {
                enable: true,
                text: 'X vs. Y'
            }
        };
  
  
//////////////////////////////////////////////////////////////////////
  
	// Chart Data //////////////////////////////////////////////////////////////
	
	
  	$scope.initChartData = function() {
		
		$http.get('/service/nvd3data/chartdata').success(function(data) {
			
//			console.log(data);
			
			$scope.appChartData = [
			                       convertToChartFormat(data.xAxisData, data.a, 'A'),
			                       convertToChartFormat(data.xAxisData, data.b, 'B'),
			                       convertToChartFormat(data.xAxisData, data.c, 'C'),
			                       convertToChartFormat(data.xAxisData, data.d, 'D')
			                       ];

//			console.log($scope.appChartData);
		});

	};

//////////////////////////////////////////////////////////////////////


});


function convertToChartFormat(xData, yData, seriesName){
	
	var returnValue;
	
	var convertedChartArray = [];
	var i;
	for (i = 0; i < xData.length; i++) {
		convertedChartArray.push( {x: xData[i], y: yData[i]});

	}
	returnValue = {
        key: seriesName,
        values: convertedChartArray
    }
	return returnValue;
};