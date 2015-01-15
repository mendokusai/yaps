var currentUser;

$(function(){
	var username;
	// console.log(currentUser.name);
	$('#submit_username').on('hover', function(){
		$('#submit_username').toggleClass('.hoverbutton');
	});
	$('#reddit_login').on('click', function(){
		window.location = "/auth/reddit";
	});

	$('#username').keypress(function(){
		if (event.keyCode == 13) {
			username = $('#username').val();
			if (currentUser != undefined){
				username = currentUser.name;
			} else if (username.length == 0){
				username = "Anonymous"
			};
			window.location = "/welcome/index?name="+ username;
		};	
	});

	$('#submit_username').on('click', function(){
		username = $('#username').val();
		if (currentUser != undefined){
			username = currentUser.name;
		} else if (username.length == 0){
			username = "Anonymous"
		};

		window.location = "/welcome/index?name="+ username;
	});

});
