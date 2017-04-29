$(document).ready( () => {
	
	//set search defaults on page load
	set_search_default()
	
	//if the user enters the text box clear our our default
	$('#osu-search-query').focus(
	    function() {
	      	$(this).attr('value', '');
			$(this).css('color', '#000');
	    }
	  );
	
	//when the leave if its still empty set it back to defaults...otherwise leave it alone
	$('#osu-search-query').blur(
	    function() {
			if ($(this).val() == ""){
	      		set_search_default()
			}
	    }
	  );
	
	function set_search_default(){
		//set our default search box text
		$('#osu-search-query').attr('value', 'Search this site...');
		$('#osu-search-query').css('color', '#706e6a');
	}
	
});