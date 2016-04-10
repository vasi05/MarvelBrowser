//
//  AcceptanceTests.m
//  AcceptanceTests
//
//  Created by Vasile Croitoru on 03/04/16.
//  Copyright © 2016 Vasile Croitoru. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "VSMarvelAuthentification.h"

@interface AcceptanceTests : XCTestCase

@end

@implementation AcceptanceTests

-(void)testCallToMarvel_ShouldGetHTTPStatusCode200
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"Testing CallToMarvel_ShouldGetStatus"];
    
    VSMarvelAuthentification * sut = [[VSMarvelAuthentification alloc] init];
    NSString *validQueryMissingAuthentification = @"https://gateway.marvel.com/v1/public/characters?nameStartsWith=Spider";
    NSURL *validQueryURL = [NSURL URLWithString:[validQueryMissingAuthentification stringByAppendingString:[sut urlParameters]]];
    
    __block NSHTTPURLResponse * httpResponse;
    
    [self startGetRequestToURL:validQueryURL withCompletionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        httpResponse = (NSHTTPURLResponse *)response;
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:5.0f handler:^(NSError * _Nullable error) {
        XCTAssertEqualObjects(@200, [NSNumber numberWithInteger:httpResponse.statusCode]);
    }];
    
}


-(void)startGetRequestToURL:(NSURL *)url withCompletionHandler:(void(^)(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error))completionHandler
{
    NSURLSessionConfiguration * sessionConnfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConnfig
                                                          delegate:nil
                                                     delegateQueue:nil];

    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url
                                            completionHandler:completionHandler];
    
    [dataTask resume];

    
}

@end
