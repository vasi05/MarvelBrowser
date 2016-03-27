//
//  VSMarvelAuthentificationTests.m
//  MarvelBrowser
//
//  Created by Vasile Croitoru on 27/03/16.
//  Copyright © 2016 Vasile Croitoru. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "VSMarvelAuthentification.h"
#import "TestingMarvelAuthentification.h"

@interface VSMarvelAuthentification (Testing)
@property (nonatomic, strong, readwrite) NSString *timeStamp;
@property (nonatomic, strong, readwrite) NSString *publicKey;
@property (nonatomic, strong, readwrite) NSString *privateKey;
@end

@interface VSMarvelAuthentificationTests : XCTestCase

@end

@implementation VSMarvelAuthentificationTests{
    VSMarvelAuthentification *sut;
}

-(void)setUp{
    [super setUp];
    sut = [[VSMarvelAuthentification alloc] init];
}

-(void)testURLParameters_ShouldHaveTimestampPublicKeyAndHash{
    
    TestingMarvelAuthentification *sutWithFakeMD5 = [[TestingMarvelAuthentification alloc] init];
    sutWithFakeMD5.timeStamp = @"Timestamp";
    sutWithFakeMD5.privateKey = @"Private";
    sutWithFakeMD5.publicKey = @"Public";
    
    NSString * parameters = [sutWithFakeMD5 urlParameters];
    
    XCTAssertEqualObjects(parameters,@"&ts=Timestamp&apikey=Public&hash=MD5TimestampPrivatePublicMD5");
    
}

-(void)testMD5String_ShouldYeldKnownResult{
    
    NSString * md5String = [sut MD5OfString:@"abc"];
    
    XCTAssertEqualObjects(md5String, @"900150983cd24fb0d6963f7d28e17f72");
}

-(void)testTimeStampedKeys_ShouldConcatenateTimeStampPrivateKeyPublicKey{
    
    sut.timeStamp = @"TimeStamp";
    sut.privateKey = @"Private";
    sut.publicKey = @"Public";

    XCTAssertEqualObjects(sut.timeStampedKeys, @"TimeStampPrivatePublic");
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
