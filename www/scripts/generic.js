window.addEventListener("load", () => {
	const url = window.location.href.replaceAll(/[<>"&]/g, ""); //Remove any HTML characters
	
	const url_error_param = url.match(/error=([^&#]*)/);
	if(url_error_param == null)
		return;
	
	let params = url_error_param[1].split(",").map((x) => x.split(":"));
	
	for(const entry of params) {
		const name = entry[0];
		const value = entry[1].replaceAll(/\+/g, ' ');
		
		if(name == "s" && value == "h") {
			let shake_items = document.getElementsByClassName("shakable");
			for(const item of shake_items) {
				item.className += " shake";
			}
			continue;
		}
		
		let err_box = document.getElementById(name);
		if(err_box) {
			if(value == "s") { // https://stackoverflow.com/questions/195951/how-can-i-change-an-elements-class-with-javascript
				err_box.className +=  " shake";
			} else
				err_box.innerHTML = `<span class="fade-out">${value}</span>`;
		}
	}
});

function shake_elements() {
	const shakable_items = document.getElementsByClassName("shakable"); //https://stackoverflow.com/a/63561659
	for(const item of shakable_items) {
		item.classList.remove("shake-instant");
		item.offsetWidth;
		item.classList.add("shake-instant");
	}
}
