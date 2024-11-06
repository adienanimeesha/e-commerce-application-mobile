# Assignment 7 

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


