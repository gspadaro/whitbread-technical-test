//
//  SearchPlacesViewModel.swift
//  WhitbreadTest
//
//  Created by Giuseppe Spadaro on 26/03/16.
//  Copyright © 2016 Giuseppe Spadaro. All rights reserved.
//

import Foundation

protocol SearchPlacesViewModel {
  var placeToSearch: String { get set }
  var searchVenuesService: SearchVenuesService? { get set }
  
  func searchVenues(completionBlock:(results: [Venue]?, error: NSError?) -> Void)
}

struct DefaultSearchPlacesViewModel : SearchPlacesViewModel {
  
  var placeToSearch: String
  var searchVenuesService: SearchVenuesService?
  
  init(placeToSearch: String) {
    self.placeToSearch = placeToSearch
    self.searchVenuesService = DefaultSearchVenuesService()
  }
  
  func searchVenues(completionBlock:(results: [Venue]?, error: NSError?) -> Void) {
    if let searchVenuesService = searchVenuesService {
      searchVenuesService.searchVenuesByPlace(placeToSearch, completionBlock: { (results, error) -> Void in
        print(results)
        completionBlock(results: results, error: error)
      })
    }
  }
  
  
}