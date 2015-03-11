app.controller("eventCtrl", function($scope, ArtsService, $filter) {
	var d = new Date();
	var dateToday1 = d.getTime();
    var curr_date = d.getDate();
    var curr_month = d.getMonth()+1;
    var curr_year = d.getFullYear();
    $scope.dateToday = Date.parse(curr_year + "/" + curr_month + "/" + curr_date);
    var dateToday = new Date($scope.dateToday);
	$scope.masterarts = ArtsService.masartis;
	var jl = ArtsService.jl;
	var date = new Date(), y = date.getFullYear(), m = date.getMonth();
	var firstDay = new Date(y, m, 1);
	var lastDay = new Date(y, m + 1, 0);
	$scope.today = function() {
		var today = Date.parse(curr_year + "/" + curr_month + "/" + curr_date +" 00:00:00");
		var arts = $scope.masterarts;
		var i;
		var newArts = [];
		
		for(i = 0; i < arts.length; i++){
			
			var eventTime = new Date(Date.parse(jsDate(arts[i].eventDate)));
			var cudate = eventTime.getDate();
		    var cumonth = eventTime.getMonth()+1;
		    var cuyear = eventTime.getFullYear();
		    var last = Date.parse(cuyear + "/" + cumonth + "/" + cudate +" 00:00:00");
			
			//alert(today);
			
			if(today == last)
				newArts.push(arts[i]);	
			
		}
		
		$scope.arts = $filter('orderBy')(newArts, 'eventDate', true);
		
	};
	
	$scope.tmw = function() {
		var day = new Date();
		var tmr = day.setDate(day.getDate()+1);
		var yts = day.setDate(day.getDate()-1);
		
		var arts = $scope.masterarts;
		var i;
		var newArts = [];

		for(i = 0; i < arts.length; i++){
			
			var eventTime = new Date(Date.parse(jsDate(arts[i].eventDate)));
			
			if((eventTime < tmr) && (eventTime > yts))
				newArts.push(arts[i]);	
			
		}
		
		$scope.arts = $filter('orderBy')(newArts, 'eventDate', true);
		
	};
	
	$scope.week = function() {

		var Dates = new Date().getWeek(1);
		
		var pieces1 = Dates[0].toLocaleDateString().split("/");
		var pieces2 = Dates[1].toLocaleDateString().split("/");
		
		pieces1.reverse();
		var newDate1 = pieces1[0]+"/" + pieces1[2] +"/"+ pieces1[1];
		var sun = new Date(newDate1);
		
		pieces2.reverse();
		var newDate2 = pieces2[0]+"/" + pieces2[2] +"/"+ pieces2[1];
		var mon = new Date(newDate2);
		
		var arts = $scope.masterarts;
		var i;
		var newArts = [];

		for(i = 0; i < arts.length; i++){
			
			var eventTime = new Date(Date.parse(jsDate(arts[i].eventDate)));
			
			if((eventTime >= sun) && (eventTime <= mon))
				newArts.push(arts[i]);	
		}
		
		$scope.arts = $filter('orderBy')(newArts, 'eventDate', true);
    };
    
    $scope.month = function() {

    	var date = new Date(), y = date.getFullYear(), m = date.getMonth();
    	var firstDay = new Date(y, m, 1);
    	var lastDay = new Date(y, m + 1, 0);
    	
    	var arts = $scope.masterarts;
    	var i;
    	var newArts = [];

    	for(i = 0; i < arts.length; i++){
    		
    		var eventTime = new Date(Date.parse(jsDate(arts[i].eventDate)));
    		
    		if((eventTime <= lastDay) && (eventTime >= firstDay))
    			newArts.push(arts[i]);	
    		
    	}
    	
    	$scope.arts = $filter('orderBy')(newArts, 'eventDate', true);
    	
    };
    
	$scope.all = function() {
		
		$scope.arts = $scope.masterarts;
    };
    
	$scope.before = function() {
		
		var arts = $scope.masterarts;
		var i;
		var newArts = [];

		for(i = 0; i < arts.length; i++){
			
			var eventTime = new Date(Date.parse(jsDate(arts[i].eventDate)));
			
			if(eventTime < $scope.dateToday)
				newArts.push(arts[i]);	
			
		}
		
		$scope.arts = $filter('orderBy')(newArts, 'eventDate', true);
		
    };var init = function (jiele){if(jiele=='wansheng')$scope.all();else $scope.month();};init(jl);
    
});

function getDays(d, setday) {
	d = new Date(d);
	//alert(d+" yo");
	switch(setday){
		case 1:
			var day = d.getDay(), diff = d.getDate() - day + (day == 0 ? -6:1);
			alert(day+" d1");
			d = new Date(d.setDate(diff));
			alert(diff+" 1");
			break;
		case 7:
			var day = d.getDay(), diff = d.getDate() - day + (day == 1 ? -6:1);
			alert(day+" d7");
			d = new Date(d.setDate(diff));
			alert(diff+" 7");
		break;
	}

	return d;
}

function jsDate(str){
   return str.split('-').join('/');
}
Date.prototype.getWeek = function(start)
{
     //Calcing the starting point 
    start = start || 0;
    var today = new Date(this.setHours(0, 0, 0, 0));
    var day = today.getDay() - start; // 4
    
    var firstDayOfWeek = today.getDate();
    
    var date1 = today.getDate() - day; // -2
    
    
    // Grabbing Start/End Dates
    var StartDate = new Date(today.setDate(date1));
    var lastDayOfStartDateMonth = new Date(StartDate.getFullYear(), StartDate.getMonth() + 1, 0);   
    	
    var EndDate = new Date(today.setDate(date1 + 6));
    if(lastDayOfStartDateMonth.getDate() - StartDate.getDate() < 7)
    	EndDate.setMonth(EndDate.getMonth() + 1);

    return [StartDate, EndDate];
}


$('#xin-event-time-ol li').click(function(){
	var index = $(this).attr('value');
	var liname = $(this).text();
	
	var templiname;
	$('#xin-event-time-ol li').each(function(i, li) {
		templiname = $(li).text(); 
		$(li).html("");
		
		if(i == index)
			$("*[value='"+i+"']").append("<span class=\"xin-selected-option\">"+ liname + "</span>");
		else
			$("*[value='"+i+"']").append(templiname);
	});
	
	//$("*[value='"+index+"']").html("");
	//$("*[value='"+index+"']").append("<span class=\"xin-selected-option\">"+ liname + "</span>");
});
	
app.filter('partition', function() {
	
	
	  var cache = {};
	  var filter = function(arr, size) {
	    if (!arr) { return; }
	    var newArr = [];
	    
	    if(arr.length < 1){
	    	
	    	var arr2 = [{"postID":104,"postType":-1,"title":"这就是爱聚 ","author":"爱聚","content":"","coverImage":"http://mmbiz.qpic.cn/mmbiz/W6UfGJf1ib6hfugLibQXPcUar4wFzxeueE5ApDiaJe9TfPEfBaQjropSNDQWA3tcQD5xC55zl3dSGJF6VzQia8B9Ng/640","postDate":"","eventDate":"","geoLocation":"","lat":"","long1":"","z":-1,"disEventDate":"09月14日"}]

	    	
	    	for (var i=0; i<arr2.length; i+=size) {
	    		
		    	newArr.push(arr2);
	    	}
	    	
	    	//$scope.showInnerTable = true;
	    	//$scope.showInner1Table = true;
	    	$( "#xin-event-inner-table" ).css({
	    		"width": "34%"
	    		});
		    
    	}else{
      		
    		$( "#xin-event-inner-table" ).css({
	    		"width": "100%"
	    		});
    		
    		if(arr.length < 2){
    			var arr2 = {"postID":104,"postType":-1,"title":"这就是爱聚 ","author":"爱聚","content":"","coverImage":"http://mmbiz.qpic.cn/mmbiz/W6UfGJf1ib6hfugLibQXPcUar4wFzxeueE5ApDiaJe9TfPEfBaQjropSNDQWA3tcQD5xC55zl3dSGJF6VzQia8B9Ng/640","postDate":"","eventDate":"","geoLocation":"","lat":"","long1":"","z":-1,"disEventDate":"09月14日"}
    			arr.push(arr2);
    		}
    		
		    for (var i=0; i<arr.length; i+=size) {
		    	newArr.push(arr.slice(i, i+size));
		      
		    }
    	}
	    var arrString = JSON.stringify(arr);
	    var fromCache = cache[arrString+size];
	    if (JSON.stringify(fromCache) === JSON.stringify(newArr)) {
	      return fromCache;
	    }
	    cache[arrString+size] = newArr;
	    return newArr;
	  };
	  return filter;
});