
#import "VSMarvelAuthentification.h"
#import "MarvelKeys.h"
#import <CommonCrypto/CommonDigest.h>

@interface VSMarvelAuthentification()

@property (nonatomic, strong, readwrite) NSString *timeStamp;
@property (nonatomic, strong, readwrite) NSString *publicKey;
@property (nonatomic, strong, readwrite) NSString *privateKey;
@end

@implementation VSMarvelAuthentification

-(NSString *(^)(NSString *))calculateMD5{
    if(!_calculateMD5){
        _calculateMD5 = ^(NSString *str){
            const char *cstr = [str UTF8String];
            
            unsigned char result[CC_MD5_DIGEST_LENGTH];
            
            CC_MD5(cstr, strlen(cstr), result);
            
            NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];
            for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
                [ret appendFormat:@"%02x",result[i]];
            }
            
            return [ret copy];
        };
        
    }
    return _calculateMD5;
}

-(NSString *)timeStamp{
    if(!_timeStamp){
        _timeStamp = @([NSDate date].timeIntervalSinceReferenceDate).stringValue;
    }
    return _timeStamp;
    
}

-(NSString *)publicKey{
    if(!_publicKey){
        _publicKey = MarvelPublicKey;
    }
    return _publicKey;
}

-(NSString *)privateKey{
    if(!_privateKey){
        _privateKey = MarvelPrivateKey;
    }
    return _privateKey;
}

-(NSString *)timeStampedKeys{
     return [NSString stringWithFormat:@"%@%@%@", self.timeStamp, self.privateKey, self.publicKey];
}

-(NSString *) MD5OfString:(NSString *)str{
    const char *cstr = [str UTF8String];
    
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(cstr, strlen(cstr), result);
    
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];
    for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02x",result[i]];
    }
    
    return [ret copy];
}

-(NSString *)urlParameters{
    return [NSString stringWithFormat:@"&ts=%@&apikey=%@&hash=%@",self.timeStamp,self.publicKey,self.calculateMD5([self timeStampedKeys])];
}
@end
