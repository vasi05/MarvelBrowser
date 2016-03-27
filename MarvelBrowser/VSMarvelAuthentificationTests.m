//
//  VSMarvelAuthentificationTests.m
//  MarvelBrowser
//
//  Created by Vasile Croitoru on 27/03/16.
//  Copyright © 2016 Vasile Croitoru. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "VSMarvelAuthentification.h"

@interface VSMarvelAuthentificationTests : XCTestCase

@end

@implementation VSMarvelAuthentificationTests

-(void)testTimeStamp_ShouldChangeEveryCall{
    
    NSString *timeStamp1 = [VSMarvelAuthentification timeStamp];
    NSString *timeStamp2 = [VSMarvelAuthentification timeStamp];
    
    XCTAssertNotEqualObjects(timeStamp1, timeStamp2);
}

-(void)testPublicKey_shouldHave32Characters{
    NSString *publicKey = [VSMarvelAuthentification publicKey];
    
    XCTAssertEqual(publicKey.length, 32);
}

-(void)testPrivateKey_shouldHave40Characters{
    NSString *privateKey = [VSMarvelAuthentification privateKey];
    
    XCTAssertEqual(privateKey.length, 40);
}

@end
