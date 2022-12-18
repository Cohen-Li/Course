$("#portfolio button").click(function (event) {

	if ($(this).hasClass('active')){
		return;
	}

	$(this).siblings('button.active').removeClass("active");

	$(this).addClass('active');

	var data = $(this).attr("data");

	var allDivs = $(this).nextAll(".row").children();

	if(data == "all"){
		allDivs.show();
	}
	else
	{
		//var showDivs = $(`#portfolio .row > div[data=${data}]`);

		var showDivs = $(this).nextAll(".row").children(`[data=${data}]`);

		showDivs.show();

		allDivs.not(showDivs).hide();
	}

});

$(window).scroll(function(event) {
	
	if ($(this).scrollTop() >= $("#portfolio").offset().top) {
		$(".navbar").addClass('fixed-top');
		$("header").addClass('dummy-padding');
	}
	else{
		console.log("norman menu");
		$(".navbar").removeClass('fixed-top');
		$("header").removeClass('dummy-padding');
	}

	toggleBackToTop();
	
});
toggleBackToTop();

function toggleBackToTop() {
	// hide/show back to top

	if ($(window).scrollTop() == 0) {
		$(".back-to-top").fadeOut(); // hide
	}
	else {
		$(".back-to-top").fadeIn();	// show
	}
}