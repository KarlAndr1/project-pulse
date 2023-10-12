function submit_new_member() {
	const new_member_field = document.getElementById("new-user-field");
	if(new_member_field.value.trim() == "") {
		const new_member_err_field = document.getElementById("new-user-error-field");
		new_member_err_field.innerHTML = '<span class="fade-out">Please enter a member id</span>'
		
		shake_elements();
		return false;
	}
	
	return true;
}
