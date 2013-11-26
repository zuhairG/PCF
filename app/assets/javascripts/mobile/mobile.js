$("#star").click(function() {
  $("#star").html('<%= image_tag("assets/star_filled.png", :height => 20)%>')
});

var previousScroll = 0,
headerOrgOffset = $('#navbar').height();

$('#nav-bar').height($('#navbar').height());

$(window).scroll(function () {
    var currentScroll = $(this).scrollTop();
    if (currentScroll > headerOrgOffset) {
        if (currentScroll > previousScroll) {
            $('#navbar').addClass('scroll');
            $('#nav-bar').addClass('scroll');
            $('#pcf-logo').addClass('scroll');
        } else {
        		$('#navbar').removeClass('scroll');
            $('#nav-bar').removeClass('scroll');
            $('#pcf-logo').removeClass('scroll');
        }
    } 
    previousScroll = currentScroll;
});

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
	      $('.date-header').fadeIn();
				$('.panel').fadeIn();
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
							$dateheader.fadeIn();
							$panel.fadeIn();
							$('#venuefilter').html(venue + '<span class="caret"></span>')
				     	event.preventDefault();      
						}
						else if ($panel.find('#venuename').html() != venue) {
							$panel.fadeOut();
							totalpanels = totalpanels-1;
				     	event.preventDefault();      
						};
						if (totalpanels <= 0){
							$dateheader.fadeOut();
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
	    				$panel.fadeOut();
							totalpanels = totalpanels-1;
	    				event.preventDefault();      
	    			}
	    			else if ($panel.find("input[type='submit']").attr("class") == "star_filled") {
	    				$panel.fadeIn();
	    				event.preventDefault();      
	    			};
						if (totalpanels <= 0){
							$dateheader.fadeOut();
						};
	    		})
	    		$('#starredfilter').html("All Events");
					$('#venuefilter').html("All Venues <span class='caret'></span>"); 
				})
    	}
    	else {
    		$('.panel').fadeIn();   
				$('.date-header').fadeIn();
    		$('#starredfilter').html("Starred Events");
    		$('#venuefilter').html("All Venues <span class='caret'></span>"); 
    	};
    });
    		
		$('#login').click(function(e) {
		   e.stopPropagation();
		});
  	
    $("a.fancybox").fancybox();
});
