function update_password_submit() {
	const new_password_1 = document.getElementById("new-password-field-1");
	const new_password_2 = document.getElementById("new-password-field-2");
	
	if(new_password_1.value != new_password_2.value) {
		document.getElementById("password-field-error").innerHTML = "<span class='fade-out'>Passwords do not match</span>";
		shake_elements();
		return false;
	}
	
	return true;
}
