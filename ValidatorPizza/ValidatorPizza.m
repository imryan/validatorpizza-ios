//
//  ValidatorPizza.m
//  ValidatorPizza
//
//  Created by Ryan Cohen on 6/30/17.
//  Copyright © 2017 Ryan Cohen. All rights reserved.
//

#import "ValidatorPizza.h"

NSString * const kValidatorPizzaCheckURL  = @"https://www.validator.pizza/%@/%@";

@implementation ValidatorPizza

# pragma mark - Validation

+ (void)validate:(NSString *)value type:(VPCheckType)type block:(VPResultBlock)block
{
    NSString *urlString = [NSString stringWithFormat:kValidatorPizzaCheckURL, (type == VPCheckTypeEmail ? @"email" : @"domain"), value];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    [[session dataTaskWithURL:[NSURL URLWithString:urlString] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (!error) {
            NSDictionary *responseObject = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            BOOL isValid = ([responseObject[@"status"] intValue] == 200);
            
            block(isValid, responseObject, nil);
        } else {
            block(NO, nil, error);
        }
    }] resume];
}

@end
