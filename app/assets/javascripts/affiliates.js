jQuery(document).ready(function() {
	console.log("affiliate.js");
	$("#join_contact_list").unbind();

		$("#join_contact_list").submit(function(event){

			 var sEmail = $('#mail_list_email').val();
		        if ($.trim(sEmail).length == 0) {
		            $("#contact_list_response").text('Please enter valid email address');
		            return false;
		        }
		        if (validateEmail(sEmail)) {
		        }
		        else {
		          $("#contact_list_response").text('Invalid Email Address');
		          return false;
		        }
			var error = false;
			var response;
		    var str = $("#join_contact_list").serializeArray();
			console.log("data:  " + str);
			$.ajax({
		        url: "../users/create_contact.json",
		        //url: "../renewal/mobile_test.json",
		        type: "post",
		        data: str,
		        // callback handler that will be called on success
		        success: function(response, textStatus, jqXHR){
		            // log a message to the console
		            console.log("Hooray, it worked!");
					//$('#results').text("it worked");
					console.log(textStatus);
					//response contains two: objects renewal and dmv_response

		        },
		        // callback handler that will be called on error
		        error: function(jqXHR, textStatus, errorThrown){
		            // log the error to the console
		            console.log(
		                "The following error occurred: "+
		                textStatus);
				//	console.log(jqXHR);
					error = true;
		        },
		        // callback handler that will be called on completion
		        // which means, either on success or error
		        complete: function(){
		        	if(!error){
					$("#contact_list_response").text("Thanks for your interest");
					}
		        }

		    }); //ajax

			return false;
		}); //submit	

		function validateEmail(sEmail) {
		    var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		    if (filter.test(sEmail)) {
		        return true;
		    }
		    else {
		        return false;
		    }
		}	
	
});

