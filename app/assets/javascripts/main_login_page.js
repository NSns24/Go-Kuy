var loginAsDriver = $('.login-driver-image');
var loginAsCustomer = $('.login-goride-image');

loginAsDriver.on('click', loginDriver);
loginAsCustomer.on('click', loginCustomer);

function loginDriver(){

	loginAsDriver.css('position', 'absolute');
	loginAsDriver.css('width', '260px');
	loginAsDriver.css('height', '260px');
	$('.login-home-content-driver').css('height','80vh');
	loginAsDriver.animate({
		"top" : '11%',
		"right" : '-2.5%',
		"width" : '464px',
		"height" : '464px'
	}, "slow", function(){
		$('.login-driver').fadeIn();
	});
	var driverImage = $('.login-home-content-driver');

}

function loginCustomer(){
	loginAsCustomer.css('position', 'absolute');
	loginAsCustomer.css('width', '260px');
	loginAsCustomer.css('height', '260px');
	loginAsCustomer.css('right', '0');
	loginAsCustomer.css('top', '80%');
	loginAsCustomer.css('transform', 'translate(-50%,-50%)');
	$('.login-home-content-customer').css('height','80vh');
	loginAsCustomer.animate({
		"left" : '50%',
	}, "slow", function(){
		$('.login-customer').fadeIn();
	});
	var driverImage = $('.login-home-content-customer');
}