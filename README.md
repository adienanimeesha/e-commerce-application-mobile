# Assignments 7-9 README

-------------------------------------------------------------------------
<details>
<summary>Assignment 9</summary>

## Explain why we need to create a model to retrieve or send JSON data. Will an error occur if we don't create a model first?
A model is needed to retrieve or send JSON data since in this assignment, we are storing and retrieving data (username, password, user's product entries, etc). Because of this, models are needed to represent the data in the database. An error will occur if models aren't created first. If a data needs to be saved, an error may arise since there is no existing model to store the data in. 

## Explain the function of the http library that you implemented for this task.
The http library is used to send and receive http requests between the web server and the Flutter application. Http functon is needed so that the Flutter app can fetch and send data from the Django database using the Django application. Without http library, the data won't be able to be displayed.

## Explain the function of CookieRequest and why it's necessary to share the CookieRequest instance with all components in the Flutter app.
CookieRequest is used for user session and authentication. It's necessary to share the CookieRequest since it enables consistency accross the Flutter application. This is because the same cookies are used in the http requests and this allows the session data to be stored. 

## Explain the mechanism of data transmission, from input to display in Flutter.
It starts by the user inputting the fields present in the "Add product" widget of the Flutter app and pressing "submit" to save the data. The saved data is then formatted  to JSON and then sent to the Django app via http POST request. Once the data reached the server, the data is validated (ensuring the user's input matches the fields), stored to the database, and sending a "sucess" or "error" response to the flutter app. The data is then displayed using a GET request made by the flutter app. The GET request is sent to the Django app so that data will be retrieved and updates the user's interface via widgets to display the data. 

## Explain the authentication mechanism from login, register, to logout. Start from inputting account data in Flutter to Django's completion of the authentication process and display of the menu in Flutter.
This starts by users inputting a username and password in the registration form, ensuring the user's entries matches the field integrated in flutter. Then the data is sent from Flutter to Django, where the data is further validated and saving it in the database. After registering, the user will input their credentials into the login form in the Flutter UI and the Django app will authenticate users, checking the inputted data matches with the datas in the database. If the data is valid, then Django will send a response with a cookie session (start of session). When the user logout, they will click the logout button in the Flutter app. This triggers an http request and the Django app will end the session. 

## Explain how you implement the checklist above step by step! (not just following the tutorial).
### Implement the registration feature in the Flutter project.
This is done by creating a new app called "authentication" in the Django project. This is to help handle login, registration, and logout properly and so the user can interact with the database securely. In the views.py of the authentication module, add the function for register. The function decodes the raw JSON and stores it in a python dictonary. The username, password1, and password2 is then obtained from the data dictionary. This is where the password is also checked, to see if they match with the database. Then add the url path in urls.py of authentication, to ensure it can be accessed through the application. In the Flutter app, create a file called "register.dart" and add the code, implementing the application url to check the credentials. 

###  Create a login page in the Flutter project.
Similar to creating the register feature, add a function called "login" (which takes the parameter request) in views.py of the authentication app. If login is successful, a JSON response containting the username and a success message will be returned. If not, it will return an error JSON response. Routing is then performed in urls.py so that the login function can be accessed throughout the authentication application. In the flutter app, create a folder called "screens" and inside this folder create a file called "login.dart". Add the code for login, which consists of a textfield to ensure user fill in the correct field and to check the user's credentials. In the MaterialApp(...) widget of the main.dart file, change home: MyHomePage() to home: LoginPage() so that the login page is displayed, and ensuring user authentication before entering the app.  

### Integrate the Django authentication system with the Flutter project.
This is done by creating a new app in the Django project called "authentication". Then run pip install django-cors-headers to download the required library. corsheaders is used since it allows a frontend application (in this case Flutter) to run on a different domain with a Django server. Then add corsheader into the INSTALLED_APPS and add  corsheaders.middleware.CorsMiddleware to MIDDLEWARE. 

### Create a custom model according to your Django application project.
To create a custom model based on the Django application project. This is done by running the Django app and creating a new product entry. Then add "JSON" in the local host so that the JSON data can be retrieved. Copy the data and access the website "Quicktype". In the website, change the setup name to ProductEntry, source type to JSON, and the language to dart, and paste the JSON data from before. In the Flutter app, create a folder called "models" and a file called "product_entry.dart" and paste the code. A custom model is used to maintain consistency of the models between front-end and back-end and so that it will be compatible. 

### Create a page containing a list of all items available at the JSON endpoint in Django that you have deployed.
This is done by creating a new page called "list_productentry.dart" then importing product entry and the left drawer at the very top so that it can be accessed. Add the code to the "list_productentry.dart" file and this code is able to fetch and display the list of product entries from the Django JSON API. This code also handles data asynchronously. Inside the left drawer file, add the following code:
```dart
ListTile(
    leading: const Icon(Icons.add_reaction_rounded),
    title: const Text('Product List'),
    onTap: () {
        // Route to the product page
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProductEntryPage()),
        );
    },
),
``` 
so that the page is visible in the left drawer and users can easily access it through there. Then the function "view mood" is changed in the main page so that users will be redirected to the ProductPage. 

#### Display the name, price, and description of each item on this page.
This is done by using fetchProduct() to fetch all the name, price, and description of each item. Then add navigation to the left drawer file so the list of names, price, and description can be displayed. 

#### Create a detail page for each item listed on the Product list page.
##### This page can be accessed by tapping on any item on the Product list page.
This is done by creating a new file called "product_detail.dart" inside the "screens" folder. Then add the codes so that it can be accessed by tapping on any item if the product list page, ensuring to import the product list page and creating a new class for product list and using a stateless widget.

##### Display all attributes of your item model on this page.

 
##### Add a button to return to the item list page.
This is done by updating the product_detail.dart file, adding a code for the button.The Navigator.pop() is used to pop the current page of the navigation stack and to return it to the Product List Page. The ElevatedButton will trigger the Navigator.pop() when pressed.

##### Filter the item list page to display only items associated with the currently logged-in user.


</details>

-------------------------------------------------------------------------

<details>
<summary>Assignment 8</summary>

##  What is the purpose of const in Flutter? Explain the advantages of using const in Flutter code. When should we use const, and when should it not be used?
The use of const in flutter is to ensure certain fields cannot be changed. 
Const is used when dealing with pre-defined values, immutable data objects, and optimizing widget trees. However, const should not be used when dealing with dynamic data

## Explain and compare the usage of Column and Row in Flutter. Provide example implementations of each layout widget!
The usage of Column widget align child widgets in a vertical direction (such as stacking elements on top of one another). Whereas the Row Widget allign the child widget along the vertical direction (such as putting the elements side-by-side). 

An example of the Column widget is seen below:
```dart 
class ColumnExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Column')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("This is a Column"),
          Text("It controls vertical allignment"),
        ],
      ),
    );
  }
}
```

An example of the Row widget is seen below:
```dart
class RowExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Row')),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("This is a Row"),
          Text("It controls horizontal allignment"),
        ],
      ),
    );
  }
}
```

## List the input elements you used on the form page in this assignment. Are there other Flutter input elements you didn’t use in this assignment? Explain!
The input elements used on the form page for this assignment are the following:
1. Product Name 
2. Description
3. Amount 
4. Price
5. Save Button

There are several flutter elements that I didn't include, and here are some: radio button, checkbox, dropdown button. These elements aren't incorporated in my flutter app since they aren't useful in my application. For radio button, there aren't any options where users could select one out of many choices. A dropdown isn't necessary as well due to the presence of the left drawer for navigation. 

## How do you set the theme within a Flutter application to ensure consistency? Did you implement a theme in your application?
Setting up the primarySwatch and secondary color in colorScheme (in main.dart) helps with maintaining consistency within the Flutter application. To maintain consitency, use Theme.of(context).colorScheme.primary and Theme.of(context).colorScheme.secondary in the widgets. Other than that, the colors used in this Flutter application matches and compliments one another. 

## How do you manage navigation in a multi-page Flutter application?
Navigation is managed using the Navigator widget, Navigator.push (which is used to navigate users to a new page/screen) and Navigator.pop (so that users can go back or to the previous screen/page).
An example used in this application is seen below:
```dart 
if (item.name == "Add Product") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProductEntryFormPage(),
              ),
            );
          }
```
This is used in product_card and it's used to navigate users to the ProductEntryFormPage when users click on the "Add Product" button. 

Other than that, the left drawer is also used for navigation, allowing users to move from the Home Page and Add Product page.

</details>



-------------------------------------------------------------------------
<details>
<summary>Assignment 7</summary>

## Explain what are stateless widgets and stateful widgets, and explain the difference between them.
A stateless widget is something that never changes and cannot be altered once they are built. For example, Text, Icon, and IconButton. A stateful widget is the opposite, as it can be changed and altered multiple times during their lifetime. It has the ability to change its appearance based on the response to events that is triggered by user interactions. Some examples are: TextField, Checkbox, and Form. The difference is the type of widgets, stateless is static and stateful is dynamic. Stateless widgets are only rendered once and is only updated if there are changes made in the external data. Whereas stateful widgets can be re-rendred if th input data changes. 

## Mention the widgets that you have used for this project and its uses.
The widgets used for this project are the following:
### main.dart
1. MaterialApp
- Provide navigation, along with the application's title, theme, and home
2. ThemeData
- To set the application's color theme (i.e. colorScheme and useMaterial3)
3. ColorScheme.fromSwatch
- Creates a color scheme according to the color swatch

### menu.dart
1. Scaffold
- Provides basic structure for a screen, which includs: floating action buttons, areas for app bar (appBar), and body
2. Padding 
- To add padding around the body and within certain text widgets
3. SnackBar
- Displays a message at the bottom of the screen when an ItemCard is pressed/tapped
4. Icon
- Displays an icon
- Used in ItemCard to visualize or represent an action 
5. ItemCard 
- A custom widget for individual item cards
- Used for "View Product List" and "Add product"

## What is the use-case for setState()? Explain the variable that can be affected by setState().
The setState() is used for triggering a rebuild of stateful widgets. Howver, rendering it when the wudget is actively rendering can create errors. Its is also utilized to update the UI in response to a change in the state of a widget. A variabl that can be affected by setState() is boolean flags. This is because boolean flags (used for enabling or disabling widgets) will update the UI when toggling _isVisible. 

## Explain the difference between const and final keyword.
The difference is how const is used for a constant string that represents the collection path. The value is known at compile-time (before the program runs) and it doesn not change throughout the program, Final is used for a runtime constant that represents the user ID. Other than that, const must be initialized with values that are strictly constant. Whereas final can be initialized with values that are not constant. 

## Explain how you implemented the checklist above step-by-step.
### Create a new Flutter application
This is done by opening the command prompt or terminal and type the following:
flutter create e-commerce-application
cd e-commerce-application

Then run the project with the command flutter run. Afterwards, create a new repo github and perform git init, along with git add, git commit, and git push. 

### Create Buttons with Icons
To create three buttons (view product list, add product, logout) with icons, a class called "ItemHomepage" must be created in the menu.dart file. This is to ensure the data is organized. Inside the ItemHomepage, add a list of buttons to add to the MyHomePage class. In this case, we create the following buttons: view product list, add product, and logout.
The Icons represents the icon that suits best for each button.
```dart
final List<ItemHomepage> items = [
         ItemHomepage("View Product List", Icons.shopping_cart),
         ItemHomepage("Add Product", Icons.add),
         ItemHomepage("Logout", Icons.logout),
     ];
```
The buttons are then displayed in the ItemCard. When the button is pressed, it will show a "you have pressed a [button name] button". Within the ItemCard, the message is shown in the InkWell widget.
```dart 
child: InkWell(
        onTap: () {
          // Display the SnackBar message when the card is pressed.
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("You have pressed the ${item.name} button!"))
            );
        },
```
Aftrwards, the ItemCard must be integrated to MyHomePage so that the two cards can be shown. This is done by changing the Widget build() in the MyHomePage class. 
The ItemCard is integrated within the GridView.count widget. This allows the items to appear in a grid layout with three columns. 
```dart
 GridView.count(
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    shrinkWrap: true,

                    children: items.map((ItemHomepage item) {
                      return ItemCard(item);
                    }).toList(),
                  ),
```

### Implement Different Colors for Each Button 
To do so, modify the ItemHomePage class to include a color attribute. It should look like the following:
```dart 
class ItemHomepage {
     final String name;
     final IconData icon;
     final Color color;

     ItemHomepage(this.name, this.icon, this.color);
 }
```
Then updat the items list so that color is now included and select a different color for each button. 
```dart 
List<ItemHomepage> items = [
         ItemHomepage("View Product List", Icons.shopping_cart, const Color.fromARGB(255, 217, 215, 215)),
         ItemHomepage("Add Product", Icons.add, const Color.fromARGB(255, 199, 198, 198)),
         ItemHomepage("Logout", Icons.logout, const Color.fromARGB(255, 31, 30, 30)),
     ];
```
Inisde the ItemCard, set color of the Material and Icon widget
```dart
 Widget build(BuildContext context) {
    return Material(
      color: item.color,
      borderRadius: BorderRadius.circular(12),
```
Run the project to see the changes created. 

### Display a Snackbar with Messages 
Displaying messages with SnackBar is done under the InkWell widget (as shown below):
```dart
 child: InkWell(
        // Action when the card is pressed.
        onTap: () {
          // Display the SnackBar message when the card is pressed.
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("You have pressed the ${item.name} button!"))
            );
        },
```
 onTap is utilized in the ItemCard since it triggers the widget when users press or interact with the buttons. 

</details>
