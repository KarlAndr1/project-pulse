function submit_new_project() {
	const start_date_field = document.getElementById("start-date-field");
	const end_date_field = document.getElementById("end-date-field");
	
	if((new Date(start_date_field.value)) > (new Date(end_date_field.value))) {
		const err_field = document.getElementById("start-date-error-field");
		err_field.innerHTML = '<span class="fade-out">Start date must be before end date</span>';
		
		shake_elements();
		
		return false;
	}
	
	return true;
}
