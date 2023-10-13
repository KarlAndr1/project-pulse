function submit_new_project() {
	const start_date_field = document.getElementById("start-date-field");
	const end_date_field = document.getElementById("end-date-field");
	const current_time = new Date();
	
	if((new Date(start_date_field.value)) > (new Date(end_date_field.value))) {
		const err_field = document.getElementById("start-date-error-field");
		err_field.innerHTML = '<span class="fade-out">Start date must be before end date</span>';
		
		shake_elements();
		
		return false;
	}
	
	const midnight_end_date = new Date(end_date_field.value);
	midnight_end_date.setHours(0);
	midnight_end_date.setMinutes(0);
	midnight_end_date.setSeconds(0);
	midnight_end_date.setMilliseconds(0);
	console.log(midnight_end_date + ", " + current_time);
	
	if(midnight_end_date < current_time) {
		const err_field = document.getElementById("start-date-error-field");
		err_field.innerHTML = '<span class="fade-out">End date cannot be before current time</span>';
		shake_elements();
		
		return false;
	} 
	
	return true;
}
