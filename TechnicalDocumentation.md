



--------------
# Frontend 

------------
### Overview

The frontend of the application follows the generic Ruby on Rails project structure. All HTML files are located in /app/views. Each distinct view has a folder with a name corresponding to the name of the controller for that view. The javascript/coffeescript files associated with each view are located in /app/assets/javascript.

Another general guideline is the structure of the html files within these folders. For any view relating to tables (businesses, communities, investor_prefs, etc), the index.html.erb file contains the table element as well as the search fields. The index.json.jbuilder allows the corresponding controller to pass data to the index html file. The page for adding an entry to these tables is located within the same folder and is called new.html.erb. This isn't a technical rule, but is the recommended structure. So for instance, the page for adding a new community is written in 'app/views/communities/new.html.erb'. Similarly, the show.html.erb file is the page that displays more information about an individual entry in the table. Then, the _form.html.erb file contains the html specifying the input fields to create a new entry. Lastly, edit.html.erb is the page to edit individual entries of the table. 

So in general, each view relating to tables will have the following files:
* index.html.erb
* index.json.jbuilder
* show.html.erb
* new.html.erb
    * _form.html.erb
* edit.html.erb


------------
### Splash Screen and Login


------------
### Home

<<<<<<< HEAD
###### Strucutre: The outline of the home page consists of a **navbar** on top, and a **container** directly under that encloses all the other componenets.
=======
######Visual Structure: The outline of the home page consists of a **navbar** on top, and a **container** directly under that encloses all the other componenets.
>>>>>>> a28d7bfb61ea74384a940560eb7962fef5c77266
Within this larger container, there are two columns. One holds the Tables Panel and Links Panel, and the other holds the Tables. On desktop, these columns are separated horizontally. On mobile, the columns stretch out to the width of the screen and become separated vertically.


###### Navbar
The navbar contains the links to the home page, zillow\_prefs page, template\_send page, and user preferences page. It also contains a link to logout.

<<<<<<< HEAD
###### Tables Panel
=======
######Table Picker Panel
>>>>>>> a28d7bfb61ea74384a940560eb7962fef5c77266
This is the panel locat

###### Links Panel

<<<<<<< HEAD
###### Tables
=======
######Tables Panel


######Modal View
This is an element located outside of the container and is 
empty and hidden by default. There's a script within the 
index.html.erb file that takes allows for any html page to 
be loaded into this modal view and opened. The following script 
loads the element with id='BODY_CONTENT' from the html file located
at the given href into the modal view:
```javascript
    $('.href-button').on('click', function(e){
      e.stopPropagation();
      var t = e.target;
      var href = $(t).data('id')? $(t).data('id') : $(t.parentNode).data('id');
      $('#hrefModalContent').load(href + ' #BODY_CONTENT', function(){
        console.log('href successfully loaded')
      });
      $('#hrefModal').modal('show');
    });
```
From the first line, you can see that this function is added as an event 
listener to all elements of class 'href-button'. So, future developers can
simply add the 'href-button' to an elements class, set the 'data-id' equal
to the href, and set the id of the element that is to be loaded from the 
referenced html file to 'BODY_CONTENT'. The rest is all taken care of.
>>>>>>> a28d7bfb61ea74384a940560eb7962fef5c77266


------------
### Modal Views

* 


------------
<<<<<<< HEAD
### Other Pages

###### Zillow Preferences 
The Zillow Preferences page just takes users to the edit zillow\_pref page where they submit their own personal Zillow preferences to the database that way it knows what information to display whenever showing a property.

###### Template Send 
The Template Send page pulls all of the properties and all of the templates from the database and places them in select boxes where the user can select one of each and then hit the send button, which calls a method that fills in the blank terms from the template with information from the address and contact databases and emails it to the homeowner based off the email in the contact.

###### User Preferences
=======
###Other HTML Pages

* Zillow Preferences, location='app/views/zillow\_prefs'

* Template Send, location='app/views/templates'

>>>>>>> a28d7bfb61ea74384a940560eb7962fef5c77266

------------
### Others