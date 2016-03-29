//
//  HomeViewController.swift
//  WhitbreadTest
//
//  Created by Giuseppe Spadaro on 26/03/16.
//  Copyright © 2016 Giuseppe Spadaro. All rights reserved.
//

import UIKit
import SVProgressHUD

class HomeViewController: UIViewController {
  
  @IBOutlet weak var searchButton: UIButton!
  @IBOutlet weak var searchBar: UISearchBar!
  
  var viewModel: DefaultSearchPlacesViewModel?
  var venues: [Venue]?
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func searchPlacesAction(sender: AnyObject) {
    
    SVProgressHUD.showWithStatus("Searching...")
    viewModel = DefaultSearchPlacesViewModel(placeToSearch: searchBar.text!)
    if let viewModel = viewModel {
      viewModel.searchVenues({(results, error) -> Void in
        SVProgressHUD.dismiss()
        if let results = results {
          self.venues = results
          self.performSegueWithIdentifier("searchPlaceSegueIdentifier", sender: self)
        } else {
          // manage the different types of error 
          // no Connection / bad request / internal server error
          let alertController = UIAlertController(title: "Foursquare", message: "Sorry there aren't results. Try with another place", preferredStyle: .Alert)
          let noAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
          alertController.addAction(noAction)
          self.presentViewController(alertController, animated: true, completion: nil)
        }
      })
    }
  }
  
  // MARK: - Navigation
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if let identifier = segue.identifier {
      if identifier == "searchPlaceSegueIdentifier" {
        let destinationViewController = segue.destinationViewController as! VenuesTableViewController
        destinationViewController.viewModel = DefaultSearchResultViewModel(venues: self.venues)
      }
    }
  }
}

extension HomeViewController : UISearchBarDelegate {
  func searchBarSearchButtonClicked(searchBar: UISearchBar) {
    searchPlacesAction(self)
  }
}