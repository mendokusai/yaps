var currentUser;
// var dispatcher;

// var message = {
// 	name: "Put stuff in the tubes.",
// 	completed: false
// }

// $(document).ready(function(){
// 	// set up websocket
// 	dispatcher = new WebSocketRails("localhost:3000/websocket");
// 	console.log(dispatcher); //connecting
	
// 	$('#send_button').on('click', function(){
// 		var text = $('#send_text').val();
// 		if (text.length > 0){
// 			//add a dispatch task here...
// 			$('#messages').append("<li>" + text + "</li>");
// 		};
// 		$('#send_text').val("");
// 	});

// });



$(function(){
	var username;
	// console.log(currentUser.name);
	$('#submit_username').on('hover', function(){
		$('#submit_username').toggleClass('.hoverbutton');
	});
	$('#reddit_login').on('click', function(){
		window.location = "/auth/reddit";
	});

	$('#submit_username').on('click', function(){
		username = $('#username').val();
		if (currentUser){
			username = currentUser.name;
		} else if (username.length == 0){
			username = "Anonymous"
		};

		window.location = "/welcome/index?name="+ username;
	});

});
