var user = null;
var user_details = null;
var affiliate_code = null;
var app_user = null;

function getUserDetails(){
	user_details = null;
	affiliate_code = null;
	$.ajax({
	        url: "../api/v1/users/" + user['id'] + ".json",
	        type: "get",
	       // data: str,
	        dataType: "json",

	       	// callback handler that will be called on success
	        success: function(response, textStatus, jqXHR){
	            // log a message to the console
	            console.log("Hooray, it worked!");
				//$('#results').text("it worked");
				user_details = response;
	        },
	        // callback handler that will be called on error
	        error: function(jqXHR, textStatus, errorThrown){
	            // log the error to the console
	            console.log(
	                "The following error occurred: "+
	                textStatus);
				console.log("Error "  + jqXHR)
				error = jqXHR;

	        },
	        // callback handler that will be called on completion
	        // which means, either on success or error
	        complete: function(){
	        if(user_details){
				//now lets do something with user data
				// $.each(user, function(index, value) {
				// 	console.log("index " + index);
				// });
			$("#first_name").text(user_details['first_name']);
			$("#last_name").text(user_details['last_name']);
			$("#company").text(user_details['company']);
			$("#id").text(user['id']);
			$("#sync_status").text("true");
			$("#user_name").text(user['email']);
				if(user['master']){
					$("#affiliate_type").text("Master");
				}
				else
				{
					$("#affiliate_type").text("Standard");
				}
			$("#affiliate_code").text(user_details['affiliate_code']);
			affiliate_code = user_details['affiliate_code'];
			$("#user_referrer").val(affiliate_code);
			$("#user_master_id").val(user.id)
			
			
			}
			else
			{
				 alert("Your details could not be found.  Please login into the Breeasy Billing app with your InstaInvoice credentials and update your account details.");
				 $("#sync_status").text("false");
			}
	        $.mobile.hidePageLoadingMsg();


	     	} //complete

	    	}); //ajax
	 }
	
	function setup_app_user(form_name){
		
		console.log(form_name);
		$.mobile.showPageLoadingMsg("a", "Sending details to the server...", "false");
		if(form_name == 0){
	    	var str = $("#instainvoice_signup_form").serializeArray();
		}
		console.log("data:  " + str);
		
		$.ajax({
	        url: "../api/v1/apps.json",
	        type: "post",
	        data: str,
	        dataType: "json",

	       	// callback handler that will be called on success
	        success: function(response, textStatus, jqXHR){
	            // log a message to the console
				console.log("Success " + response);

				app_user = response;
				console.log(app_user);
	        },
	        // callback handler that will be called on error


            error: function (jqXHR, textStatus, errorThrown) {
                console.log(textStatus + ' - ' + errorThrown);
                for (var i in jqXHR) {
                    console.log(i + ' = ' + jqXHR[i]);
                }
            },
	        // callback handler that will be called on completion
	        // which means, either on success or error
	        complete: function(){
	        if(app_user){
				if (app_user.errors){
					alert("Email " + app_user.errors.email + " Password " + app_user.errors.password);
				}
				else {
					alert("Successfully Created An InstaInvoice Account and an email has been sent to " + app_user.email);
				}
		
			
			
			}
			else
			{
				alert("Oops - An error occurred");

			}
	        $.mobile.hidePageLoadingMsg();


	     	} //complete

	    	}); //ajax
		
	}