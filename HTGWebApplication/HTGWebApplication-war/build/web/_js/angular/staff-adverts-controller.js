/**
 * Document   : staff-adverts-controller.js
 * Version    : Jan 28, 2017
 * Author     : Marufa Chowdhury, Rachel Bautista, Mamadou Diallo, Tuan L. Truong, Rodney Vencio
 * Description: Angular js for managing advertisements.jsp
 */

(function(){
    var app = angular.module("mainApp",['ngSanitize']);
    
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
	
	/*changes the text for Add news button*/
	$scope.$watch('showNewsBlank',function (){
	    $scope.addBtnTxtshowNewsBlankToggle=$scope.showNewsBlank ? "Close Form":"Add Nutrition News";
	});
	
	/*initially hides the add tips blank input fields until they're called*/
	$scope.newsAddForm=false;
	
	/*makes sure that each time, editNews is reset before it takes in another value*/	
	$scope.editNews={};
	
	$scope.modify = function(news){
	    $scope.editNews[news.id] = true;
	};
	
	$scope.back=function (news){
	  $scope.editNews[news.id] = false;
	};
	
    });

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
	
	/*changes the text for Add tips button*/
	$scope.$watch('showPromosBlank',function (){
	    $scope.addBtnTxtshowPromosBlankToggle=$scope.showPromosBlank ? "Close Form":"Add Promotion";
	});
	
	/*initially hides the add promos blank input fields until they're called*/
	$scope.showPromosBlank=false;
	
	/*makes sure that each time, editTips is reset before it takes in another value*/	
	$scope.editPromos={};
	
	$scope.modify = function(promos){
	    $scope.editPromos[promos.id] = true;
	};
	
	$scope.back=function (promos){
	  $scope.editPromos[promos.id] = false;
	};
	
    });
    
    app.controller("careerSectionController",function($scope,$http){
	$scope.sortType = "";
	$scope.sortOrder="";
	$scope.searchCareer="";
	$scope.sortReverse = null;
	
    $http({
	    method: "POST",
	    url: "CareerJSON"
	}).then(function mySuccess(response){
	    $scope.careers=response.data;
	},function myError(response){
	    $scope.careers=response.statusText;
	});
    
	/*changes the text for Add tips button*/
	$scope.$watch('showPositionBlank',function (){
	    $scope.addBtnTxtshowPositionBlankToggle=$scope.showPositionBlank ? "Close Form":"Add Position";
	});
	
	/*initially hides the add promos blank input fields until they're called*/
	$scope.showPositionBlank=false;
	
	/*makes sure that each time, editCareerData is reset before it takes in another value*/	
	$scope.editCareerData={};
	
	/*Sets the sort order value for sortOrder*/
	$scope.$watch('sortReverse',function (){
	    $scope.sortOrder = $scope.sortReverse?"Descending":
	    $scope.sortReverse===null?"":"Ascending";
	});
	
	$scope.getDetail = function(data){
	    $scope.detail_careerID=data.CAREER_ID;
	    $scope.detail_careerTitle=data.POSITION_TITLE;
	    $scope.detail_careerCategory=data.POSITION_CATEGORY;
	    $scope.detail_careerType=data.EMPLOYMENT_TYPE;
	    $scope.detail_careerDatePosted=data.DATE_POSTED;
	    $scope.detail_careerDateClosed=data.DATE_CLOSED;
	    $scope.detail_careerArticle=data.REQUIREMENTS;

	    $('#modal-career-details-popup').modal();
	};
    });
    
    app.controller("internSectionController",function($scope,$http){
	$scope.sortType = "";
	$scope.sortOrder="";
	$scope.searchInternships="";
	$scope.sortReverse = null;
    
	$http({
	    method: "POST",
	    url: "InternJSON"
	}).then(function mySuccess(response){
	    $scope.interns=response.data;
	},function myError(response){
	    $scope.careers=response.statusText;
	});	
	
	/*changes the text for Add tips button*/
	$scope.$watch('showInternBlank',function (){
	    $scope.addBtnTxtshowInternBlankToggle=$scope.showInternBlank ? "Close Form":"Add Internship";
	});
	
	/*initially hides the add promos blank input fields until they're called*/
	$scope.showInternBlank=false;
	
	/*makes sure that each time, editCareerData is reset before it takes in another value*/	
	$scope.editInternData={};
	
	/*Sets the sort order value for sortOrder*/
	$scope.$watch('sortReverse',function (){
	    $scope.sortOrder = $scope.sortReverse?"Descending":
	    $scope.sortReverse===null?"":"Ascending";
	});
	
	$scope.getDetail = function(data){
	    $scope.detail_internID=data.INTERN_ID;
	    $scope.detail_internTitle=data.POSITION_TITLE;
	    $scope.detail_internCategory=data.POSITION_CATEGORY;
	    $scope.detail_internType=data.EMPLOYMENT_TYPE;
	    $scope.detail_internDatePosted=data.DATE_POSTED;
	    $scope.detail_internDateClosed=data.DATE_CLOSED;
	    $scope.detail_internArticle=data.REQUIREMENTS;
	    
	    $('#modal-intern-details-popup').modal();
	};
    });
    
    app.controller("volunteerSectionController",function($scope){
	$scope.sortType = "";
	$scope.sortOrder="";
	$scope.searchVolunteer="";
	$scope.sortReverse = null;
    
	$scope.volunteers = [
	    {id:"w3-show-career-one",
		title:"Software developer",
		category:"ITSD",
		employmentType:"temporary",
		datePosted:"January 20, 2017",
		closingDate:"January 28, 2017",
		detail:"no content yet"},
	    {id:"w3-show-career-two",
		title:"Software developer",
		category:"ITSD",
		employmentType:"temporary",
		datePosted:"January 20, 2017",
		closingDate:"January 28, 2017",
		detail:"no content yet"},
	    {id:"w3-show-career-three",
		title:"Software developer",
		category:"ITSD",
		employmentType:"temporary",
		datePosted:"January 20, 2017",
		closingDate:"January 28, 2017",
		detail:"no content yet"},
	    {id:"w3-show-career-four",
		title:"Software developer",
		category:"ITSD",
		employmentType:"temporary",
		datePosted:"January 20, 2017",
		closingDate:"January 28, 2017",
		detail:"no content yet"},
	    {id:"w3-show-career-five",
		title:"Software developer",
		category:"ITSD",
		employmentType:"temporary",
		datePosted:"January 20, 2017",
		closingDate:"January 28, 2017",
		detail:"no content yet"}
	];
	
	/*changes the text for Add tips button*/
	$scope.$watch('showVolunteerBlank',function (){
	    $scope.addBtnTxtshowVolunteerBlankToggle=$scope.showVolunteerBlank ? "Close Form":"Add Volunteer Position";
	});
	
	/*initially hides the add promos blank input fields until they're called*/
	$scope.showVolunteerBlank=false;
	
	/*makes sure that each time, editCareerData is reset before it takes in another value*/	
	$scope.editVolunteerData={};
	
	/*Sets the sort order value for sortOrder*/
	$scope.$watch('sortReverse',function (){
	    $scope.sortOrder = $scope.sortReverse?"Descending":
	    $scope.sortReverse===null?"":"Ascending";
	});
	
	$scope.getDetail = function(data){
	    $scope.detail_volunteerTitle=data.title;
	    $scope.detail_volunteerCategory=data.category;
	    $scope.detail_volunteerType=data.employmentType;
	    $scope.detail_volunteerDatePosted=data.datePosted;
	    $scope.detail_volunteerDateClosed=data.closingDate;
	    $scope.detail_volunteerArticle=data.detail;
	    
	    $('#modal-volunteer-details-popup').modal();
	};
    });
    
}());


