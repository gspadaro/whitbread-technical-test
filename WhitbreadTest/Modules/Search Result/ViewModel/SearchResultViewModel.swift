//
//  SearchResultViewModel.swift
//  WhitbreadTest
//
//  Created by Giuseppe Spadaro on 26/03/16.
//  Copyright © 2016 Giuseppe Spadaro. All rights reserved.
//

import Foundation

protocol SearchResultViewModel {
  var venues: [Venue]? { get set }
}

struct DefaultSearchResultViewModel: SearchResultViewModel {
  
  var venues: [Venue]?
  
  init(venues: [Venue]?) {
    self.venues = venues
  }
  
}

