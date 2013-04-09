$(document).ready(function(){
	
	var keywordInput = $('#keyword'),
		searchButton = $('#search'),
		displayFeed = $('#feed'),
		keyword = '',
		content = '';
	
	//CLEAR
	keywordInput.focus(function(){
	
		displayFeed.empty(); //clears results
		keywordInput.val(''); //clears input box when return to type new key words.	
		
	});//end clear
	
	//SEARCH & DISPLAY
	searchButton.click(function(){
	
		keyword = keywordInput.val(); //retrieves keyword(s) typed.
						
		$.getJSON('http://search.twitter.com/search.json?callback=?&q='+keyword,function(data){ //display JSON feed using keyword(s) typed
		
			console.log(data); //see if results came in...

			console.log(data.results[0].from_user); //if only there were a way to go into the array results and loop over each element and report back the data I want... What about loops?
			
			//for each object result retrieve the data and display
			$.each(data.results, function(i, element){
			
        		content = '<p><a href="http://twitter.com/'+element.from_user+'" target="_blank"><img src="'+element.profile_image_url+'" alt="picture of '+element.from_user+'"></a> &quot;'+element.text+'&quot; -'+element.from_user+' <span class="date">['+element.created_at+']</span></p>';
        		
        		displayFeed.append(content); //displays each result inside feed area.
        		
        		displayFeed.find('p').highlight(keyword); //highlight matching terms using highlight plugin.
        		
			});//end each
			
		});//end getJSON
		 
	});//end Search
		
});//end document ready