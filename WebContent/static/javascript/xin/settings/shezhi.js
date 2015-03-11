$('#settings-option-ul li').click(function(){
	
	var arrli = ["geren","touxiang","mima"];
	var index = $(this).attr('liv');
	var liname = $(this).text();
	
	var templiname;
	$('#settings-option-ul li').each(function(i, li) {
		templiname = $(li).text(); 
		$(li).html("");
		
		if(i == index){
			$("*[liv='"+i+"']").append("<span class=\"xin-selected-option\">"+ liname + "</span>");
			$("*[bumen='"+arrli[i]+"']").fadeIn(0);
		}else{
			$("*[liv='"+i+"']").append(templiname);
			$("*[bumen='"+arrli[i]+"']").fadeOut(0);
		}
	});
});

function xianshiBumen(bumen){
	
	var arrli = ["geren","touxiang","mima"];
	var index = arrli.indexOf(bumen);
	
	var i = 0;
	
	for(i; i< arrli.length; i++){
		
		var lname = $("*[liv='"+i+"']").text();
		
		if(i == index){
			$("*[liv='"+i+"']").empty();
			$("*[liv='"+i+"']").append("<span class=\"xin-selected-option\">"+ lname + "</span>");
			$("*[bumen='"+arrli[i]+"']").fadeIn(0);
		}else{
			$("*[liv='"+i+"']").empty();
			$("*[liv='"+i+"']").append(lname);
			$("*[bumen='"+arrli[i]+"']").fadeOut(0);
		}
	}
}

$('#udpatepassbtn').click(function(event) {  
	//alert("yo");
    var m1=$('#n_pass1').val();
    var m2=$('#n_pass2').val();
    var cm=$('#c_pass').val();
    
    if(m1 != m2){
    	//$('#settings-notice').empty();
		//$('#settings-notice').append("<div class=\"notify\"><p class=\"notify-red\">新密码与确认新密码不搭配 <span class=\"x-mark x-login-page\">&#x2717;</span></p></div>");
    	$('#n_pass1').css('border-color', 'red');
		$('#n_pass2').css('border-color', 'red');
		
    }
    
    /*else{
	    $.post('mima',{n_pass1:m1,n_pass2:m2,c_pass:cm},function(id) { 
	    	//alert(id);
	    	if(id == 0){
	    		$('#settings-notice').empty();
	    		$('#settings-notice').append("<div class=\"notify\"><p class=\"notify-red\">新密码与确认新密码不搭配</p></div>");
	        	$('#n_pass1').css('border-color', 'red');
	    		$('#n_pass2').css('border-color', 'red');
	    		$('#c_pass').css('border-color', '#777');
	    	}else if(id == 1){
	    		$('#settings-notice').empty();
	    		$('#settings-notice').append("<div class=\"notify\"><p class=\"notify-green\">密码更新成功</p></div>");
	    		$('#n_pass1').val("");
	    		$('#n_pass2').val("");
	    		$('#c_pass').val("");
	    		$('#n_pass1').css({'border-color':'#eee','box-shadow':'none'});
	    		$('#n_pass2').css({'border-color':'#eee','box-shadow':'none'});
	    		$('#c_pass').css({'border-color':'#eee','box-shadow':'none'});
	    	}else{
	    		$('#settings-notice').empty();
	    		$('#settings-notice').append("<div class=\"notify\"><p class=\"notify-red\">现有密码不对。请重新输入现有密码</p></div>");
	    		$('#c_pass').val("");
	    		$('#n_pass1').css({'border-color':'#eee','box-shadow':'none'});
	    		$('#n_pass2').css({'border-color':'#eee','box-shadow':'none'});
	    		$('#c_pass').css('border-color', 'red');
	    	}
	    });
    }*/
});
$('#admin-edit-list-table td').click(function() {
	/*
    var myCol = $(this).index();
    var $tr = $(this).closest('tr');
    var trvalue = $tr.attr("index");
    var pid = trvalue.split("-");
    var myRow = $tr.index();
    alert(myRow + " "+ pid[0]);
    */
	
});
function cD(tl) {
    
    if (confirm("确定把推文转移到回收站？") == true) {
    	window.location.href = tl;
    } else {
    }
}
function recoveryD(tl) {
    
    if (confirm("确定把草稿转移到活动列表？") == true) {
    	window.location.href = tl;
    } else {
    }
}
function delD(tl) {
    
    if (confirm("确定把草稿永久删除？") == true) {
    	window.location.href = tl;
    } else {
    }
}

