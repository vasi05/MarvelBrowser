
#import <Foundation/Foundation.h>

@interface VSMarvelAuthentification : NSObject

@property (nonatomic, strong, readonly) NSString *timeStamp;
@property (nonatomic, strong, readonly) NSString *publicKey;
@property (nonatomic, strong, readonly) NSString *privateKey;
@property (nonatomic, strong) NSString *(^calculateMD5)(NSString *);

-(NSString *) urlParameters;

@end
