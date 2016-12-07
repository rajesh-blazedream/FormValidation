//
//  FormValidation.h
//  StayPleasure
//
//  Created by Rajesh on 29/12/14.
//  Copyright (c) 2014 Rajesh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FormValidation : NSObject

+ (BOOL)validateString: (NSString *)string;
+ (BOOL)validateEmailID: (NSString *)emailString;
+ (BOOL)isOnlyAlphabets:(NSString *)string;
+ (BOOL)isOnlyNumeric:(NSString *)string;
+ (BOOL)isOnlyAlphaAndNumeric:(NSString *)string;
+ (NSString *)trimWhiteSpace: (NSString *)string;
+ (NSString *)trimOnlyWhiteSpace: (NSString *)string;
+ (NSString *)trimString: (NSString *)string;
+ (NSString *)FirstLetterCaps :(NSString *)string;
+ (BOOL)ValidateStrongPassword:(NSString *)password;
+ (NSString *)jsonStringFromObjct:(id)object;
+(NSString*)getFirstCharFromString:(NSString*)str;
+(BOOL)validateUrlString:(NSString*)urlString;
+(NSString*)removeFirstCharFromString:(NSString*)string;
+(NSString*)removeLastCharFromString:(NSString*)string;
+ (NSString *)trimTab: (NSString *)string;


@end
