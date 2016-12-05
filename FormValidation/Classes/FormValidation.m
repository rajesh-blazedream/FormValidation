//
//  FormValidation.m
//  StayPleasure
//
//  Created by Rajesh on 29/12/14.
//  Copyright (c) 2014 Rajesh. All rights reserved.
//

#import "FormValidation.h"

@implementation FormValidation

+ (BOOL)validateEmailID:(NSString *) emailString
{
    if([emailString length]==0)
    {
        return NO;
    }
    NSString *regExPattern = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSRegularExpression *regEx = [[NSRegularExpression alloc] initWithPattern:regExPattern options:NSRegularExpressionCaseInsensitive error:nil];
    NSUInteger regExMatches = [regEx numberOfMatchesInString:emailString options:0 range:NSMakeRange(0, [emailString length])];
    
    if (regExMatches == 0)
    {
        return NO;
    }
    else
    {
        return YES;
    }
}


+ (BOOL)ValidateStrongPassword:(NSString *)password
{
    BOOL lowerCaseLetter = '\0', upperCaseLetter = '\0',digit = '\0',specialCharacter = '\0';
   if (password.length >=6)
   {
    for (int i = 0; i < [password length]; i++)
    {
        unichar c = [password characterAtIndex:i];
        if(!lowerCaseLetter)
        {
            lowerCaseLetter = [[NSCharacterSet lowercaseLetterCharacterSet] characterIsMember:c];
        }
        if(!upperCaseLetter)
        {
            upperCaseLetter = [[NSCharacterSet uppercaseLetterCharacterSet] characterIsMember:c];
        }
        if(!digit)
        {
            digit = [[NSCharacterSet decimalDigitCharacterSet] characterIsMember:c];
        }
        if(!specialCharacter)
        {
            specialCharacter = [[NSCharacterSet symbolCharacterSet] characterIsMember:c];
        }
    }
           return YES;
    }
    else
    {

        return NO;
    }
}

+ (BOOL)validateString:(NSString *) string
{
    NSCharacterSet *myCharSet = [NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz "];
    for (int i = 0; i < [string length]; i++)
    {
        unichar c = [string characterAtIndex:i];
        if (![myCharSet characterIsMember:c])
        {
            return NO;
        }
    }
    return YES;
    /*
    NSRange whiteSpaceRange = [string rangeOfCharacterFromSet:[NSCharacterSet whitespaceCharacterSet]];
    if (whiteSpaceRange.location != NSNotFound) {
        return NO;
    }
    return YES;
    */
    
    /*
    NSString *trimmed = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([trimmed length] == 0)
    {
        return NO;
    }
    else
    {
        //validatedString = trimmed;
        return YES;
    }*/
}
/*
 -(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
 {
 if(textField==YOUR_USER_NAME_TEXTFIELD || textField == YOUR_PASSWORD_TEXTFIELD)
 {
 

 
 return YES;
 }
 
 return YES;
 }
 */
+ (BOOL)isOnlyAlphabets:(NSString *)string
{
    NSString *regex = @"[A-Za-z]+";
    NSPredicate *onlyAlpha = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL result =  [onlyAlpha evaluateWithObject:string];//[string uppercaseString]];
    return result;
}

+ (BOOL)isOnlyNumeric:(NSString *)string
{
    NSString *regex = @"[0-9]+";
    NSPredicate *onlyAlpha = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL result =  [onlyAlpha evaluateWithObject:string];//[string uppercaseString]];
    return result;
}

+ (NSString *)trimString: (NSString *)string
{
    return [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

+ (NSString *)trimWhiteSpace: (NSString *)string
{
    return [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

+ (NSString *)trimOnlyWhiteSpace: (NSString *)string
{
    return [string stringByReplacingOccurrencesOfString:@" " withString:@""];
}


+ (NSString *)FirstLetterCaps:(NSString *)string
{
    if (string.length >1) {
        return [string stringByReplacingCharactersInRange:NSMakeRange(0,1) withString:[[string substringToIndex:1] capitalizedString]];
    }
    return string;
}
+ (NSString *)jsonStringFromObjct:(id)object
{
    NSError *writeError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:&writeError];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}


@end
