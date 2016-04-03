

#import <XCTest/XCTest.h>
#import "VSMarvelAuthentification.h"

@interface AcceptanceTests : XCTestCase

@end

@implementation AcceptanceTests

-(void)testCallToMarvel_ShouldGetStatuss200OK
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"Testing CallToMarvel_ShouldGetStatus"];
    
    VSMarvelAuthentification * sut = [[VSMarvelAuthentification alloc] init];
    NSString *URLString = [@"https://gateway.marvel.com/v1/public/characters?nameStartsWith=Spider"
                           stringByAppendingString:[sut urlParameters]];
    NSURL *url = [NSURL URLWithString:URLString];
    NSURLSessionConfiguration * sessionConnfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConnfig
                                                          delegate:nil
                                                     delegateQueue:nil];
    
    __block NSHTTPURLResponse * httpResponse;
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url
                                            completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                    httpResponse = (NSHTTPURLResponse *)response;
                                                   [expectation fulfill];
                                            }];
    
    [dataTask resume];
    
    [self waitForExpectationsWithTimeout:5000.0f handler:^(NSError * _Nullable error) {
        XCTAssertEqualObjects(@200, [NSNumber numberWithInteger:httpResponse.statusCode]);
    }];
    
}

@end
