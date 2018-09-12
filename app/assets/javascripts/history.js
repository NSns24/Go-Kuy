$(document).ready(function(){
	$('.history-address').geocomplete({
    	country: 'id',
    	types: []
  	}).bind('geocode:result', function(event, result) {
    	let address = result.formatted_address;
    	let name = (result.name === undefined) ? "" : result.name + ", ";
    	let str = address.substr(0, address.indexOf(','));

    	$(this).html(name + str);
  	});

  	$('.history-price').each(function(i){
  		$(this).html('Price: Rp ' + calculatePrice(gon.orders[i].distance));
  	});

    $('.history-address').each(function(i){
      $(this).geocomplete("find", gon.orders[i].dest_lat + "," + gon.orders[i].dest_lng);
    });
});

function calculatePrice(distance) {
  let price = 2000;

  if(distance <= 5) {
    return 5000;
  }
  else {
    return Math.ceil(distance * price);
  }
}