function updateAnimalTable(data) {
	var json = data[0];
	if(json.newRow == "No Match") {
		alert(json.newRow);
		return;
	}
	if(json.newRow != "") {
		$('#animals').append($(json.newRow));
		$('#animals').css('display', 'block');
		$('#marketBid').val(json.marketBid);
		$('#rightArrowAnimal').css('display', 'none');
	}
	if(json.buyerRow != "") {
		$('#buyers').css('display', 'block');
		$('#totalAmountRow').before($(json.buyerRow));
		var buyerNums = $('#buyerNums').val();
		$('#buyerNums').val(json.buyerNums);
		$("#pricePerPound").val(json.bid);
		$("#destination").val(json.dest);
		updateTotal();
	}
}
function updateBuyerTable(data) {
	var json = data[0];
	var id = '#buyer' + $('#buyerNum').val();
	if($(id).length > 0) {
		alert("This buyer is already added to the invoice");
		return;
	}
	if(json.newRow == "No Match") {
		alert(json.newRow);
		return;
	}
	if(json.newRow != "") {
		$('#buyers').css('display', 'block');
		$('#totalAmountRow').before($(json.newRow));
		var buyerNums = $('#buyerNums').val();
		if(buyerNums == "") {
			$('#buyerNums').val($('#buyerNum').val());
		} else {
			$('#buyerNums').val(buyerNums + ',' + $('#buyerNum').val());
		}
		updateTotal();
	}
}

function updateTotal() {
	var totalAmount = 0;
	$('input.amountDueColumn.amountDue').each(function() {
		if(parseFloat($(this).val()) != "NaN") {
			totalAmount	+= parseFloat($(this).val());
		}
	});	
	$('#totalAmount').val(totalAmount.toFixed(2));
}

function removeAnimal(id) {
	$('#animal' + id).remove();
	$('#animals').css('display', 'none');
	$('#rightArrowAnimal').css('display', 'block');
}

function removeBuyer(id) {
	var buyerNums = $('#buyerNums').val() + "";
	buyerNums = buyerNums.replace(id + ',', '');
	buyerNums = buyerNums.replace(',' + id, '');
	buyerNums = buyerNums.replace(id, '');
	$('#buyerNums').val(buyerNums);
	$('#buyer' + id).remove();
	if($('.removeBuyer').size() == 0) {
		$('#buyers').css('display', 'none');
	}
	updateTotal();
}

function calculateTotalCost() {
	var bid = parseFloat($('#pricePerPound').val());
	var weight = parseInt($('#weight').text());
	var total = bid * weight;
	if($('#destination option:selected').text() == "Resale") {
		total -= weight * parseFloat($('#marketBid').val());
	}
	total = total.toFixed(2);
	$('#totalCost').val(total);
	$('#totalAmount').val(total);
	var pricePerBuyer = total / $('input.amountDueColumn.amountDue').size();
	pricePerBuyer = pricePerBuyer.toFixed(2);
	$('input.amountDueColumn.amountDue').each(function() {
		$(this).val(pricePerBuyer);
	});
}

function validateForm() {
	if($('.removeAnimal').size() < 1) {
		alert("No animal added to invoice");
		return false;
	}
	if($('.removeBuyer').size() < 1) {
		alert("No buyers added to invoice");
		return false;
	}
	if(isNaN($('#pricePerPound').val()) || $('#pricePerPound').val() == "") {
		alert("Incorrect Bid");
		return false;
	}
	if($('#destination').val() == 'null') {
		alert("Please select a destination");
		return false;
	}
	if($('#totalAmount').val() != $('#totalCost').val()) {
		alert("Total Cost and amount being paid are not equal");
		return false;
	}
	var buyerNums = $('#buyerNums').val().split(",");
	var i = 0;
	var buyerAmounts = "";
	for(i = 0; i < buyerNums.length; i++) {
		buyerAmounts += $('#amountDue' + buyerNums[i]).val() + ',';
	}
	$('#buyerAmounts').val(buyerAmounts);
}

function checkPrintResult(text) {
	if(text == "failure") {
		alert("Print Failed");
	} else if(text == "no purchases") {
		alert("No Purchases Found");
	} else if(text == "no buyer number") {
		alert("Buyer does not exist");
	}
}