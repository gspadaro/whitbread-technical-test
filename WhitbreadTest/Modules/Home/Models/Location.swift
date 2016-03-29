//
//  Location.swift
//  WhitbreadTest
//
//  Created by Giuseppe Spadaro on 26/03/16.
//  Copyright © 2016 Giuseppe Spadaro. All rights reserved.
//

class Location: MappableObject {

  var address: String?
  var crossStreet: String?
  var distance: NSNumber?
  var lat: NSNumber?
  var lng: NSNumber?
  var cc: String?
  var postalCode: String?
  var city: String?
  var state: String?
  var country: String?
  var formattedAddress: [String]?
  
}