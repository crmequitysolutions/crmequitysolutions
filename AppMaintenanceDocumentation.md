App Maintenance Documentation
=============================

### Installion

You can currently access the app at https://rocky-island-55465.herokuapp.com/. You can log into Heroku with the crmequitysolutions@gmail.com email and the password "compsci408". That is also the password for the gmail account itself. You can clone the Heroku app into any IDE and use any of the basic Heroku commands from the command line to maintain the app.

### Updating Database, Data Files, etc.

The database can only be updated by users at the moment because that is the intention of the app, for each user to have his or her own database of properties, contacts, etc. that only they have access to. 

### Necessary Account Information

You can log into the Google API Console, which is used for the Google Maps information that we use, using the same above email and password. The API key for all of the Google APIs that we use is "AIzaSyAoBbj6wzXMhjzYiA-vq4c7tetfzY6OTT4". The password and email for our Zillow account is the same as above as well. The API key for Zillow is "X1-ZWz1g3bfgqowln\_2f38x". You can feel free to change the passwords on any of these accounts, but if you change the password on the Gmail account itself. You will have to change it in the code as well, because it is used by the templates\_controller to send emails. The rest of the passwords are fine to change without having to change them in the code anywhere. To edit the Google API key, you would have to sign into the Google API console and you can get a new key under the "Credentials" tab. Then, you would have to change it on the properties/show page and the home page. To change the API settings for Zillow, you can go to the Zillow page and under "My Zillow", you would go to "Account Settings" to deal with the API. Then, to change it in the code, you would just have to go to config/initializers/rubillow.rb.