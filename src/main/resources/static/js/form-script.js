let showForm = () => {
	let wdForm = document.getElementsByClassName("withdraw");
	let dpsForm = document.getElementsByClassName("deposit");
	
	let chkDeposit = document.getElementById("chkDeposit");
	let chkWithdraw = document.getElementById("chkWithdraw");
	
	Array.prototype.filter.call(
		wdForm,
		(element) => element.style.display = chkDeposit.checked ? "block" : "none"
	)
	Array.prototype.filter.call(
		dpsForm,
		(element) => element.style.display = chkWithdraw.checked ? "block" : "none"
	)
}

let injectFormData = () => {
	let form = document.getElementById("money-form");
	let selectedValue = document.getElementById("selector").value;
	
	if (document.getElementById("chkDeposit").checked) {
		form.action = "/accounts/" + selectedValue + "/deposit";
	} 
	
	if (document.getElementById("chkWithdraw").checked) {
		form.action = "/accounts/" + selectedValue + "/withdraw";
	}
}

//Exchange page

