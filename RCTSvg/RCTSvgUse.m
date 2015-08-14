//
//  SVGUse.m
//  SVGReact
//
//  Created by Pavlo Aksonov on 07.08.15.
//  Copyright (c) 2015 Pavlo Aksonov. All rights reserved.
//

#import "RCTSvgUse.h"
#import "SVGAttributedObject.h"
#import "NSObject+Serialize.h"

@implementation RCTSvgUse

-(NSDictionary *)objParams {
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:[self asAttributes]];
    
    dict[@"xlink:href"] = self.xlinkHref;
    if (self.scale){
        dict[@"transform"] = [NSString stringWithFormat:@"scale(%@)", self.scale];
    }
    return @{kAttributesElementName: dict, kElementName: @"use"};
}


-(id) obj {
    if (!super.obj){
        GHRenderableObjectPlaceholder *p = [[GHRenderableObjectPlaceholder alloc] initWithDictionary:[self objParams]];
        [super setObj:p];
    }
    return super.obj;
}


@end
