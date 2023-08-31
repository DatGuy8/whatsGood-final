<div id="top"></div>

# What's Good
 A food review platform, designed for foodies. This app centers around a simple idea: making it easy for food enthusiasts to share and discover reviews of individual dishes from various restaurants.

 I built this app to address a frustration I have with sites like Yelp - the overwhelming amount of information. With a user-friendly interface, you can quickly find out which dishes are highly recommended at different eateries.

![!](https://github.com/DatGuy8/whatsGood-final/blob/master/Screenshots/HomePage.png)



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#technologies-used">Technologies Used</a></li>
    <li><a href="#setup">Setup</a></li>
    <li><a href="#examples">Examples</a></li>
  </ol>
</details>



## Table of Contents
* [Technologies Used](#technologies-used)
* [Features](#features)
* [Examples](#examples)
* [Setup](#setup)
* [Room for Improvement](#room-for-improvement)
* [Contact](#contact)
<!-- * [License](#license) -->



## Technologies Used
- Java
- Spring Boot
- MySql
- Bootstrap
- Google Maps API
- Spring Security

<p align="right">(<a href="#top">back to top</a>)</p>

## Features
- Full CRUD support
- Admin/User roles and features
- Users can recommend business to be added
- Admins can update/delete businesses
- Users can add items to approved business
- Users can add reviews to items
- Admins can control what businesses and items are approved and featured

<p align="right">(<a href="#top">back to top</a>)</p>

## Examples

- [ ] Home Page
- Home page with businesses.
- Admins can control featured business in carousel.
- Able to sort and filter businesses.

![!](https://github.com/DatGuy8/whatsGood-final/blob/master/Screenshots/gifs/showingHomePage.gif)

<br>

- [ ] Adding Businesses
- Users can recommend a business.
- Google Places API incorporated into submission form to help users add existing businesses.

![!](https://github.com/DatGuy8/whatsGood-final/blob/master/Screenshots/gifs/addingbusiness1.gif)

<br>

- [ ] Business Pages
- Shows Average rating of all dishes.
- Top rated dishes.
- Google Map of location.
- Item filtering at bottom of page.
- Able to get directions to business.

![!](https://github.com/DatGuy8/whatsGood-final/blob/master/Screenshots/gifs/businessShowPageAndMap.gif)

<br>

- [ ] Add Items and Review Page
- Able to add items to business.
- Adding multiple pictures, with image preview.
- Able to rate out of 5 stars.
  
![!](https://github.com/DatGuy8/whatsGood-final/blob/master/Screenshots/gifs/addingitemandreview.gif)

<br>

- [ ] All Items Page
- Sort By price or rating.
- Filter by item name.
  
![!](https://github.com/DatGuy8/whatsGood-final/blob/master/Screenshots/gifs/SearchItemsbetter.gif)
<p align="right">(<a href="#top">back to top</a>)</p>
<br>

- [ ] Search Page

- Search Business, Items, and Users

![!](https://github.com/DatGuy8/whatsGood-final/blob/master/Screenshots/searchPage.png)

<br>

- [ ] Admin Pages
- Edit/Approve/Feature/Delete Businesses

![!](https://github.com/DatGuy8/whatsGood-final/blob/master/Screenshots/gifs/ApproveBusiness3.gif)

- Edit/Delete/Feature Items
  
![!](https://github.com/DatGuy8/whatsGood-final/blob/master/Screenshots/gifs/editItem.gif)

- Make other users Admins or admins to users.
  
![!](https://github.com/DatGuy8/whatsGood-final/blob/master/Screenshots/gifs/makeadmin.gif)



<p align="right">(<a href="#top">back to top</a>)</p>

<!-- If you have screenshots you'd like to share, include them here. -->


## Setup
Prerequisites: Need MySql Workbench and Google Maps API key
<p>How to set up:</p>

1. Clone the repo
   ```sh
   git clone https://github.com/DatGuy8/whatsGood-final.git
   ```
2. Create a new database schema in MySql.
  
3. Open project in Spring tool Suite.
  
4. Open src/main/resources/application properties and add information
    ```sh
      spring.datasource.url=jdbc:mysql://localhost:3306/<<ADD MYSQL DATABASE NAME>>
      spring.datasource.username=<<ADD USERNAME>>
      spring.datasource.password=<<ADD PASSWORD>>
      apiKey=<<ADD IN GOOGLE API KEY>>
    
      # REPLACE "create" TO "update" AFTER FIRST LOAD IF MAKING CHANGES (on first load with create adds information form import.sql file to have some default businesses loaded)
      spring.jpa.hibernate.ddl-auto=create
    ```
   - add in mysql database name
   - add username and password
   - add in google maps api key
   - change "create" to "update" after first start up, if making changes
   

6. Then Run As Spring Boot App, open browser to port 8080.

<p align="right">(<a href="#top">back to top</a>)</p>



## Room for Improvement

Room for improvement:
- User Pages
- Favorite Restaurants
- Restaurant categories 
- Able to like/dislike reviews


<p align="right">(<a href="#top">back to top</a>)</p>

## Contact

John Tran - namesjohntran@gmail.com

Project Link: [https://github.com/DatGuy8/whatsGood-final](https://github.com/DatGuy8/whatsGood-final)

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- Optional -->
<!-- ## License -->
<!-- This project is open source and available under the [... License](). -->

<!-- You don't have to include all sections - just the one's relevant to your project -->
