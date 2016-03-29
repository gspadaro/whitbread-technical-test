//
//  Category.swift
//  WhitbreadTest
//
//  Created by Giuseppe Spadaro on 26/03/16.
//  Copyright © 2016 Giuseppe Spadaro. All rights reserved.
//


class Category: MappableObject {
  
  var categoryId: String?
  var name: String?
  var pluralName: String?
  var shortName: String?
  var icon: Icon?
  var primary: NSNumber?
  
  override internal func propertyMapping() -> [(String?, String?)] {
    return [("categoryId","id")]
  }

}