//
//  SearchVenuesService.swift
//  WhitbreadTest
//
//  Created by Giuseppe Spadaro on 26/03/16.
//  Copyright © 2016 Giuseppe Spadaro. All rights reserved.
//

import Foundation
import EVReflection
import AFNetworking

protocol SearchVenuesService {
  func searchVenuesByPlace(placeName: String, completionBlock:(results: [Venue]?, error: NSError?) -> Void)
}

class DefaultSearchVenuesService {
  let manager = AFHTTPSessionManager(baseURL: NSURL(string: ConfigurationManager.sharedInstance.foursquareAPIBaseUrl()))
  let paramsBuilderService = DefaultParamsBuilderService()
}

extension DefaultSearchVenuesService : SearchVenuesService {
  
  func searchVenuesByPlace(placeName: String, completionBlock:(results: [Venue]?, error: NSError?) -> Void) {
    
    let params = paramsBuilderService.buildSearchParams(placeName)
    
    manager.GET("venues/search", parameters: params, progress: nil, success: { (operation, response) -> Void in

      let genericResponse = GenericResponse(dictionary: response as! NSDictionary)
      
      if let metaDataObject = genericResponse.meta {
        if let code = metaDataObject.code {
          if code == 200 {
            if let responseObject = genericResponse.response {
              if let venues = responseObject.venues {
                completionBlock(results: venues, error: nil)
              }
            }
          }
        }
      }
    
    }) { (operation, error) -> Void in
      print("Error: " + error.localizedDescription)
      completionBlock(results: nil, error: error)
    }
  }
}

