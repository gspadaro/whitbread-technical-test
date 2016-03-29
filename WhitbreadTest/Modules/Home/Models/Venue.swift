//
//  Venue.swift
//  WhitbreadTest
//
//  Created by Giuseppe Spadaro on 26/03/16.
//  Copyright © 2016 Giuseppe Spadaro. All rights reserved.
//

class Venue: MappableObject {
  
  var venueId: String?
  var name: String?
  var location: Location?
  var categories: [Category]?
  var verified: NSNumber?
  var stats: Statistic?
  var allowMenuUrlEdit: NSNumber?
  var referralId: String?
  var url: String?
  
  override internal func propertyMapping() -> [(String?, String?)] {
    return [("venueId","id")]
  }

}