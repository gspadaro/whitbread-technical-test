# Whitbread Product Developer Test

This is my personal solution to the technical test provided by Whitbread.  
The scenario is described [here](https://github.com/whitbread-eos/product-developer-test).

## Installation with CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for iOS, which automates and simplifies the process of using 3rd-party libraries in your projects.
You can install it with the following command:

```bash
$ gem install cocoapods
```

#### Podfile
Then, run the following command:

```bash
$ pod install
```

## IDE and language
I choosed the modern language **Swift 2.0** on **Xcode 7.2.1**.
 
## Third-party Libraries and technologies

* [AFNetworking](https://github.com/AFNetworking/AFNetworking)
I used it as a HTTP request manager
* [SVProgressHUD](https://github.com/SVProgressHUD/SVProgressHUD)
I used it to give to user a visual feedback about his search
* [SDWebImage](https://github.com/rs/SDWebImage)
I used it as a web image and cache manager (Category icons)
* [EVReflection](https://github.com/evermeer/EVReflection)
I used it as a mapping manager. It provides a map between the JSON Response and my own classes
* [OHHTTPStubs](https://github.com/AliSoftware/OHHTTPStubs)
I used it in my Xcode Test project to mock the request and see the result with a different response

## Foursquare API 

##### https://developer.foursquare.com/

### Explore vs. Search 

Both explore and search allow you to find venues in an area, but their methodologies are slightly different. Explore is better at answering the question "what are some popular coffeeshops in this area?" whereas search is better at "where is the nearest Joe's Coffee?" or "where am I right now?" When using venues/search, you ought to pay special attention to what the intent parameter does and what values you should pass in order to get your desired results.

I choosed the "search" request because I thought it is better for my scenario.  

https://api.foursquare.com/v2/venues/search
Returns a list of venues near the current location, optionally matching a search term.

## Architecture Design

I designed the architecture with the Model-View-ViewModel approach.

* The MVVM treats the view controller as the View
* There is no tight coupling between the View and the Model
* Good distribution of code and responsabilities
* Testability in fact the View Model knows nothing about the View, this allows us to test it easily 
* Easy of use and easy to extend/maintance

```
Project 
│
└───Modules
    │
    ├───Home
    │   │   Models
    │   │   View
    │   │   ViewModel
    │   │   Service
    │
    └───Search Results
    │   │   View
    │   │   ViewModel
```


## Testing

I made a little session of Test in a XCode Unit Testing project. 
I tested Search Venues Service class, especially the request to Foursqare API.
I mock the response with a supporting pod called OHHTTPStubs.

* 500 Internal Server Error
* 400 Bad Request
* Internet Down
* 200 OK

## Future implementations
* More Tests (ViewModels creation)
* Text input validation 
* Map results shown on a MKMap with MKAnnotations
* Venue Detail with https://api.foursquare.com/v2/venues/VENUE_ID
   
