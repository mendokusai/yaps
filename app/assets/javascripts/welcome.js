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
var username;

$(function(){
	$('#submit_username').on('hover', function(){
		$('#submit_username').toggleClass('.hoverbutton');
	})
	$('#submit_username').on('click', function(){
		username = $('#username').val();
		if (username.length == 0){
			username = "Anonymous"
		}
		console.log(username);
		window.location = "/welcome/index?name="+ username;
	});

});
