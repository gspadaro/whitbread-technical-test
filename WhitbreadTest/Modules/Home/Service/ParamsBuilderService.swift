//
//  ParamsBuilderService.swift
//  WhitbreadTest
//
//  Created by Giuseppe Spadaro on 26/03/16.
//  Copyright © 2016 Giuseppe Spadaro. All rights reserved.
//

import Foundation

protocol ParamsBuilderService {
  func buildSearchParams(text: String) -> [String:String]
}

class DefaultParamsBuilderService {
}

extension DefaultParamsBuilderService : ParamsBuilderService {
  
  func buildSearchParams(text: String) -> [String:String] {
    
    var params = [String:String]()
    params["client_id"] = ConfigurationManager.sharedInstance.foursquareClientId()
    params["client_secret"] = ConfigurationManager.sharedInstance.foursquareClientSecret()
    params["v"] = ConfigurationManager.sharedInstance.foursquareAPIVersion()
    params["near"] = text
    
    return params
  }

}
