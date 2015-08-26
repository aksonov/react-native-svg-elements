//
//  NSObject+Serialize.m
//  SVGReact
//
//  Created by Pavlo Aksonov on 06.08.15.
//  Copyright (c) 2015 Pavlo Aksonov. All rights reserved.
//

#import "NSObject+Serialize.h"
#import <objc/runtime.h>

@implementation NSObject(Serialize)

+(NSString *)transformKey:(NSString *)key{
    NSError *error;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"([a-z])([A-Z])" options:0 error:&error];
    NSString *modifiedString = [regex stringByReplacingMatchesInString:key options:0 range:NSMakeRange(0, [key length]) withTemplate:@"$1-$2"];
    if ([modifiedString hasPrefix:@"_"]){
        modifiedString = [modifiedString substringFromIndex:1];
    }
    return [modifiedString lowercaseString];
}

-(NSDictionary *) asAttributes {
    NSDictionary *res = [self asDictionary];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    for (NSString *key in [res allKeys]){
        dict[[NSObject transformKey:key]] = res[key];
    }
    return [NSDictionary dictionaryWithDictionary:dict];
}
-(NSDictionary *) asDictionary {
    return [NSObject dictionaryWithPropertiesOfObject:self];
}

+(NSDictionary *) dictionaryWithPropertiesOfObject:(id)obj
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    unsigned count;
    objc_property_t *properties = class_copyPropertyList([obj class], &count);
    
    for (int i = 0; i < count; i++) {
        NSString *key = [NSString stringWithUTF8String:property_getName(properties[i])];
        Class classObject = NSClassFromString([key capitalizedString]);
        if (classObject) {
            id subObj = [self dictionaryWithPropertiesOfObject:[obj valueForKey:key]];
            [dict setObject:subObj forKey:key];
        }
        else
        {
            id value = [obj valueForKey:key];
            if(value) [dict setObject:value forKey:key];
        }
    }
    
    free(properties);
    
    return [NSDictionary dictionaryWithDictionary:dict];
}

@end
