var user = null;
var user_details = null;
var affiliate_code = null;
var app_user = null;
var sub_affiliate = null;

function getUserDetails(){
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
				errors = jqXHR;

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
			$("#breeasy_user_referrer").val(affiliate_code);
			$("#user_master_id").val(user.id)
			$("#status").text("Welcome " + user['email']);
			
			
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
	
		$.mobile.showPageLoadingMsg("a", "Sending details to the server...", "false");
		if(form_name == 0){
	    	var str = $("#instainvoice_signup_form").serializeArray();
		}
		else {
			var str = $("#breeasy_signup_form").serializeArray();
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
                // for (var i in jqXHR) {
                //     console.log(i + ' = ' + jqXHR[i]);
                // }
            },
	        // callback handler that will be called on completion
	        // which means, either on success or error
	        complete: function(){
	        if(app_user){
				if(form_name == 0){
					if (app_user.errors){
						alert("Email " + app_user.errors.email + " Password " + app_user.errors.password);
					}
					else {
					alert("Successfully Created An InstaInvoice Account and an email has been sent to " + app_user.email);
					$.mobile.changePage( "#home_page", { transition: "slideup"} )
					}
				}
				else {
					if (app_user.password){
						alert("Password " + app_user.password);
					}
					else if (app_user.email){
						alert("Email " + app_user.email);
					}
					else if (app_user.username){
						alert("UserName " + app_user.username);
					}
					else {
						alert("Successfully created Breeasy for Small Business Account and an email has been sent to " + app_user.user.email);
						$.mobile.changePage( "#home_page", { transition: "slideup"} )
						
					}
					
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
	
	
	function setup_sub_affiliate(){
			$.mobile.showPageLoadingMsg("a", "Sending details to the server...", "false");

	    	var str = $("#sub_signup_form").serializeArray();
			var errors = null;
			
		console.log("data:  " + str);

		$.ajax({
	        url: "../api/v1/users.json",
	        type: "post",
	        data: str,
	        dataType: "json",

	       	// callback handler that will be called on success
	        success: function(response, textStatus, jqXHR){
	            // log a message to the console
				console.log("Success " + response);

				sub_affiliate = response;
				console.log(sub_affiliate);
	        },
	        // callback handler that will be called on error


            error: function (jqXHR, textStatus, errorThrown) {
                console.log(textStatus + ' - ' + errorThrown);
                for (var i in jqXHR) {
                    console.log(i + ' = ' + jqXHR[i]);
                }
				errors = jqXHR;
            },
	        // callback handler that will be called on completion
	        // which means, either on success or error
	        complete: function(){
	        if(sub_affiliate){
				alert("Sub affiliate created and an email has been sent to " + sub_affiliate.email);
				$.mobile.changePage( "#home_page", { transition: "slideup"} )
			
			
			}
			else
			{
					if (errors){
							var error_text = $.parseJSON(errors['responseText']);
							//console.log(error_text.errors.email[0]);
							if(error_text.errors.email != null){
								alert("Email " + error_text.errors.email[0]);
							}
							if(error_text.errors.password != null){
								alert("Password " + error_text.errors.password[0]);
							}
					}

			}
	        $.mobile.hidePageLoadingMsg();


	     	} //complete

	    	}); //ajax
		
	}