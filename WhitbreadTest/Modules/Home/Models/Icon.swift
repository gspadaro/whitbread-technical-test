//
//  Icon.swift
//  WhitbreadTest
//
//  Created by Giuseppe Spadaro on 26/03/16.
//  Copyright © 2016 Giuseppe Spadaro. All rights reserved.
//

class Icon: MappableObject {
  
  let kBG = "bg"
  let kSize = "44"
  
  var prefix: String?
  var suffix: String?
  
  /*
  *  Forusquare API https://developer.foursquare.com/docs/responses/category
  *  Pieces needed to construct category icons at various sizes.
  *  Combine prefix with a size (32, 44, 64, and 88 are available) and suffix, e.g. https://foursquare.com/img/categories/food/default_64.png.
  *  To get an image with a gray background, use bg_ before the size, e.g. https://foursquare.com/img/categories_v2/food/icecream_bg_32.png.
  */
  
  func getCompleteIconImageUrl() -> NSURL? {
    guard let prefix = prefix, let suffix = suffix else {
      return nil
    }
    return NSURL(string: String(format: "%@%@_%@%@", prefix, kBG, kSize, suffix))
  }
  
}