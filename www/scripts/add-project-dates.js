const dates = [];
	
function remove_date(i) {
	i = parseInt(i);
	dates.splice(i, 1);
	update_date_list(true);
}
	
function update_date_list(animate) {
	const date_list = document.getElementById("date_list");
	const form_dates = document.getElementById("form_date_list");
	
	let res_list = "";
	let form_list = ""
	
	let i = 0;
	for(const date of dates) {
		const extra = (i == dates.length - 1) || animate? 'class="fade-in"' : '';
		res_list += `<p ${extra}>${new Date(date).toLocaleString()} <input type="button" value="Remove" onclick="remove_date(${i})"/></p>`;
		form_list += `<input type="datetime-local" name="selected_date_${i}" value="${date}" readonly/>`
		i++;
	}
	
	if(res_list == "")
		res_list = "...";
	
	date_list.innerHTML = res_list;
	form_dates.innerHTML = form_list;
	
	date_list.style.animation = "list_load 0.5s";
}

function err_msg(msg) {
	const err_text = document.getElementById("date_error_text");
	err_text.innerHTML = `<span class="fade-out">${msg}</span>`;
	
	shake_elements();
}
	
function add_date() {
	const date = document.getElementById("date_picker");
	
	const start_date = new Date(document.getElementById("project_start_date").value);
	const end_date = new Date(document.getElementById("project_end_date").value);
	
	const date_time = new Date(date.value);
	
	if(date_time < start_date) {
		err_msg("Date is before project start date");
		return;
	}
	if(date_time > end_date) {
		err_msg("Date is past project end date");
		return;
	}
	
	if(dates.includes(date.value)) {
		err_msg("Duplicate date");
		return;
	}
	
	if(date.value.trim() == "") {
		err_msg("Please enter a date");
		return;
	}
	
	dates.push(date.value);
	date.value = "";
	update_date_list(false);
}

window.onload = () => {
	update_date_list(false);
};
