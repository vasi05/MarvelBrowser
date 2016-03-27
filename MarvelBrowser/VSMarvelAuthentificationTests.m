#import <XCTest/XCTest.h>
#import "VSMarvelAuthentification.h"

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


-(void)testURLParameters_ShouldHaveTimestampPublicKeyAndHashConcatenated{
    
    sut.timeStamp = @"Timestamp";
    sut.privateKey = @"Private";
    sut.publicKey = @"Public";
    sut.calculateMD5 = ^(NSString *str){return [NSString stringWithFormat:@"MD5%@MD5",str];};
    
    NSString * parameters = [sut urlParameters];
    
    XCTAssertEqualObjects(parameters,@"&ts=Timestamp&apikey=Public&hash=MD5TimestampPrivatePublicMD5");
    
}

-(void)testMD5String_ShouldYeldKnownResult{
    
    NSString * md5String = sut.calculateMD5(@"abc");
    
    XCTAssertEqualObjects(md5String, @"900150983cd24fb0d6963f7d28e17f72");
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
