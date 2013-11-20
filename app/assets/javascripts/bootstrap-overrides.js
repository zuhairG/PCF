$("#star").click(function() {
  $("#star").html('<%= image_tag("assets/star_filled.png", :height => 20)%>')
});

// $(window).scroll(
// 	function (event) {
// 		var y = $(this).scrollTop();
// 		if y<0{
// 			$('#navbar').stop().removeClass('scroll');
//   		$('#nav-bar').stop().removeClass('scroll');
//   		$('#pcf-logo').stop().removeClass('scroll');
// 		}, else{
// 			$('#navbar').stop().addClass('scroll');
//   		$('#nav-bar').stop().addClass('scroll');
//   		$('#pcf-logo').stop().addClass('scroll');
// 		}
  	
// 	}
// );

$(function() {
    $('#navm a').bind('click',function(event){
      var $anchor = $(this);
			
      var top = $($anchor.attr('href')).offset().top;
 		 	top -= 10;

      $('html, body').stop().animate({
        scrollTop: top
      }, 1000,'easeInOutExpo');
			
      event.preventDefault();
    });
		
		$('#venuem a').click(function() {
			var venue = $(this).html();
			if (venue == "All Venues") {
	      $('.date-header').show();
				$('.panel').show("slow");
				$('#venuefilter').html(venue + '<span class="caret"></span>')
	      event.preventDefault();
			}
			else {
				$('.date-header').each(function(){
					var $dateheader = $(this);
					var totalpanels = $dateheader.next().find('.panel').length;
		      $dateheader.next().find('.panel').each(function(){
						var $panel = $(this);
						if ($panel.find('#venuename').html() == venue) {
							$dateheader.show();
							$panel.show("slow");
							$('#venuefilter').html(venue + '<span class="caret"></span>')
				     	event.preventDefault();      
						}
						else if ($panel.find('#venuename').html() != venue) {
							$panel.hide("slow");
							totalpanels = totalpanels-1;
				     	event.preventDefault();      
						};
						if (totalpanels <= 0){
							$dateheader.hide();
						}
					});
				})
			}
		});
		
    $('#starredfilter').click(function() {
    	var venue = $(this).html();
    	if (venue == "Starred Events") {
				$('.date-header').each(function(){
					var $dateheader = $(this);
					var totalpanels = $dateheader.next().find('.panel').length;
	    		$dateheader.next().find('.panel').each(function(){
	    			var $panel = $(this);
	    			if ($panel.find("input[type='image']").attr("class") == "star_unfilled") {
	    				$panel.hide("slow");
							totalpanels = totalpanels-1;
	    				event.preventDefault();      
	    			}
	    			else if ($panel.find("input[type='submit']").attr("class") == "star_filled") {
	    				$panel.show("slow");
	    				event.preventDefault();      
	    			};
						if (totalpanels <= 0){
							$dateheader.hide();
						};
	    		})
	    		$('#starredfilter').html("All Events");
					$('#venuefilter').html("All Venues <span class='caret'></span>"); 
				})
    	}
    	else {
    		$('.panel').show("slow");   
				$('.date-header').show("slow");
    		$('#starredfilter').html("Starred Events");
    		$('#venuefilter').html("All Venues <span class='caret'></span>"); 
    	};
    });
    		
		$('#login').click(function(e) {
		   e.stopPropagation();
		});
  	
    $("a.fancybox").fancybox();
});
