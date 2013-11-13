$("#star").click(function() {
  $("#star").html('<%= image_tag("star_filled.png", :height => 20)%>')
});


$(function() {
    $('#navm a').bind('click',function(event){
      var $anchor = $(this);

      $('html, body').stop().animate({
        scrollTop: $($anchor.attr('href')).offset().top
      }, 1000,'easeInOutExpo');
			
      event.preventDefault();
    });
		
		$('#venuem a').click(function() {
			var venue = $(this).html();
			if (venue == "All Venues") {
	      $('.panel').show("slow")
				$('#venuefilter').html(venue + '<span class="caret"></span>')
	      event.preventDefault();
			}
			else {
	      $('.panel').each(function(){
					var $this = $(this);
					if ($this.find('#venuename').html() == venue) {
						$this.show("slow");
						$('#venuefilter').html(venue + '<span class="caret"></span>')
			     	event.preventDefault();      
					}
					else if ($this.find('#venuename').html() != venue) {
						$this.hide("slow");
			     	event.preventDefault();      
					};
				});
			};
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

  });
