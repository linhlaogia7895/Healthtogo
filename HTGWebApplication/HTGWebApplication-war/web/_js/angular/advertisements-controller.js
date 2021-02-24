/**
 * Document   : advertisements-controller.js
 * Version    : Jan 28, 2017
 * Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
 * Description: Angular js for advertisements.jsp
 */

(function(){
    var app = angular.module("mainApp",['ngSanitize']);
    
    /*news controller*/
    app.controller("newsSectionController",function($scope){
	$scope.searchNews = "";
    
	$scope.news = [
	    {title:"01 first",
		id:"w3-show-first",
		date:"January 20, 2017",
		href:"http://www.nba.com",
		hrefText:"Link to article",
		content:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse erat sapien, consequat non massa bibendum, blandit pharetra justo. Suspendisse potenti. Vestibulum euismod interdum rhoncus. Integer dictum tellus eros. Phasellus vel diam enim. Praesent pulvinar velit vel lobortis mattis. Vestibulum dolor lacus, mattis vitae iaculis eget, luctus non massa. Suspendisse venenatis libero vel nibh lacinia hendrerit luctus non mi. Aliquam venenatis convallis leo sed dictum. Duis eu quam sagittis, consequat tellus id, congue leo. Aenean leo erat, fringilla vitae facilisis a, mattis id sem. Nulla accumsan urna sed lectus efficitur mollis. In hac habitasse platea dictumst. Donec sit amet fermentum quam. Nunc finibus elementum placerat. Cras et dui non tortor vestibulum imperdiet sed sit amet sem. Nulla sed ultricies sem. Quisque iaculis interdum ex non rutrum. Aliquam facilisis imperdiet nunc quis pellentesque. Integer non nisl sit amet urna porttitor ultricies ut sed lorem. Pellentesque finibus lorem a lorem finibus consequat. In hac habitasse platea dictumst. Integer porttitor semper mi, gravida vulputate lacus volutpat at. Nunc vel ex metus. Maecenas porta pharetra nunc, quis maximus lectus rhoncus ut. Nunc suscipit in est vitae molestie. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aliquam erat volutpat. Praesent maximus tellus eu justo dictum ornare. Nullam aliquet nisi risus, gravida auctor libero viverra et. Nulla eu orci suscipit mi convallis mattis. In blandit finibus nisl, et tincidunt nulla feugiat sed. Quisque imperdiet est porttitor erat tincidunt auctor. Morbi elementum luctus nisl, ac vestibulum diam faucibus vel. Suspendisse dolor ante, laoreet vitae sagittis vel, elementum lobortis turpis. Fusce suscipit condimentum augue ac pharetra. Nulla et justo at magna finibus placerat. Fusce vel purus posuere, ultricies eros non, condimentum metus. Vestibulum id tincidunt arcu, ac rhoncus massa. Nullam massa odio, malesuada non arcu nec, ullamcorper dignissim ipsum. Nam lacinia sed magna et suscipit. Sed turpis nunc, ultricies ornare finibus sit amet, dignissim sed nisl. Vestibulum id leo tincidunt, mattis mauris ut, pharetra augue. Quisque vitae consequat lectus. Morbi eget ipsum odio. In vitae scelerisque erat. Etiam gravida lectus sit amet semper semper. In aliquam mattis justo, et lobortis purus dapibus at. Mauris mattis egestas ullamcorper. In et tortor odio. Proin vel tempor risus, a fringilla nulla. Nunc felis sapien, vehicula ut nibh consectetur, aliquet pellentesque mi. Quisque vel lacus nibh. Fusce sed ante et arcu ultricies dictum a eget lacus. Suspendisse tempus ut nibh ac posuere. Aliquam erat volutpat. Aliquam erat volutpat. Proin vestibulum, nibh et vestibulum malesuada, libero elit cursus sapien, eu lacinia eros nibh suscipit ipsum."},
	    {title:"02 second",
		id:"w3-show-second",
		date:"January 5, 2017",
		href:"http://www.nba.com",
		hrefText:"Link to article",
		content:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse erat sapien, consequat non massa bibendum, blandit pharetra justo. Suspendisse potenti. Vestibulum euismod interdum rhoncus. Integer dictum tellus eros. Phasellus vel diam enim. Praesent pulvinar velit vel lobortis mattis. Vestibulum dolor lacus, mattis vitae iaculis eget, luctus non massa. Suspendisse venenatis libero vel nibh lacinia hendrerit luctus non mi. Aliquam venenatis convallis leo sed dictum. Duis eu quam sagittis, consequat tellus id, congue leo. Aenean leo erat, fringilla vitae facilisis a, mattis id sem. Nulla accumsan urna sed lectus efficitur mollis. In hac habitasse platea dictumst. Donec sit amet fermentum quam. Nunc finibus elementum placerat. Cras et dui non tortor vestibulum imperdiet sed sit amet sem. Nulla sed ultricies sem. Quisque iaculis interdum ex non rutrum. Aliquam facilisis imperdiet nunc quis pellentesque. Integer non nisl sit amet urna porttitor ultricies ut sed lorem. Pellentesque finibus lorem a lorem finibus consequat. In hac habitasse platea dictumst. Integer porttitor semper mi, gravida vulputate lacus volutpat at. Nunc vel ex metus. Maecenas porta pharetra nunc, quis maximus lectus rhoncus ut. Nunc suscipit in est vitae molestie. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aliquam erat volutpat. Praesent maximus tellus eu justo dictum ornare. Nullam aliquet nisi risus, gravida auctor libero viverra et. Nulla eu orci suscipit mi convallis mattis. In blandit finibus nisl, et tincidunt nulla feugiat sed. Quisque imperdiet est porttitor erat tincidunt auctor. Morbi elementum luctus nisl, ac vestibulum diam faucibus vel. Suspendisse dolor ante, laoreet vitae sagittis vel, elementum lobortis turpis. Fusce suscipit condimentum augue ac pharetra. Nulla et justo at magna finibus placerat. Fusce vel purus posuere, ultricies eros non, condimentum metus. Vestibulum id tincidunt arcu, ac rhoncus massa. Nullam massa odio, malesuada non arcu nec, ullamcorper dignissim ipsum. Nam lacinia sed magna et suscipit. Sed turpis nunc, ultricies ornare finibus sit amet, dignissim sed nisl. Vestibulum id leo tincidunt, mattis mauris ut, pharetra augue. Quisque vitae consequat lectus. Morbi eget ipsum odio. In vitae scelerisque erat. Etiam gravida lectus sit amet semper semper. In aliquam mattis justo, et lobortis purus dapibus at. Mauris mattis egestas ullamcorper. In et tortor odio. Proin vel tempor risus, a fringilla nulla. Nunc felis sapien, vehicula ut nibh consectetur, aliquet pellentesque mi. Quisque vel lacus nibh. Fusce sed ante et arcu ultricies dictum a eget lacus. Suspendisse tempus ut nibh ac posuere. Aliquam erat volutpat. Aliquam erat volutpat. Proin vestibulum, nibh et vestibulum malesuada, libero elit cursus sapien, eu lacinia eros nibh suscipit ipsum."},
	    {title:"03 third",
		id:"w3-show-third",
		date:"November 1, 2016",
		href:"http://www.nba.com",
		hrefText:"Link to article",
		content:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse erat sapien, consequat non massa bibendum, blandit pharetra justo. Suspendisse potenti. Vestibulum euismod interdum rhoncus. Integer dictum tellus eros. Phasellus vel diam enim. Praesent pulvinar velit vel lobortis mattis. Vestibulum dolor lacus, mattis vitae iaculis eget, luctus non massa. Suspendisse venenatis libero vel nibh lacinia hendrerit luctus non mi. Aliquam venenatis convallis leo sed dictum. Duis eu quam sagittis, consequat tellus id, congue leo. Aenean leo erat, fringilla vitae facilisis a, mattis id sem. Nulla accumsan urna sed lectus efficitur mollis. In hac habitasse platea dictumst. Donec sit amet fermentum quam. Nunc finibus elementum placerat. Cras et dui non tortor vestibulum imperdiet sed sit amet sem. Nulla sed ultricies sem. Quisque iaculis interdum ex non rutrum. Aliquam facilisis imperdiet nunc quis pellentesque. Integer non nisl sit amet urna porttitor ultricies ut sed lorem. Pellentesque finibus lorem a lorem finibus consequat. In hac habitasse platea dictumst. Integer porttitor semper mi, gravida vulputate lacus volutpat at. Nunc vel ex metus. Maecenas porta pharetra nunc, quis maximus lectus rhoncus ut. Nunc suscipit in est vitae molestie. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aliquam erat volutpat. Praesent maximus tellus eu justo dictum ornare. Nullam aliquet nisi risus, gravida auctor libero viverra et. Nulla eu orci suscipit mi convallis mattis. In blandit finibus nisl, et tincidunt nulla feugiat sed. Quisque imperdiet est porttitor erat tincidunt auctor. Morbi elementum luctus nisl, ac vestibulum diam faucibus vel. Suspendisse dolor ante, laoreet vitae sagittis vel, elementum lobortis turpis. Fusce suscipit condimentum augue ac pharetra. Nulla et justo at magna finibus placerat. Fusce vel purus posuere, ultricies eros non, condimentum metus. Vestibulum id tincidunt arcu, ac rhoncus massa. Nullam massa odio, malesuada non arcu nec, ullamcorper dignissim ipsum. Nam lacinia sed magna et suscipit. Sed turpis nunc, ultricies ornare finibus sit amet, dignissim sed nisl. Vestibulum id leo tincidunt, mattis mauris ut, pharetra augue. Quisque vitae consequat lectus. Morbi eget ipsum odio. In vitae scelerisque erat. Etiam gravida lectus sit amet semper semper. In aliquam mattis justo, et lobortis purus dapibus at. Mauris mattis egestas ullamcorper. In et tortor odio. Proin vel tempor risus, a fringilla nulla. Nunc felis sapien, vehicula ut nibh consectetur, aliquet pellentesque mi. Quisque vel lacus nibh. Fusce sed ante et arcu ultricies dictum a eget lacus. Suspendisse tempus ut nibh ac posuere. Aliquam erat volutpat. Aliquam erat volutpat. Proin vestibulum, nibh et vestibulum malesuada, libero elit cursus sapien, eu lacinia eros nibh suscipit ipsum."},
	    {title:"04 fourth",
		id:"w3-show-fourth",
		date:"October 10, 2016",
		href:"http://www.nba.com",
		hrefText:"Link to article",
		content:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse erat sapien, consequat non massa bibendum, blandit pharetra justo. Suspendisse potenti. Vestibulum euismod interdum rhoncus. Integer dictum tellus eros. Phasellus vel diam enim. Praesent pulvinar velit vel lobortis mattis. Vestibulum dolor lacus, mattis vitae iaculis eget, luctus non massa. Suspendisse venenatis libero vel nibh lacinia hendrerit luctus non mi. Aliquam venenatis convallis leo sed dictum. Duis eu quam sagittis, consequat tellus id, congue leo. Aenean leo erat, fringilla vitae facilisis a, mattis id sem. Nulla accumsan urna sed lectus efficitur mollis. In hac habitasse platea dictumst. Donec sit amet fermentum quam. Nunc finibus elementum placerat. Cras et dui non tortor vestibulum imperdiet sed sit amet sem. Nulla sed ultricies sem. Quisque iaculis interdum ex non rutrum. Aliquam facilisis imperdiet nunc quis pellentesque. Integer non nisl sit amet urna porttitor ultricies ut sed lorem. Pellentesque finibus lorem a lorem finibus consequat. In hac habitasse platea dictumst. Integer porttitor semper mi, gravida vulputate lacus volutpat at. Nunc vel ex metus. Maecenas porta pharetra nunc, quis maximus lectus rhoncus ut. Nunc suscipit in est vitae molestie. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aliquam erat volutpat. Praesent maximus tellus eu justo dictum ornare. Nullam aliquet nisi risus, gravida auctor libero viverra et. Nulla eu orci suscipit mi convallis mattis. In blandit finibus nisl, et tincidunt nulla feugiat sed. Quisque imperdiet est porttitor erat tincidunt auctor. Morbi elementum luctus nisl, ac vestibulum diam faucibus vel. Suspendisse dolor ante, laoreet vitae sagittis vel, elementum lobortis turpis. Fusce suscipit condimentum augue ac pharetra. Nulla et justo at magna finibus placerat. Fusce vel purus posuere, ultricies eros non, condimentum metus. Vestibulum id tincidunt arcu, ac rhoncus massa. Nullam massa odio, malesuada non arcu nec, ullamcorper dignissim ipsum. Nam lacinia sed magna et suscipit. Sed turpis nunc, ultricies ornare finibus sit amet, dignissim sed nisl. Vestibulum id leo tincidunt, mattis mauris ut, pharetra augue. Quisque vitae consequat lectus. Morbi eget ipsum odio. In vitae scelerisque erat. Etiam gravida lectus sit amet semper semper. In aliquam mattis justo, et lobortis purus dapibus at. Mauris mattis egestas ullamcorper. In et tortor odio. Proin vel tempor risus, a fringilla nulla. Nunc felis sapien, vehicula ut nibh consectetur, aliquet pellentesque mi. Quisque vel lacus nibh. Fusce sed ante et arcu ultricies dictum a eget lacus. Suspendisse tempus ut nibh ac posuere. Aliquam erat volutpat. Aliquam erat volutpat. Proin vestibulum, nibh et vestibulum malesuada, libero elit cursus sapien, eu lacinia eros nibh suscipit ipsum."},
	];

	$scope.manageNewsAccordion = function(id){
	    var x = document.getElementById(id);
	      if (x.className.indexOf("w3-show") === -1) {
		  x.className += " w3-show";
		  x.previousElementSibling.className += " w3-red";
	      } else { 
		  x.className = x.className.replace(" w3-show", "");
		  x.previousElementSibling.className = 
		  x.previousElementSibling.className.replace(" w3-red", "");
	      }  
	};
	
	
    });

    /*promos controller*/
    app.controller("promosSectionController",function($scope){
	
	$scope.searchPromos = "";
    
	$scope.promos = [
	    {title:"01 first",
		id:"w3-show-six",
		datePosted:"January 20, 2017",
		dateExpired:"January 25, 2017",
		content:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse erat sapien, consequat non massa bibendum, blandit pharetra justo. Suspendisse potenti. Vestibulum euismod interdum rhoncus. Integer dictum tellus eros. Phasellus vel diam enim. Praesent pulvinar velit vel lobortis mattis. Vestibulum dolor lacus, mattis vitae iaculis eget, luctus non massa. Suspendisse venenatis libero vel nibh lacinia hendrerit luctus non mi. Aliquam venenatis convallis leo sed dictum. Duis eu quam sagittis, consequat tellus id, congue leo. Aenean leo erat, fringilla vitae facilisis a, mattis id sem. Nulla accumsan urna sed lectus efficitur mollis. In hac habitasse platea dictumst. Donec sit amet fermentum quam. Nunc finibus elementum placerat. Cras et dui non tortor vestibulum imperdiet sed sit amet sem. Nulla sed ultricies sem. Quisque iaculis interdum ex non rutrum. Aliquam facilisis imperdiet nunc quis pellentesque. Integer non nisl sit amet urna porttitor ultricies ut sed lorem. Pellentesque finibus lorem a lorem finibus consequat. In hac habitasse platea dictumst. Integer porttitor semper mi, gravida vulputate lacus volutpat at. Nunc vel ex metus. Maecenas porta pharetra nunc, quis maximus lectus rhoncus ut. Nunc suscipit in est vitae molestie. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aliquam erat volutpat. Praesent maximus tellus eu justo dictum ornare. Nullam aliquet nisi risus, gravida auctor libero viverra et. Nulla eu orci suscipit mi convallis mattis. In blandit finibus nisl, et tincidunt nulla feugiat sed. Quisque imperdiet est porttitor erat tincidunt auctor. Morbi elementum luctus nisl, ac vestibulum diam faucibus vel. Suspendisse dolor ante, laoreet vitae sagittis vel, elementum lobortis turpis. Fusce suscipit condimentum augue ac pharetra. Nulla et justo at magna finibus placerat. Fusce vel purus posuere, ultricies eros non, condimentum metus. Vestibulum id tincidunt arcu, ac rhoncus massa. Nullam massa odio, malesuada non arcu nec, ullamcorper dignissim ipsum. Nam lacinia sed magna et suscipit. Sed turpis nunc, ultricies ornare finibus sit amet, dignissim sed nisl. Vestibulum id leo tincidunt, mattis mauris ut, pharetra augue. Quisque vitae consequat lectus. Morbi eget ipsum odio. In vitae scelerisque erat. Etiam gravida lectus sit amet semper semper. In aliquam mattis justo, et lobortis purus dapibus at. Mauris mattis egestas ullamcorper. In et tortor odio. Proin vel tempor risus, a fringilla nulla. Nunc felis sapien, vehicula ut nibh consectetur, aliquet pellentesque mi. Quisque vel lacus nibh. Fusce sed ante et arcu ultricies dictum a eget lacus. Suspendisse tempus ut nibh ac posuere. Aliquam erat volutpat. Aliquam erat volutpat. Proin vestibulum, nibh et vestibulum malesuada, libero elit cursus sapien, eu lacinia eros nibh suscipit ipsum."},
	    {title:"02 second",
		id:"w3-show-seven",
		datePosted:"January 21, 2017",
		dateExpired:"February 26, 2017",
		content:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse erat sapien, consequat non massa bibendum, blandit pharetra justo. Suspendisse potenti. Vestibulum euismod interdum rhoncus. Integer dictum tellus eros. Phasellus vel diam enim. Praesent pulvinar velit vel lobortis mattis. Vestibulum dolor lacus, mattis vitae iaculis eget, luctus non massa. Suspendisse venenatis libero vel nibh lacinia hendrerit luctus non mi. Aliquam venenatis convallis leo sed dictum. Duis eu quam sagittis, consequat tellus id, congue leo. Aenean leo erat, fringilla vitae facilisis a, mattis id sem. Nulla accumsan urna sed lectus efficitur mollis. In hac habitasse platea dictumst. Donec sit amet fermentum quam. Nunc finibus elementum placerat. Cras et dui non tortor vestibulum imperdiet sed sit amet sem. Nulla sed ultricies sem. Quisque iaculis interdum ex non rutrum. Aliquam facilisis imperdiet nunc quis pellentesque. Integer non nisl sit amet urna porttitor ultricies ut sed lorem. Pellentesque finibus lorem a lorem finibus consequat. In hac habitasse platea dictumst. Integer porttitor semper mi, gravida vulputate lacus volutpat at. Nunc vel ex metus. Maecenas porta pharetra nunc, quis maximus lectus rhoncus ut. Nunc suscipit in est vitae molestie. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aliquam erat volutpat. Praesent maximus tellus eu justo dictum ornare. Nullam aliquet nisi risus, gravida auctor libero viverra et. Nulla eu orci suscipit mi convallis mattis. In blandit finibus nisl, et tincidunt nulla feugiat sed. Quisque imperdiet est porttitor erat tincidunt auctor. Morbi elementum luctus nisl, ac vestibulum diam faucibus vel. Suspendisse dolor ante, laoreet vitae sagittis vel, elementum lobortis turpis. Fusce suscipit condimentum augue ac pharetra. Nulla et justo at magna finibus placerat. Fusce vel purus posuere, ultricies eros non, condimentum metus. Vestibulum id tincidunt arcu, ac rhoncus massa. Nullam massa odio, malesuada non arcu nec, ullamcorper dignissim ipsum. Nam lacinia sed magna et suscipit. Sed turpis nunc, ultricies ornare finibus sit amet, dignissim sed nisl. Vestibulum id leo tincidunt, mattis mauris ut, pharetra augue. Quisque vitae consequat lectus. Morbi eget ipsum odio. In vitae scelerisque erat. Etiam gravida lectus sit amet semper semper. In aliquam mattis justo, et lobortis purus dapibus at. Mauris mattis egestas ullamcorper. In et tortor odio. Proin vel tempor risus, a fringilla nulla. Nunc felis sapien, vehicula ut nibh consectetur, aliquet pellentesque mi. Quisque vel lacus nibh. Fusce sed ante et arcu ultricies dictum a eget lacus. Suspendisse tempus ut nibh ac posuere. Aliquam erat volutpat. Aliquam erat volutpat. Proin vestibulum, nibh et vestibulum malesuada, libero elit cursus sapien, eu lacinia eros nibh suscipit ipsum."},
	    {title:"03 third",
		id:"w3-show-eight",
		datePosted:"January 22, 2017",
		dateExpired:"January 27, 2017",
		content:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse erat sapien, consequat non massa bibendum, blandit pharetra justo. Suspendisse potenti. Vestibulum euismod interdum rhoncus. Integer dictum tellus eros. Phasellus vel diam enim. Praesent pulvinar velit vel lobortis mattis. Vestibulum dolor lacus, mattis vitae iaculis eget, luctus non massa. Suspendisse venenatis libero vel nibh lacinia hendrerit luctus non mi. Aliquam venenatis convallis leo sed dictum. Duis eu quam sagittis, consequat tellus id, congue leo. Aenean leo erat, fringilla vitae facilisis a, mattis id sem. Nulla accumsan urna sed lectus efficitur mollis. In hac habitasse platea dictumst. Donec sit amet fermentum quam. Nunc finibus elementum placerat. Cras et dui non tortor vestibulum imperdiet sed sit amet sem. Nulla sed ultricies sem. Quisque iaculis interdum ex non rutrum. Aliquam facilisis imperdiet nunc quis pellentesque. Integer non nisl sit amet urna porttitor ultricies ut sed lorem. Pellentesque finibus lorem a lorem finibus consequat. In hac habitasse platea dictumst. Integer porttitor semper mi, gravida vulputate lacus volutpat at. Nunc vel ex metus. Maecenas porta pharetra nunc, quis maximus lectus rhoncus ut. Nunc suscipit in est vitae molestie. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aliquam erat volutpat. Praesent maximus tellus eu justo dictum ornare. Nullam aliquet nisi risus, gravida auctor libero viverra et. Nulla eu orci suscipit mi convallis mattis. In blandit finibus nisl, et tincidunt nulla feugiat sed. Quisque imperdiet est porttitor erat tincidunt auctor. Morbi elementum luctus nisl, ac vestibulum diam faucibus vel. Suspendisse dolor ante, laoreet vitae sagittis vel, elementum lobortis turpis. Fusce suscipit condimentum augue ac pharetra. Nulla et justo at magna finibus placerat. Fusce vel purus posuere, ultricies eros non, condimentum metus. Vestibulum id tincidunt arcu, ac rhoncus massa. Nullam massa odio, malesuada non arcu nec, ullamcorper dignissim ipsum. Nam lacinia sed magna et suscipit. Sed turpis nunc, ultricies ornare finibus sit amet, dignissim sed nisl. Vestibulum id leo tincidunt, mattis mauris ut, pharetra augue. Quisque vitae consequat lectus. Morbi eget ipsum odio. In vitae scelerisque erat. Etiam gravida lectus sit amet semper semper. In aliquam mattis justo, et lobortis purus dapibus at. Mauris mattis egestas ullamcorper. In et tortor odio. Proin vel tempor risus, a fringilla nulla. Nunc felis sapien, vehicula ut nibh consectetur, aliquet pellentesque mi. Quisque vel lacus nibh. Fusce sed ante et arcu ultricies dictum a eget lacus. Suspendisse tempus ut nibh ac posuere. Aliquam erat volutpat. Aliquam erat volutpat. Proin vestibulum, nibh et vestibulum malesuada, libero elit cursus sapien, eu lacinia eros nibh suscipit ipsum."},
	    {title:"04 fourth",
		id:"w3-show-nine",
		datePosted:"January 23, 2017",
		dateExpired:"January 28, 2017",
		content:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse erat sapien, consequat non massa bibendum, blandit pharetra justo. Suspendisse potenti. Vestibulum euismod interdum rhoncus. Integer dictum tellus eros. Phasellus vel diam enim. Praesent pulvinar velit vel lobortis mattis. Vestibulum dolor lacus, mattis vitae iaculis eget, luctus non massa. Suspendisse venenatis libero vel nibh lacinia hendrerit luctus non mi. Aliquam venenatis convallis leo sed dictum. Duis eu quam sagittis, consequat tellus id, congue leo. Aenean leo erat, fringilla vitae facilisis a, mattis id sem. Nulla accumsan urna sed lectus efficitur mollis. In hac habitasse platea dictumst. Donec sit amet fermentum quam. Nunc finibus elementum placerat. Cras et dui non tortor vestibulum imperdiet sed sit amet sem. Nulla sed ultricies sem. Quisque iaculis interdum ex non rutrum. Aliquam facilisis imperdiet nunc quis pellentesque. Integer non nisl sit amet urna porttitor ultricies ut sed lorem. Pellentesque finibus lorem a lorem finibus consequat. In hac habitasse platea dictumst. Integer porttitor semper mi, gravida vulputate lacus volutpat at. Nunc vel ex metus. Maecenas porta pharetra nunc, quis maximus lectus rhoncus ut. Nunc suscipit in est vitae molestie. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aliquam erat volutpat. Praesent maximus tellus eu justo dictum ornare. Nullam aliquet nisi risus, gravida auctor libero viverra et. Nulla eu orci suscipit mi convallis mattis. In blandit finibus nisl, et tincidunt nulla feugiat sed. Quisque imperdiet est porttitor erat tincidunt auctor. Morbi elementum luctus nisl, ac vestibulum diam faucibus vel. Suspendisse dolor ante, laoreet vitae sagittis vel, elementum lobortis turpis. Fusce suscipit condimentum augue ac pharetra. Nulla et justo at magna finibus placerat. Fusce vel purus posuere, ultricies eros non, condimentum metus. Vestibulum id tincidunt arcu, ac rhoncus massa. Nullam massa odio, malesuada non arcu nec, ullamcorper dignissim ipsum. Nam lacinia sed magna et suscipit. Sed turpis nunc, ultricies ornare finibus sit amet, dignissim sed nisl. Vestibulum id leo tincidunt, mattis mauris ut, pharetra augue. Quisque vitae consequat lectus. Morbi eget ipsum odio. In vitae scelerisque erat. Etiam gravida lectus sit amet semper semper. In aliquam mattis justo, et lobortis purus dapibus at. Mauris mattis egestas ullamcorper. In et tortor odio. Proin vel tempor risus, a fringilla nulla. Nunc felis sapien, vehicula ut nibh consectetur, aliquet pellentesque mi. Quisque vel lacus nibh. Fusce sed ante et arcu ultricies dictum a eget lacus. Suspendisse tempus ut nibh ac posuere. Aliquam erat volutpat. Aliquam erat volutpat. Proin vestibulum, nibh et vestibulum malesuada, libero elit cursus sapien, eu lacinia eros nibh suscipit ipsum."},
	    {title:"05 fifth",
		id:"w3-show-ten",
		datePosted:"January 24, 2017",
		dateExpired:"January 29, 2017",
		content:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse erat sapien, consequat non massa bibendum, blandit pharetra justo. Suspendisse potenti. Vestibulum euismod interdum rhoncus. Integer dictum tellus eros. Phasellus vel diam enim. Praesent pulvinar velit vel lobortis mattis. Vestibulum dolor lacus, mattis vitae iaculis eget, luctus non massa. Suspendisse venenatis libero vel nibh lacinia hendrerit luctus non mi. Aliquam venenatis convallis leo sed dictum. Duis eu quam sagittis, consequat tellus id, congue leo. Aenean leo erat, fringilla vitae facilisis a, mattis id sem. Nulla accumsan urna sed lectus efficitur mollis. In hac habitasse platea dictumst. Donec sit amet fermentum quam. Nunc finibus elementum placerat. Cras et dui non tortor vestibulum imperdiet sed sit amet sem. Nulla sed ultricies sem. Quisque iaculis interdum ex non rutrum. Aliquam facilisis imperdiet nunc quis pellentesque. Integer non nisl sit amet urna porttitor ultricies ut sed lorem. Pellentesque finibus lorem a lorem finibus consequat. In hac habitasse platea dictumst. Integer porttitor semper mi, gravida vulputate lacus volutpat at. Nunc vel ex metus. Maecenas porta pharetra nunc, quis maximus lectus rhoncus ut. Nunc suscipit in est vitae molestie. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aliquam erat volutpat. Praesent maximus tellus eu justo dictum ornare. Nullam aliquet nisi risus, gravida auctor libero viverra et. Nulla eu orci suscipit mi convallis mattis. In blandit finibus nisl, et tincidunt nulla feugiat sed. Quisque imperdiet est porttitor erat tincidunt auctor. Morbi elementum luctus nisl, ac vestibulum diam faucibus vel. Suspendisse dolor ante, laoreet vitae sagittis vel, elementum lobortis turpis. Fusce suscipit condimentum augue ac pharetra. Nulla et justo at magna finibus placerat. Fusce vel purus posuere, ultricies eros non, condimentum metus. Vestibulum id tincidunt arcu, ac rhoncus massa. Nullam massa odio, malesuada non arcu nec, ullamcorper dignissim ipsum. Nam lacinia sed magna et suscipit. Sed turpis nunc, ultricies ornare finibus sit amet, dignissim sed nisl. Vestibulum id leo tincidunt, mattis mauris ut, pharetra augue. Quisque vitae consequat lectus. Morbi eget ipsum odio. In vitae scelerisque erat. Etiam gravida lectus sit amet semper semper. In aliquam mattis justo, et lobortis purus dapibus at. Mauris mattis egestas ullamcorper. In et tortor odio. Proin vel tempor risus, a fringilla nulla. Nunc felis sapien, vehicula ut nibh consectetur, aliquet pellentesque mi. Quisque vel lacus nibh. Fusce sed ante et arcu ultricies dictum a eget lacus. Suspendisse tempus ut nibh ac posuere. Aliquam erat volutpat. Aliquam erat volutpat. Proin vestibulum, nibh et vestibulum malesuada, libero elit cursus sapien, eu lacinia eros nibh suscipit ipsum."}
	];
	
	$scope.managePromosAccordion = function(id){
	      var x = document.getElementById(id);
		if (x.className.indexOf("w3-show") === -1) {
		    x.className += " w3-show";
		    x.previousElementSibling.className += " w3-red";
		} else { 
		    x.className = x.className.replace(" w3-show", "");
		    x.previousElementSibling.className = 
		    x.previousElementSibling.className.replace(" w3-red", "");
		}  
	    };
	
	/*toggles the ng-show for application form on-click*/
	$scope.toggleApplyForm=function (){
	    if($scope.applyForm===true)		$scope.applyForm=false;
	    else if($scope.applyForm===false)	$scope.applyForm=true;
	    else				$scope.applyForm=true;
	};
	
	/*changes the text for apply form*/
	$scope.$watch('applyForm',function (){
	    $scope.ApplyPromoBtn=$scope.applyForm ? "Close form":"Apply for Promo";
	});
//	$scope.applyForm = false;	//ng-show
	
    });
    
    /*career controller*/
    app.controller("careerSectionController",function($scope,$http){
	$scope.sortOrder = "";
	$scope.searchCareer = "";
	$scope.sortReverse = null;
	$scope.sortType="";
	
	$scope.allCareerTable=false; //ng-hide
	$scope.allCareerDetails=false; //ng-show
	
	$http({
	    method: "POST",
	    url: "CareerJSON"
	}).then(function mySuccess(response){
	    $scope.careers=response.data;
	},function myError(response){
	    $scope.careers=response.statusText;
	});
    
	/*makes sure that each time, editTips is reset before it takes in another value*/	
	$scope.editPromos={};
	
	/*Sets the sort order value for sortOrder*/
	$scope.$watch('sortReverse',function (){
	    $scope.sortOrder = $scope.sortReverse?"Descending":
		    $scope.sortReverse===null?"":"Ascending";
	});
	
	$scope.getDetail = function(data){

	    if($scope.allCareerTable===false){ 
		$scope.allCareerTable=true;	//ng-hide
		$scope.allCareerDetails=true;	//ng-show
		
		$scope.detail_careerID=data.id;
		$scope.detail_careerTitle=data.title;
		$scope.detail_careerCategory=data.category;
		$scope.detail_careerType=data.employmentType;
		$scope.detail_careerPostingDate=data.datePosted;
		$scope.detail_careerClosingDate=data.closingDate;
		$scope.detail_careerRequirements=data.detail;
	    }
	};
	
	$scope.cancelSubmit = function (){
	    if($scope.allCareerDetails===true){
		$scope.allCareerDetails=false;	//ng-show		
		$scope.allCareerTable=false;	//ng-hide
	    }
	};
	
    });
    
    /*intern controller*/
    app.controller("internSectionController",function($scope,$http){
	$scope.searchInternships = "";
	$scope.sortOrder = "";
	$scope.sortReverse = null;
	$scope.sortType="";
	
	$scope.allInternTable=false; //ng-hide
	$scope.allInternDetails=false; //ng-show
    
	$http({
	    method: "POST",
	    url: "InternJSON"
	}).then(function mySuccess(response){
	    $scope.interns=response.data;
	},function myError(response){
	    $scope.careers=response.statusText;
	});	
	
	/*makes sure that each time, editInternData is reset before it takes in another value*/	
	$scope.editInternData={};
	
	/*Sets the sort order value for sortOrder*/
	$scope.$watch('sortReverse',function (){
	    $scope.sortOrder = $scope.sortReverse?"Descending":
		    $scope.sortReverse===null?"":"Ascending";
	});
	
	
	$scope.getDetail = function(data){
	    if($scope.allInternTable===false){ 
		$scope.allInternTable=true;	//ng-hide
		$scope.allInternDetails=true;	//ng-show
		
	    $scope.detail_internID=data.id;
	    $scope.detail_internTitle=data.title;
	    $scope.detail_internCategory=data.category;
	    $scope.detail_internType=data.employmentType;
	    $scope.detail_internDatePosted=data.datePosted;
	    $scope.detail_internDateClosed=data.closingDate;
	    $scope.detail_InternRequirements=data.detail;
	    }
	};
	
	$scope.cancelSubmit = function (){
	    if($scope.allInternDetails===true){
		$scope.allInternDetails=false;	//ng-show		
		$scope.allInternTable=false;	//ng-hide
	    }
	};
	
    });
    
    /*volunteer controller*/
    app.controller("volunteerSectionController",function($scope){
	$scope.searchVolunteer = "";
	$scope.sortOrder = "";
	$scope.sortReverse = null;
	$scope.sortType="";
	
	$scope.allvolunteerTable=false; //ng-hide
	$scope.allvolunteerDetails=false; //ng-show
    
	$scope.volunteers = [
	    {id:"w3-show-career-one",
		title:"Software developer",
		category:"ITSD",
		employmentType:"temporary",
		datePosted:"January 20, 2017",
		closingDate:"January 28, 2017",
		detail:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse erat sapien, consequat non massa bibendum, blandit pharetra justo. Suspendisse potenti. Vestibulum euismod interdum rhoncus. Integer dictum tellus eros. Phasellus vel diam enim. Praesent pulvinar velit vel lobortis mattis. Vestibulum dolor lacus, mattis vitae iaculis eget, luctus non massa. Suspendisse venenatis libero vel nibh lacinia hendrerit luctus non mi. Aliquam venenatis convallis leo sed dictum. Duis eu quam sagittis, consequat tellus id, congue leo. Aenean leo erat, fringilla vitae facilisis a, mattis id sem. Nulla accumsan urna sed lectus efficitur mollis. In hac habitasse platea dictumst. Donec sit amet fermentum quam. Nunc finibus elementum placerat. Cras et dui non tortor vestibulum imperdiet sed sit amet sem. Nulla sed ultricies sem. Quisque iaculis interdum ex non rutrum. Aliquam facilisis imperdiet nunc quis pellentesque. Integer non nisl sit amet urna porttitor ultricies ut sed lorem. Pellentesque finibus lorem a lorem finibus consequat. In hac habitasse platea dictumst. Integer porttitor semper mi, gravida vulputate lacus volutpat at. Nunc vel ex metus. Maecenas porta pharetra nunc, quis maximus lectus rhoncus ut. Nunc suscipit in est vitae molestie. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aliquam erat volutpat. Praesent maximus tellus eu justo dictum ornare. Nullam aliquet nisi risus, gravida auctor libero viverra et. Nulla eu orci suscipit mi convallis mattis. In blandit finibus nisl, et tincidunt nulla feugiat sed. Quisque imperdiet est porttitor erat tincidunt auctor. Morbi elementum luctus nisl, ac vestibulum diam faucibus vel. Suspendisse dolor ante, laoreet vitae sagittis vel, elementum lobortis turpis. Fusce suscipit condimentum augue ac pharetra. Nulla et justo at magna finibus placerat. Fusce vel purus posuere, ultricies eros non, condimentum metus. Vestibulum id tincidunt arcu, ac rhoncus massa. Nullam massa odio, malesuada non arcu nec, ullamcorper dignissim ipsum. Nam lacinia sed magna et suscipit. Sed turpis nunc, ultricies ornare finibus sit amet, dignissim sed nisl. Vestibulum id leo tincidunt, mattis mauris ut, pharetra augue. Quisque vitae consequat lectus. Morbi eget ipsum odio. In vitae scelerisque erat. Etiam gravida lectus sit amet semper semper. In aliquam mattis justo, et lobortis purus dapibus at. Mauris mattis egestas ullamcorper. In et tortor odio. Proin vel tempor risus, a fringilla nulla. Nunc felis sapien, vehicula ut nibh consectetur, aliquet pellentesque mi. Quisque vel lacus nibh. Fusce sed ante et arcu ultricies dictum a eget lacus. Suspendisse tempus ut nibh ac posuere. Aliquam erat volutpat. Aliquam erat volutpat. Proin vestibulum, nibh et vestibulum malesuada, libero elit cursus sapien, eu lacinia eros nibh suscipit ipsum."},
	    {id:"w3-show-career-two",
		title:"Software developer",
		category:"ITSD",
		employmentType:"temporary",
		datePosted:"January 20, 2017",
		closingDate:"January 28, 2017",
		detail:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse erat sapien, consequat non massa bibendum, blandit pharetra justo. Suspendisse potenti. Vestibulum euismod interdum rhoncus. Integer dictum tellus eros. Phasellus vel diam enim. Praesent pulvinar velit vel lobortis mattis. Vestibulum dolor lacus, mattis vitae iaculis eget, luctus non massa. Suspendisse venenatis libero vel nibh lacinia hendrerit luctus non mi. Aliquam venenatis convallis leo sed dictum. Duis eu quam sagittis, consequat tellus id, congue leo. Aenean leo erat, fringilla vitae facilisis a, mattis id sem. Nulla accumsan urna sed lectus efficitur mollis. In hac habitasse platea dictumst. Donec sit amet fermentum quam. Nunc finibus elementum placerat. Cras et dui non tortor vestibulum imperdiet sed sit amet sem. Nulla sed ultricies sem. Quisque iaculis interdum ex non rutrum. Aliquam facilisis imperdiet nunc quis pellentesque. Integer non nisl sit amet urna porttitor ultricies ut sed lorem. Pellentesque finibus lorem a lorem finibus consequat. In hac habitasse platea dictumst. Integer porttitor semper mi, gravida vulputate lacus volutpat at. Nunc vel ex metus. Maecenas porta pharetra nunc, quis maximus lectus rhoncus ut. Nunc suscipit in est vitae molestie. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aliquam erat volutpat. Praesent maximus tellus eu justo dictum ornare. Nullam aliquet nisi risus, gravida auctor libero viverra et. Nulla eu orci suscipit mi convallis mattis. In blandit finibus nisl, et tincidunt nulla feugiat sed. Quisque imperdiet est porttitor erat tincidunt auctor. Morbi elementum luctus nisl, ac vestibulum diam faucibus vel. Suspendisse dolor ante, laoreet vitae sagittis vel, elementum lobortis turpis. Fusce suscipit condimentum augue ac pharetra. Nulla et justo at magna finibus placerat. Fusce vel purus posuere, ultricies eros non, condimentum metus. Vestibulum id tincidunt arcu, ac rhoncus massa. Nullam massa odio, malesuada non arcu nec, ullamcorper dignissim ipsum. Nam lacinia sed magna et suscipit. Sed turpis nunc, ultricies ornare finibus sit amet, dignissim sed nisl. Vestibulum id leo tincidunt, mattis mauris ut, pharetra augue. Quisque vitae consequat lectus. Morbi eget ipsum odio. In vitae scelerisque erat. Etiam gravida lectus sit amet semper semper. In aliquam mattis justo, et lobortis purus dapibus at. Mauris mattis egestas ullamcorper. In et tortor odio. Proin vel tempor risus, a fringilla nulla. Nunc felis sapien, vehicula ut nibh consectetur, aliquet pellentesque mi. Quisque vel lacus nibh. Fusce sed ante et arcu ultricies dictum a eget lacus. Suspendisse tempus ut nibh ac posuere. Aliquam erat volutpat. Aliquam erat volutpat. Proin vestibulum, nibh et vestibulum malesuada, libero elit cursus sapien, eu lacinia eros nibh suscipit ipsum."},
	    {id:"w3-show-career-three",
		title:"Software developer",
		category:"ITSD",
		employmentType:"temporary",
		datePosted:"January 20, 2017",
		closingDate:"January 28, 2017",
		detail:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse erat sapien, consequat non massa bibendum, blandit pharetra justo. Suspendisse potenti. Vestibulum euismod interdum rhoncus. Integer dictum tellus eros. Phasellus vel diam enim. Praesent pulvinar velit vel lobortis mattis. Vestibulum dolor lacus, mattis vitae iaculis eget, luctus non massa. Suspendisse venenatis libero vel nibh lacinia hendrerit luctus non mi. Aliquam venenatis convallis leo sed dictum. Duis eu quam sagittis, consequat tellus id, congue leo. Aenean leo erat, fringilla vitae facilisis a, mattis id sem. Nulla accumsan urna sed lectus efficitur mollis. In hac habitasse platea dictumst. Donec sit amet fermentum quam. Nunc finibus elementum placerat. Cras et dui non tortor vestibulum imperdiet sed sit amet sem. Nulla sed ultricies sem. Quisque iaculis interdum ex non rutrum. Aliquam facilisis imperdiet nunc quis pellentesque. Integer non nisl sit amet urna porttitor ultricies ut sed lorem. Pellentesque finibus lorem a lorem finibus consequat. In hac habitasse platea dictumst. Integer porttitor semper mi, gravida vulputate lacus volutpat at. Nunc vel ex metus. Maecenas porta pharetra nunc, quis maximus lectus rhoncus ut. Nunc suscipit in est vitae molestie. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aliquam erat volutpat. Praesent maximus tellus eu justo dictum ornare. Nullam aliquet nisi risus, gravida auctor libero viverra et. Nulla eu orci suscipit mi convallis mattis. In blandit finibus nisl, et tincidunt nulla feugiat sed. Quisque imperdiet est porttitor erat tincidunt auctor. Morbi elementum luctus nisl, ac vestibulum diam faucibus vel. Suspendisse dolor ante, laoreet vitae sagittis vel, elementum lobortis turpis. Fusce suscipit condimentum augue ac pharetra. Nulla et justo at magna finibus placerat. Fusce vel purus posuere, ultricies eros non, condimentum metus. Vestibulum id tincidunt arcu, ac rhoncus massa. Nullam massa odio, malesuada non arcu nec, ullamcorper dignissim ipsum. Nam lacinia sed magna et suscipit. Sed turpis nunc, ultricies ornare finibus sit amet, dignissim sed nisl. Vestibulum id leo tincidunt, mattis mauris ut, pharetra augue. Quisque vitae consequat lectus. Morbi eget ipsum odio. In vitae scelerisque erat. Etiam gravida lectus sit amet semper semper. In aliquam mattis justo, et lobortis purus dapibus at. Mauris mattis egestas ullamcorper. In et tortor odio. Proin vel tempor risus, a fringilla nulla. Nunc felis sapien, vehicula ut nibh consectetur, aliquet pellentesque mi. Quisque vel lacus nibh. Fusce sed ante et arcu ultricies dictum a eget lacus. Suspendisse tempus ut nibh ac posuere. Aliquam erat volutpat. Aliquam erat volutpat. Proin vestibulum, nibh et vestibulum malesuada, libero elit cursus sapien, eu lacinia eros nibh suscipit ipsum."},
	    {id:"w3-show-career-four",
		title:"Software developer",
		category:"ITSD",
		employmentType:"temporary",
		datePosted:"January 20, 2017",
		closingDate:"January 28, 2017",
		detail:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse erat sapien, consequat non massa bibendum, blandit pharetra justo. Suspendisse potenti. Vestibulum euismod interdum rhoncus. Integer dictum tellus eros. Phasellus vel diam enim. Praesent pulvinar velit vel lobortis mattis. Vestibulum dolor lacus, mattis vitae iaculis eget, luctus non massa. Suspendisse venenatis libero vel nibh lacinia hendrerit luctus non mi. Aliquam venenatis convallis leo sed dictum. Duis eu quam sagittis, consequat tellus id, congue leo. Aenean leo erat, fringilla vitae facilisis a, mattis id sem. Nulla accumsan urna sed lectus efficitur mollis. In hac habitasse platea dictumst. Donec sit amet fermentum quam. Nunc finibus elementum placerat. Cras et dui non tortor vestibulum imperdiet sed sit amet sem. Nulla sed ultricies sem. Quisque iaculis interdum ex non rutrum. Aliquam facilisis imperdiet nunc quis pellentesque. Integer non nisl sit amet urna porttitor ultricies ut sed lorem. Pellentesque finibus lorem a lorem finibus consequat. In hac habitasse platea dictumst. Integer porttitor semper mi, gravida vulputate lacus volutpat at. Nunc vel ex metus. Maecenas porta pharetra nunc, quis maximus lectus rhoncus ut. Nunc suscipit in est vitae molestie. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aliquam erat volutpat. Praesent maximus tellus eu justo dictum ornare. Nullam aliquet nisi risus, gravida auctor libero viverra et. Nulla eu orci suscipit mi convallis mattis. In blandit finibus nisl, et tincidunt nulla feugiat sed. Quisque imperdiet est porttitor erat tincidunt auctor. Morbi elementum luctus nisl, ac vestibulum diam faucibus vel. Suspendisse dolor ante, laoreet vitae sagittis vel, elementum lobortis turpis. Fusce suscipit condimentum augue ac pharetra. Nulla et justo at magna finibus placerat. Fusce vel purus posuere, ultricies eros non, condimentum metus. Vestibulum id tincidunt arcu, ac rhoncus massa. Nullam massa odio, malesuada non arcu nec, ullamcorper dignissim ipsum. Nam lacinia sed magna et suscipit. Sed turpis nunc, ultricies ornare finibus sit amet, dignissim sed nisl. Vestibulum id leo tincidunt, mattis mauris ut, pharetra augue. Quisque vitae consequat lectus. Morbi eget ipsum odio. In vitae scelerisque erat. Etiam gravida lectus sit amet semper semper. In aliquam mattis justo, et lobortis purus dapibus at. Mauris mattis egestas ullamcorper. In et tortor odio. Proin vel tempor risus, a fringilla nulla. Nunc felis sapien, vehicula ut nibh consectetur, aliquet pellentesque mi. Quisque vel lacus nibh. Fusce sed ante et arcu ultricies dictum a eget lacus. Suspendisse tempus ut nibh ac posuere. Aliquam erat volutpat. Aliquam erat volutpat. Proin vestibulum, nibh et vestibulum malesuada, libero elit cursus sapien, eu lacinia eros nibh suscipit ipsum."},
	    {id:"w3-show-career-five",
		title:"Software developer",
		category:"ITSD",
		employmentType:"temporary",
		datePosted:"January 20, 2017",
		closingDate:"January 28, 2017",
		detail:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse erat sapien, consequat non massa bibendum, blandit pharetra justo. Suspendisse potenti. Vestibulum euismod interdum rhoncus. Integer dictum tellus eros. Phasellus vel diam enim. Praesent pulvinar velit vel lobortis mattis. Vestibulum dolor lacus, mattis vitae iaculis eget, luctus non massa. Suspendisse venenatis libero vel nibh lacinia hendrerit luctus non mi. Aliquam venenatis convallis leo sed dictum. Duis eu quam sagittis, consequat tellus id, congue leo. Aenean leo erat, fringilla vitae facilisis a, mattis id sem. Nulla accumsan urna sed lectus efficitur mollis. In hac habitasse platea dictumst. Donec sit amet fermentum quam. Nunc finibus elementum placerat. Cras et dui non tortor vestibulum imperdiet sed sit amet sem. Nulla sed ultricies sem. Quisque iaculis interdum ex non rutrum. Aliquam facilisis imperdiet nunc quis pellentesque. Integer non nisl sit amet urna porttitor ultricies ut sed lorem. Pellentesque finibus lorem a lorem finibus consequat. In hac habitasse platea dictumst. Integer porttitor semper mi, gravida vulputate lacus volutpat at. Nunc vel ex metus. Maecenas porta pharetra nunc, quis maximus lectus rhoncus ut. Nunc suscipit in est vitae molestie. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aliquam erat volutpat. Praesent maximus tellus eu justo dictum ornare. Nullam aliquet nisi risus, gravida auctor libero viverra et. Nulla eu orci suscipit mi convallis mattis. In blandit finibus nisl, et tincidunt nulla feugiat sed. Quisque imperdiet est porttitor erat tincidunt auctor. Morbi elementum luctus nisl, ac vestibulum diam faucibus vel. Suspendisse dolor ante, laoreet vitae sagittis vel, elementum lobortis turpis. Fusce suscipit condimentum augue ac pharetra. Nulla et justo at magna finibus placerat. Fusce vel purus posuere, ultricies eros non, condimentum metus. Vestibulum id tincidunt arcu, ac rhoncus massa. Nullam massa odio, malesuada non arcu nec, ullamcorper dignissim ipsum. Nam lacinia sed magna et suscipit. Sed turpis nunc, ultricies ornare finibus sit amet, dignissim sed nisl. Vestibulum id leo tincidunt, mattis mauris ut, pharetra augue. Quisque vitae consequat lectus. Morbi eget ipsum odio. In vitae scelerisque erat. Etiam gravida lectus sit amet semper semper. In aliquam mattis justo, et lobortis purus dapibus at. Mauris mattis egestas ullamcorper. In et tortor odio. Proin vel tempor risus, a fringilla nulla. Nunc felis sapien, vehicula ut nibh consectetur, aliquet pellentesque mi. Quisque vel lacus nibh. Fusce sed ante et arcu ultricies dictum a eget lacus. Suspendisse tempus ut nibh ac posuere. Aliquam erat volutpat. Aliquam erat volutpat. Proin vestibulum, nibh et vestibulum malesuada, libero elit cursus sapien, eu lacinia eros nibh suscipit ipsum."}
	];
	
	/*makes sure that each time, editVolunteerData is reset before it takes in another value*/	
	$scope.editVolunteerData={};
	
	/*Sets the sort order value for sortOrder*/
	$scope.$watch('sortReverse',function (){
	    $scope.sortOrder = $scope.sortReverse?"Descending":
		    $scope.sortReverse===null?"":"Ascending";
	});
	
	
	$scope.getDetail = function(data){
	    if($scope.allvolunteerTable===false){ 
		$scope.allvolunteerTable=true;		//ng-hide
		$scope.allvolunteerDetails=true;	//ng-show
		
	    $scope.detail_volunteerID=data.id;
	    $scope.detail_volunteerTitle=data.title;
	    $scope.detail_volunteerCategory=data.category;
	    $scope.detail_volunteerType=data.employmentType;
	    $scope.detail_volunteerDatePosted=data.datePosted;
	    $scope.detail_volunteerDateClosed=data.closingDate;
	    $scope.detail_volunteerRequirements=data.detail;
	    }
	};
	
	$scope.cancelSubmit = function (){
	    if($scope.allvolunteerDetails===true){
		$scope.allvolunteerDetails=false;	//ng-show		
		$scope.allvolunteerTable=false;		//ng-hide
	    }
	};
    });
    
}());
