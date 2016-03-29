//
//  VenuesTableViewController.swift
//  WhitbreadTest
//
//  Created by Giuseppe Spadaro on 26/03/16.
//  Copyright © 2016 Giuseppe Spadaro. All rights reserved.
//

import UIKit

class VenuesTableViewController: UITableViewController {
  
  var viewModel: DefaultSearchResultViewModel?
  
  override func viewDidLoad() {
    super.viewDidLoad()

  }
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if let viewModel = viewModel {
      return viewModel.venues?.count ?? 0
    }
    return 0
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("venueCellIdentifier", forIndexPath: indexPath) as! VenueTableViewCell
    if let viewModel = viewModel {
      if let venues = viewModel.venues {
        cell.venue = venues[indexPath.row]
      }
    }
    return cell
  }
  
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    if let viewModel = viewModel {
      if let venues = viewModel.venues {
        let venue = venues[indexPath.row]
        print("venue tapped with id: \(venue.venueId)")
      }
    }
  }

}
