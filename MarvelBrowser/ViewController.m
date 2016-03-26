
#import "ViewController.h"
#import "MarvelKeys.h"
#import <CommonCrypto/CommonDigest.h>

@interface ViewController ()<NSURLSessionDataDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *timestamp = @"1";
    NSString *keys = [NSString stringWithFormat:@"%@%@%@",timestamp,MarvelPrivateKey,MarvelPublicKey];
    char const *keyString = [keys UTF8String];
    
    NSLog(@"keys : %s",keyString);
    
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(keyString, strlen(keyString), result);
    
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];
    for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02x",result[i]];
    }
    NSLog(@"ret : %@",ret);
    
    NSString *URLString = [NSString stringWithFormat:
                           @"https://gateway.marvel.com/v1/public/characters?nameStartsWith=Spider&ts=%@&apikey=%@&hash=%@",
                           timestamp, MarvelPublicKey, ret];
    NSLog(@"%@", URLString);
    
    NSURLSessionConfiguration * configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    
    NSURLSessionDataTask * dataTask = [session dataTaskWithURL:[NSURL URLWithString:URLString] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"Data: %@", [NSJSONSerialization JSONObjectWithData:data options:nil error:nil]);
        NSLog(@"Response: %@", response);
        NSLog(@"Error: %@", error);
    }];
    [dataTask resume];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
