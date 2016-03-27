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

@implementation VSMarvelAuthentificationTests{
    VSMarvelAuthentification *sut;
}

-(void)setUp{
    [super setUp];
    sut = [[VSMarvelAuthentification alloc] init];
}

-(void)testTimeStamp_ShouldChangeAcrossDiferentInstances{
    
    VSMarvelAuthentification *sut2 = [[VSMarvelAuthentification alloc] init];
    NSString *timeStamp1 = sut.timeStamp;
    NSString *timeStamp2 = sut2.timeStamp;
    
    XCTAssertNotEqualObjects(timeStamp1, timeStamp2);
}

-(void)testTimeStamp_ShouldNotChangeAcrossSameInstance{

    NSString *timeStamp1 = sut.timeStamp;
    NSString *timeStamp2 = sut.timeStamp;
    
    XCTAssertEqualObjects(timeStamp1, timeStamp2);
}

-(void)testPublicKey_shouldHave32Characters{
   
    NSString *publicKey = sut.publicKey;
    
    XCTAssertEqual(publicKey.length, 32);
}

-(void)testPrivateKey_shouldHave40Characters{
  
    NSString *privateKey = sut.privateKey;
    
    XCTAssertEqual(privateKey.length, 40);
}

@end
