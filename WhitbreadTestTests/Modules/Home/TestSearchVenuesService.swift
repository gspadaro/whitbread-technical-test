//
//  TestSearchVenuesService.swift
//  WhitbreadTest
//
//  Created by Giuseppe Spadaro on 28/03/16.
//  Copyright © 2016 Giuseppe Spadaro. All rights reserved.
//

import XCTest
import OHHTTPStubs
@testable import WhitbreadTest

class TestFoursquareService: XCTestCase {
  
  var searchVenuesService: DefaultSearchVenuesService?
  
  override func setUp() {
    super.setUp()
    searchVenuesService = DefaultSearchVenuesService()
  }
  
  override func tearDown() {
    OHHTTPStubs.removeAllStubs()
    super.tearDown()
  }
  
  func matchTicketRequest(request:NSURLRequest) -> Bool {
    return true
  }
  
  func testWhenServerReturnInternalServerError_shouldReturnError() {
    let expectation = self.expectationWithDescription("Service returned right error")
    OHHTTPStubs.stubRequestsPassingTest(matchTicketRequest, withStubResponse: stubFor500)
    
    if let searchVenuesService = searchVenuesService {
      searchVenuesService.searchVenuesByPlace("London", completionBlock: { (results, error) -> Void in
        XCTAssertNil(results)
        expectation.fulfill()
      })
    }
    self.waitForExpectationsWithTimeout(5.0, handler: nil)
  }
  
  func testWhenInternetIsDown_shouldReturnGenericError() {
    let expectation = self.expectationWithDescription("Service returned right error")
    OHHTTPStubs.stubRequestsPassingTest(matchTicketRequest, withStubResponse: stubForDownNetwork)
    
    if let searchVenuesService = searchVenuesService {
      searchVenuesService.searchVenuesByPlace("London", completionBlock: { (results, error) -> Void in
        XCTAssertNil(results)
        expectation.fulfill()
      })
    }
    self.waitForExpectationsWithTimeout(5.0, handler: nil)
  }
  
  func testWhenServerReturnBadRequest_shouldReturnInvalidParameterError() {
    let expectation = self.expectationWithDescription("Service returned right error")
    OHHTTPStubs.stubRequestsPassingTest(matchTicketRequest, withStubResponse: stubFor400)
    
    if let searchVenuesService = searchVenuesService {
      searchVenuesService.searchVenuesByPlace("London", completionBlock: { (results, error) -> Void in
        XCTAssertNil(results)
        expectation.fulfill()
      })
    }
    self.waitForExpectationsWithTimeout(5.0, handler: nil)
  }
  
  func testWhenServerReturnVenues_shouldReturnTicket() {
    let expectation = self.expectationWithDescription("Service returned ticket")
    OHHTTPStubs.stubRequestsPassingTest(matchTicketRequest, withStubResponse: stubFor200)
    
    if let searchVenuesService = searchVenuesService {
      searchVenuesService.searchVenuesByPlace("London", completionBlock: { (results, error) -> Void in
        XCTAssertNil(error)
        XCTAssertNotNil(results)
        expectation.fulfill()
      })
    }
    
    self.waitForExpectationsWithTimeout(5.0, handler: nil)
  }
  
  // MARK: Stubs for response case
  
  func stubFor500(request:NSURLRequest) -> OHHTTPStubsResponse {
    let stubPath = OHPathForFile("TestSearchVenuesService500.json", self.dynamicType)
    return OHHTTPStubsResponse(fileAtPath: stubPath!, statusCode: 500, headers: ["Content-Type":"application/json"])
  }
  
  func stubForDownNetwork(request: NSURLRequest) -> OHHTTPStubsResponse {
    let notConnectedError = NSError(domain:NSURLErrorDomain, code:Int(CFNetworkErrors.CFURLErrorNotConnectedToInternet.rawValue), userInfo:nil)
    return OHHTTPStubsResponse(error:notConnectedError)
  }
  
  func stubFor400(request:NSURLRequest) -> OHHTTPStubsResponse {
    let stubPath = OHPathForFile("TestSearchVenuesService400.json", self.dynamicType)
    return OHHTTPStubsResponse(fileAtPath: stubPath!, statusCode: 401, headers: ["Content-Type":"application/json"])
  }
  
  func stubFor200(request:NSURLRequest) -> OHHTTPStubsResponse {
    let stubPath = OHPathForFile("TestSearchVenuesService200.json", self.dynamicType)
    return OHHTTPStubsResponse(fileAtPath: stubPath!, statusCode: 200, headers: ["Content-Type":"application/json"])
  }
  
}
