$("#star").click(function() {
  $("#star").html('<%= image_tag("assets/star_filled.png", :height => 20)%>')
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
    		var x = 0;
    		$('.panel').each(function(){
    			x++;
    			console.log("running panel "+x);
    			var $this = $(this);
    			console.log($this.find("input[name='commit']").attr("value"));
    			if ($this.find("input[type='image']").attr("class") == "star_unfilled") {
    				$this.hide("slow");
    				event.preventDefault();      
    			}
    			else if ($this.find("input[type='submit']").attr("class") == "star_filled") {
    				$this.show("slow");
    				event.preventDefault();      
    			};
    		})
    		$('#starredfilter').html("All Events");
    	}
    	else {
    		$('.panel').show("slow");   
    		$('#starredfilter').html("Starred Events");
    		$('#venuefilter').html("All Venues <span class='caret'></span>"); 
    	};
    });
    		
		$('#login').click(function(e) {
		   e.stopPropagation();
		});
  	
    $("a.fancybox").fancybox();
});
