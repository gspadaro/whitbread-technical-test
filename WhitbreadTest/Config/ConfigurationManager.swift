//
//  ConfigurationManager.swift
//  WhitbreadTest
//
//  Created by Giuseppe Spadaro on 26/03/16.
//  Copyright © 2016 Giuseppe Spadaro. All rights reserved.
//

import UIKit

class ConfigurationManager: NSObject {
  
  var deploymentEnv = ""
  var appSettings = [String:AnyObject]()
  
  class var sharedInstance: ConfigurationManager {
    
    struct Singleton {
      static let instance = ConfigurationManager()
    }
    return Singleton.instance
  }
  
  override init() {
    if let path = NSBundle.mainBundle().pathForResource("AppSettings", ofType: "plist") {
      if let dict = NSDictionary(contentsOfFile: path) as? [String: AnyObject] {
        appSettings = dict
        deploymentEnv = appSettings["DeploymentEnvironment"] as! String
      }
    }
  }
  
  func environmentSettingValue(key: String) -> String {
    let keypath = String(format: "%@.%@", key, deploymentEnv)
    return (appSettings as NSDictionary).valueForKeyPath(keypath) as! String
  }
  
  func foursquareAPIBaseUrl() -> String {
    return environmentSettingValue("FoursquareAPIBaseUrl")
  }
  
  func foursquareClientId() -> String {
    return environmentSettingValue("FoursquareClientId")
  }
  
  func foursquareClientSecret() -> String {
    return environmentSettingValue("FoursquareClientSecret")
  }
  
  func foursquareAPIVersion() -> String {
    return environmentSettingValue("FoursquareAPIVersion")
  }
}