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
