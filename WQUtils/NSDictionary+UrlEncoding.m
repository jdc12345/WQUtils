//
//  NSDictionary+UrlEncoding.m
//  JZTools
//
//  Created by jack zhou on 14-2-21.
//  Copyright (c) 2014年 JZ. All rights reserved.
//

#import "NSDictionary+UrlEncoding.h"


// helper function: get the string form of any object
static NSString *toString(id object) {
    return [NSString stringWithFormat: @"%@", object];
}
// helper function: get the url encoded string form of any object
static NSString *urlEncode(id object) {
    NSString *string = toString(object);
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated"
     return [string stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
#pragma clang diagnostic pop
   
}

@implementation NSDictionary (UrlEncoding)
- (NSString*) urlEncodedString {
    NSMutableArray *parts = [NSMutableArray array];
    for (id key in self) {
        id value = [self objectForKey: key];
        NSString *part = [NSString stringWithFormat: @"%@=%@", urlEncode(key), urlEncode(value)];
        [parts addObject: part];
    }
    return [parts componentsJoinedByString: @"&"];
}

@end
