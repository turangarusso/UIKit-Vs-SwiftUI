<a name="readme-top"></a>

<h1 align="center">

UIKit Vs SwiftUI
  <br>
</h1>

<h4 align="center">A case study about the difference between UIKit and SwiftUI
.</h4>


<p align="center">
  <a href="#key-features">Key Features</a> •
  <a href="#hello-case">Hello Case</a> •
  <a href="#contacts-case">Contacts Case</a> •
  <a href="#auto-layout">Auto Layout</a> •
  <a href="#credits">Credits</a> •
  <a href="#license">License</a>
</p>

![wwdc22-og-twitter](https://user-images.githubusercontent.com/113531412/227647580-c51dcfde-8827-4a37-9064-c47825c7fe30.jpg)

## Key Features

We will explore the difference between UIKit and SwiftUI with multiple projects

* MVC Pattern Vs MV Pattern
  - MVC for UIKit.
  - MV for SwiftUI.
* UIKit interface builder
* UIKit Integrated with swiftUI

## Hello Case

*How to use:*

- Clone the repository or download the source code.
- Open the project in Xcode.
- Build and run the app on a simulator or a physical device.

The MVC (Model-View-Controller) pattern is a traditional software design pattern that has been used in UIKit, Apple's traditional UI framework for iOS apps. On the other hand, the MV pattern (Model-View) is a pattern that is commonly used in SwiftUI, Apple's newer UI framework for iOS apps.

The main difference between the two patterns is that MVC has three components: Model, View, and Controller, while MV has two components: Model and View. In MVC, the Controller acts as an intermediary between the Model and the View, whereas in MV, the View and the Model are more tightly coupled.

![wikipedia_mvc](https://user-images.githubusercontent.com/113531412/227654984-00cf1778-58e4-4138-a076-d5fcc74cfcae.png)

In the Hello example i've used UIKit interface builder for create the view and manage the padding.

The main difference with SwiftUI when you manage the project are the AppDelegate and SceneDelegate.

AppDelegate methods are called for application level lifecycle events. 
In the default AppDelegate.swift there are three methods that Apple considers to be important that we have to consider and let’s look into them:

```swift
class AppDelegate: UIResponder, UIApplicationDelegate {

 func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
        
```
An app can have more than one scene which mostly handles application interface and app content. So, the SceneDelegate is responsible for what’s displayed on the screen in terma of UI and data.

<details><summary><b>Show code</b></summary>


    import UIKit

    class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
    }

</details>


To build the view I used the UIKit interface builder, which allows you to insert elements such as images, buttons, etc. and which allows you to easily customize each element as well as its position and padding

<img width="1338" alt="Screenshot 2023-03-24 alle 23 58 52" src="https://user-images.githubusercontent.com/113531412/227658546-457e75cb-2757-43b4-8edc-af5fc381011c.png">

However this is not enough to use them in a view, in fact with UIKit each view is managed by a ViewController.

You use view controllers to manage your UIKit app’s interface. A view controller manages a single root view, which may itself contain any number of subviews. User interactions with that view hierarchy are handled by your view controller, which coordinates with other objects of your app as needed. Every app has at least one view controller whose content fills the main window.

```swift
 class ViewController: UIViewController {
    
    @IBOutlet weak var mySwitch: UISwitch!
    
    @IBOutlet weak var mySlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
```

Another difference are the IBActions, with which we can assign, for example, to a button, multiple actions when certain events occur

```swift
@IBAction func tapPoint(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: view)
        print(location)
    }
    
    @IBAction func keyboardReturnText(_ sender: UITextField) {
        if let text = sender.text{
            print(text)
        }
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        print("Button was tapped!")
        
        if mySwitch.isOn{
            print("switch is on")
        }else{
            print("switch is off")
        }
        print("value of slider: \(mySlider.value)")
    }
```

Then i've created the same view with the same functionality in SwiftUI, first I had to use a navigation controller to create a navigation between the views, then you need to add a UIHostingController with the interface builder and add a IBSegueAction inside the ViewController:

```swift
import SwiftUI


@IBSegueAction func mySwiftView(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: SwiftUIVersionView())
    }

```
And this is the same view with one single file in made with SwiftUI:

<details><summary><b>Show code</b></summary>


    import SwiftUI
    
    struct SwiftUIVersionView: View {
    
    @State var text: String = ""
    @State var isOn: Bool = true
    @State var value: Double = 0.5
    
    var body: some View {
        VStack{
            
            Text("Giovanni M Russo")
                .font(.title)
                .padding()
            
                Image(systemName: "apple.logo")
                    .resizable()
                    .padding()
                    .frame(width: 180, height: 220,alignment: .center)
            
            Section{
                Text("Hello i'm giovanni and i want to learn how to use UIKit and the difference with swiftUI.")
                    .padding()
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
            }
            
            Spacer()
            
            Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
                
                print("Button was tapped!")
                
                if isOn{
                    print("toggle is on")

                } else{
                    print("toggle is off")

                }
                
            }.foregroundColor(.purple)
                .padding()

            HStack{
                TextField("Enter text", text: $text)
                    .padding(.leading, 5.0)
                    .padding(.horizontal, 5.0)
                    .accentColor(.black)
                
            }
            .padding(.vertical, 10)
            .background(.white)
            .cornerRadius(6)
            .shadow(radius: 0.5)
            .padding(.horizontal)
            
                            Toggle("Toggle", isOn: $isOn)
                    .padding()
                    .toggleStyle(SwitchToggleStyle(tint: Color.purple))
                    
            Slider(value: $value)
                .padding(.horizontal)
                .accentColor(.purple)
            
            Button(action: {
                        // action to perform when button is tapped
                    }) {
                        Text("SwiftUI View")
                            .foregroundColor(.black)
                            .padding(10)
                    }
                    .background(Color.purple)
                    .cornerRadius(10)
                    .padding()
            
            Spacer()
            }
           }
          }

            struct SwiftUIVersionView_Previews: PreviewProvider {
            static var previews: some View {
            SwiftUIVersionView()
            }
           }

</details>  

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Contacts Case

In this example we have a list of contacts that we take from our model. The app displays a list of contacts in a table view and allows the user to select a contact to view their details. 

**The ViewController** is responsible for displaying the details of a selected contact. It has two UILabel objects to display the name and description of the contact. It also has a Contact object that is passed to it from the TableViewController when a contact is selected.

```swift

import UIKit

class ViewController: UIViewController {

    var aContact: Contact?

    @IBOutlet weak var myContactLabel: UILabel!
    
    @IBOutlet weak var myDescription: UILabel!
    
    required init?(coder: NSCoder, aContact: Contact?) {
        self.aContact = aContact
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myContactLabel.text = (aContact?.name ?? "Name") + " " + (aContact?.surname ?? "Surname")
        
        myDescription.text = aContact?.description

    }

}

```
**The TableViewController** is responsible for displaying the list of contacts in a table view. It has a UITableView object and an array of Contact objects that are used to populate the table view.

<details><summary><b>Show code</b></summary>


    class TableViewController: UITableViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.reloadData()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        // #warning Incomplete implementation, return the number of sections
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // #warning Incomplete implementation, return the number of rows
        
        if section == 0 {
            return contact.count
        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! TableViewCell
        
        let aContact = contact[indexPath.row]

        cell.update(with: aContact)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    @IBSegueAction func mySegue(_ coder: NSCoder) -> ViewController? {
        let contactToShow = contact[tableView.indexPathForSelectedRow?.row ?? 0]
        
        return ViewController(coder: coder, aContact: contactToShow)
    }

    }

</details>

**Difference with SwiftUI**

SwiftUI is a modern framework for building user interfaces in Swift. It provides a declarative syntax for defining user interfaces, making it easier and more intuitive to build apps. Some of the differences between UIKit and SwiftUI are:

* SwiftUI uses a declarative syntax, while UIKit uses an imperative syntax.
* SwiftUI provides automatic updates and animations, while UIKit requires manual updates and animations.
* SwiftUI is only available on iOS 13+, while UIKit is available on older versions of iOS.
* SwiftUI provides a simpler and more intuitive way to build user interfaces, while UIKit requires more code and complexity.
* Overall, SwiftUI is a more modern and user-friendly framework for building user interfaces in Swift.

Although SwiftUI is a newer and more modern framework for building user interfaces in Swift, there are still some positive aspects of using UIKit instead:

* Compatibility: UIKit is available on older versions of iOS, making it a more compatible choice if you need to support older devices.
* Stability: UIKit has been around for a long time and is a stable and reliable framework with a large community and many resources available.
* More features: UIKit has a wider range of features and customization options than SwiftUI, which makes it more suitable for building complex user interfaces.
* More control: UIKit allows developers to have more control over the user interface, giving them the ability to create more custom and advanced designs.
* Larger developer community: Since UIKit has been around for a longer time, there is a larger community of developers who are experienced in working with it, making it easier to find help and resources when needed.
* Interface Builder: With UIKit you can manage the padding of the objects quickly, modify them without writing code, and use autolayout.

Overall, while SwiftUI is becoming the preferred framework for building user interfaces in Swift, UIKit still has many positive aspects that make it a suitable choice for certain projects and applications.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Auto Layout

When you build an app, you want to make sure it looks good on every iOS device. Xcode includes a powerful system called Auto Layout which makes it easy to build intricate interfaces that work on various screen sizes.

Auto Layout relies on constraints, or rules, to dynamically calculate the size and position of all views in a view hierarchy. So your interfaces will look and work the same—no matter what device your users have in their hands or how they’re holding it.

At the right of the bottom button bar is a set of tools for creating and managing constraints. To lock the button in the center of the screen, you’ll create two constraints that define the position of the button.

<img width="1342" alt="Screenshot 2023-03-29 alle 11 55 51" src="https://user-images.githubusercontent.com/113531412/228510653-9d9748a3-6d20-4f35-baa7-c9c1e693b761.png">

In this way the button will have the same position in every device, iphone and tablet, with all orientation.

Now assume you want the height of the button to always be 60, no matter the screen size or orientation of the device. Click the Add New Constraints button , the button immediately to the right of the Align tool.
The popover displays a list of text fields and checkboxes to help you add constraints. Select the Height checkbox and adjust the value to 60. Click “Add 1 Constraint” to create the height constraint.

<img width="1342" alt="Screenshot 2023-03-29 alle 11 56 48" src="https://user-images.githubusercontent.com/113531412/228511236-35997e6c-414a-483f-8b50-4d8bb6957a0c.png">

Finally i've create three different labels, two with the auto layout, and as you can see the last one will have some problems when the device change, or the orientation.

<img width="1342" alt="Screenshot 2023-03-29 alle 12 24 19" src="https://user-images.githubusercontent.com/113531412/228511800-d28cb5b5-d0e3-4cc5-92d4-8315644d11d0.png">

<p align="right">(<a href="#readme-top">back to top</a>)</p>

> **Note**

> In Progress, i will update the repo with more examples

## Requirements

- iOS 13.0+
- Xcode 12.0+
- Swift 5.0+

## Credits

Russo Giovanni M.

For educational purposes

## License

MIT

![poster](https://user-images.githubusercontent.com/113531412/228586527-ea999022-d690-4836-adc8-8361f9781b74.png)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

