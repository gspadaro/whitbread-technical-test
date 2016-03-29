//
//  Statistic.swift
//  WhitbreadTest
//
//  Created by Giuseppe Spadaro on 26/03/16.
//  Copyright © 2016 Giuseppe Spadaro. All rights reserved.
//

class Statistic: MappableObject {
  
  var checkinsCount: NSNumber?
  var usersCount: NSNumber?
  var tipCount: NSNumber?
  
  
  func getCheckInNumberFormatted() -> Int {
    guard let checkinsCount = checkinsCount else {
      return 0
    }
    return checkinsCount.integerValue
  }
  
}


