var currentUser;

$(function(){
	var username;
	$('#submit_username').on('hover', function(){
		$('#submit_username').toggleClass('.hoverbutton');
	});
	$('#reddit_login').on('click', function(){
		window.location = "/auth/reddit";
	});

	$('#logged_in_enter').on('click', function(){
		if (currentUser) {
			username = currentUser.name;
		} else {
			username = $('#username').val();
			if (username.length == 0) {
				var random = Math.floor(Math.random() * 100 + 1);
				username = "Anonymous" + "-" + random;		
			}
		}
		window.location ="/welcome/index?name=" + username;
	});

	$('#no_login').on('click', function(){
		if (currentUser) {
			username = currentUser.name;
		} else {
			username = $('#username').val();
			if (username.length == 0) {
				var random = Math.floor(Math.random() * 100 + 1);
				username = "Anonymous" + "-" + random;	
			}
		}
		window.location ="/welcome/index?name=" + username;
	});

	$('#username').keypress(function(event){
		if (event.keyCode == 13) {
			username = $('#username').val();
			if (currentUser != undefined){
				username = currentUser.name;
			} else if (username.length == 0){
				var random = Math.floor(Math.random() * 100 + 1);
				username = "Anonymous" + "-" + random;
			};
			window.location = "/welcome/index?name="+ username;
		};	
	});

});
