[<img src="https://about.mappls.com/images/mappls-b-logo.svg" height="80"/> </p>](https://www.mapmyindia.com/api)


# BritanniaNearbyFinderUIPlugin - iOS


## [Introduction](#Introduction)

BritanniaNearby Plugin a Custom reusable iOS component that helps Britannia's developers integrate reatailer finder functionality using Mappls SDK. It allows developers to integrate plugin module in their application.

**Note:** Sample for UI view controllers with source code is also provided by Mappls. Information about how to use is also provided in this documentation.

### [Version History](#Version-History)

| Version | Dated | Description |
| :------ | :---- | :---------- |
| `1.0.4` | 18 Aug, 2026 | Nearby Search API – 250-Meter Radius for Nearby Mode. |
| `1.0.3` | 16 Jul, 2026 | Restore the initial Filter Results camera position on back action. |
| `1.0.2` | 26 Jun, 2026 | For channel Group `ROGT` show Map Marker tagged as "G". Show a dialog box to set Location access. |
| `1.0.1` | 28 Apr, 2026 | Mappls Dependencies are downgraded of Auth 1 versions. |
| `1.0.0` | 13 March, 2026 | Initial release. |

## [Installation](#Installation)

To add a package dependency to your Xcode project, select File > Swift Packages > Add Package Dependency and enter its repository URL. See [Adding Package Dependencies to Your App](https://developer.apple.com/documentation/xcode/adding-package-dependencies-to-your-app).

### [Dependencies](#Dependencies)

This library depends upon `MapplsMap`,`MapplsAPICore`, `MapplsAPIKit`. Third party on which this depends upond is `Alamofire`.

- For iOS9 or later, make this change to your info.plist (Project target > info.plist > Add row and set keys `NSLocationAlwaysAndWhenInUseUsageDescription`, `NSLocationWhenInUseUsageDescription`, `NSLocationAlwaysUsageDescription`). As follows
    ```
    <key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
    <string>Your location is required</string>
    <key>NSLocationAlwaysUsageDescription</key>
    <string>Your location is required</string>
    <key>NSLocationWhenInUseUsageDescription</key>
    <string>Your location is required</string>
    ```
    Message should be appropriate, according to use of your application.

## [Authentication](#Authentication)

To initialize and authenticate any **` Mappls SDK `**, you must include **` i.conf `**  and **` i.olf `** files in your project bundle:

You can download the required files from the **[Auth Console](http://auth.mappls.com/console/)**

### Create App On Mappls Console

![Mappls Console - How to create apps](https://mmi-api-team.s3.amazonaws.com/Mappls-SDKs/images/TestApp_iOS_1.gif)


### Download config files from Console
![Mappls Console - How to create apps](https://mmi-api-team.s3.amazonaws.com/Mappls-SDKs/images/TestApp_iOS_2.gif)

## [Usage](#Usage)

### [Initialization](#Initialization)

After adding the package and its dependencies, you need to initialize it before use. To do this, call the `initialize` function of the `BritanniaNearbyFinderUIPluginManager` class using its shared instance.

**Swift**
```swift
BritanniaNearbyFinderUIPluginManager.shared.initialize { [weak self] in
    guard let self else { return }
    // Handle Initialize Succeess Here.
} failure: { [weak self] error in
    guard let self else { return }
    // Handle Initialize Failure Here.
}
```

#### Initialize Status

You can check if the package has already been initialized by inspecting the `initializedStatus` property, which is of type `PluginStatus`.

**Swift**
```swift
if BritanniaNearbyFinderUIPluginManager.shared.initializedStatus == .success {
    // Handle Already Initialize Here.
} else if BritanniaNearbyFinderUIPluginManager.shared.initializedStatus == .inProgress {
    // Handle In-Progress Here.
} else {
    // Handle Other case Here.
}
```

Ensure that the initialization process is completed before using the plugin; otherwise, the plugin may not function as expected. So, use it as follows:

#### Default/LoggedIn User

The default user can be set by assigning a value to the `defaultUserCode` property, which is of type String.

After setting the default user and initializing the package, when the plugin controller is launched, it will show prefilled information for that user, and access will be limited to the scope of that user.

**Swift**
```swift
BritanniaNearbyFinderUIPluginManager.shared.defaultUserCode = ""
```

**Note:** Value of `defaultUserCode` must be set before initilizing the plugin.

### [Launch Plugin](#LaunchPlugin)

After successful initialization, you can launch the UI plugin by consuming an instance of `HomeViewController`, which is a subclass of `UIViewController`. 

This instance can then be presented over your existing ViewController or pushed to a UINavigationController.

**eg.**
```swift
let pluginVC = HomeViewController()
pluginVC.delegate = self // Impmlementation of delegate to receive callbacks
navigationController?.pushViewController(mapVC, animated: true)
```

#### [Callback Functions](#callback-functions)

`HomeMapViewControllerDelegate` is a delegate protocol. By implementing it in your ViewController, you can use its methods as callbacks to respond to events or actions from HomeMapViewController.

**Methods**

`outletsFetched:`

This method is triggered when outlets are successfully retrieved, either through a nearby search or after applying filters.

`outletSelected:`

This method is called when the user selects an outlet by tapping its marker on the map.

`outletSelectedDetailsRequested:`

This method is called when the user taps the `Show Details` button that appears after selecting an outlet on the map.

**eg.**
```swift
extension ViewController: HomeMapViewControllerDelegate {
    func outletsFetched(outlets: [EmployeeRecord]) {
        print("outlets:: \(outlets)")
    }

    func outletSelected(outlet: EmployeeRecord) {
        print("outlet:: \(outlet)")
    }
    
    func outletSelectedDetailsRequested(outlet: EmployeeRecord) {
        print("outlet:: \(outlet)")
    }
}
```

#### [Plugin Mode](#PluginMode)

The default mode of the plugin can be set by assigning a value to the `pluginMode` property, which is of type `PluginMode`. It can be either `nearBy` or `filter`, with the default value being `none`. 

If the pluginMode is set to .none, the plugin will prompt the user to choose a mode when launching the plugin controller.

**Swift**
```swift
BritanniaNearbyFinderUIPluginManager.shared.pluginMode = .nearBy
or
BritanniaNearbyFinderUIPluginManager.shared.pluginMode = .filter
or
BritanniaNearbyFinderUIPluginManager.shared.pluginMode = .none
```

**Note:** Value of `pluginMode` must be set before launching of controller of the plugin.

#### [UI Theme](#UITheme)

***Optionally*** the UI theme for the plugin can be customized.

##### [Theme Mode](#ThemeMode)

The UI theme for the plugin can be customized using the `themeMode` property of `BritanniaNearbyFinderUIPluginManager`, which is of type `ThemeMode`.

The possible values for `themeMode` are:
- light (for the light theme)

- dark (for the dark theme)

- auto (for automatic theme switching based on system preferences)

**Default** value of themeMode is `auto`. You can **restrict** the plugin to a specific theme mode by setting the themeMode property accordingly.

**Swift**
```swift
BritanniaNearbyFinderUIPluginManager.shared.themeMode = .dark
```

**Note:** Value of `themeMode` must be set before launching of controller of the plugin.

##### [Color Scheme](#ColorScheme)

To further customize the color scheme for the light and dark theme modes, you can use the lightTheme and darkTheme properties, respectively. Both are of type ColorScheme, a struct that allows you to define the specific colors for each theme.

Also different colors of Day and Night theme are configurable by accessing shared instance of class DayThemeColors and NightThemeColors respectively. Available properties to set are as below:

The available properties to set for each theme include:

- **primary** (Color for primary elements)
- **secondary** (Color for secondary elements)
- **background** (Color for background of base elements)
- **secondaryBackground** (Color for background of top-layered elements)
- **blurBackground** (Color for blurred background elements)
- **textPrimary** (Color for text of primary elements)
- **textSecondary** (Color for text of secondary elements)
- **textPlaceholder** (Color for text of placeholder elements)
- **border** (Color for stroke of different elements)

```swift
let theme = ColorScheme(primary: .systemBlue, secondary: .systemGreen, background: .white, secondaryBackground: .systemGray6, blurBackground: .systemBackground.withAlphaComponent(0.8), textPrimary: .label, textSecondary: .secondaryLabel, textPlaceholder: .placeholderText, border: .systemGray4)
    
BritanniaNearbyFinderUIPluginManager.shared.lightTheme = theme
```



<br><br>

## Our many happy customers:

![](https://www.mapmyindia.com/api/img/logos1/PhonePe.png)![](https://www.mapmyindia.com/api/img/logos1/Arya-Omnitalk.png)![](https://www.mapmyindia.com/api/img/logos1/delhivery.png)![](https://www.mapmyindia.com/api/img/logos1/hdfc.png)![](https://www.mapmyindia.com/api/img/logos1/TVS.png)![](https://www.mapmyindia.com/api/img/logos1/Paytm.png)![](https://www.mapmyindia.com/api/img/logos1/FastTrackz.png)![](https://www.mapmyindia.com/api/img/logos1/ICICI-Pru.png)![](https://www.mapmyindia.com/api/img/logos1/LeanBox.png)![](https://www.mapmyindia.com/api/img/logos1/MFS.png)![](https://www.mapmyindia.com/api/img/logos1/TTSL.png)![](https://www.mapmyindia.com/api/img/logos1/Novire.png)![](https://www.mapmyindia.com/api/img/logos1/OLX.png)![](https://www.mapmyindia.com/api/img/logos1/sun-telematics.png)![](https://www.mapmyindia.com/api/img/logos1/Sensel.png)![](https://www.mapmyindia.com/api/img/logos1/TATA-MOTORS.png)![](https://www.mapmyindia.com/api/img/logos1/Wipro.png)![](https://www.mapmyindia.com/api/img/logos1/Xamarin.png)

<br>

For any queries and support, please contact:

[<img src="https://mmi-api-team.s3.amazonaws.com/Mappls-SDKs/Resources/mappls-logo.png" height="40"/> </p>](https://about.mappls.com/api/)

Email us at [apisupport@mappls.com](mailto:apisupport@mappls.com)

![](https://www.mapmyindia.com/api/img/icons/support.png)
[Support](https://about.mappls.com/contact/)
Need support? contact us!

<br></br>

[<p align="center"> <img src="https://www.mapmyindia.com/api/img/icons/stack-overflow.png"/> ](https://stackoverflow.com/questions/tagged/mappls-api)[![](https://www.mapmyindia.com/api/img/icons/blog.png)](https://about.mappls.com/blog/)[![](https://www.mapmyindia.com/api/img/icons/gethub.png)](https://github.com/mappls-api)[<img src="https://mmi-api-team.s3.ap-south-1.amazonaws.com/API-Team/npm-logo.one-third%5B1%5D.png" height="40"/> </p>](https://www.npmjs.com/org/mapmyindia) 

[<p align="center"> <img src="https://www.mapmyindia.com/june-newsletter/icon4.png"/> ](https://www.facebook.com/Mapplsofficial)[![](https://www.mapmyindia.com/june-newsletter/icon2.png)](https://twitter.com/mappls)[![](https://www.mapmyindia.com/newsletter/2017/aug/llinkedin.png)](https://www.linkedin.com/company/mappls/)[![](https://www.mapmyindia.com/june-newsletter/icon3.png)](https://www.youtube.com/channel/UCAWvWsh-dZLLeUU7_J9HiOA)

<div align="center">@ Copyright 2026 CE Info Systems Ltd. All Rights Reserved.</div>

<div align="center"> <a href="https://about.mappls.com/api/terms-&-conditions">Terms & Conditions</a> | <a href="https://www.mappls.com/about/privacy-policy">Privacy Policy</a> | <a href="https://www.mappls.com/pdf/mappls-sustainability-policy-healt-labour-rules-supplir-sustainability.pdf">Supplier Sustainability Policy</a> | <a href="https://www.mappls.com/pdf/Health-Safety-Management.pdf">Health & Safety Policy</a> | <a href="https://www.mappls.com/pdf/Environment-Sustainability-Policy-CSR-Report.pdf">Environmental Policy & CSR Report</a>

<div align="center">Customer Care: +91-9999333223</div>
