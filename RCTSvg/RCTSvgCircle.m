//
//  RCTCircle.m
//  RCTSvg
//
//  Created by Pavlo Aksonov on 26.08.15.
//  Copyright (c) 2015 Pavlo Aksonov. All rights reserved.
//

#import "RCTSvgCircle.h"

@implementation RCTSvgCircle
-(NSDictionary *)objParams {
    NSMutableDictionary *map = [NSMutableDictionary dictionaryWithDictionary:[self asAttributes]];
    if (self.scale){
        map[@"transform"] = [NSString stringWithFormat:@"scale(%@)", self.scale];
    }
    return @{kAttributesElementName: map, kElementName: @"circle"};
}

-(SVGAttributedObject *)obj {
    self.contentMode = UIViewContentModeTop;
    self.userInteractionEnabled = NO;
    
    GHRenderableObject *o = super.obj;
    if (!o){
        GHCircle *rect = [[GHCircle alloc] initWithDictionary:[self objParams]];
        super.obj = rect;
        [self setNeedsDisplay];
    }
    return super.obj;
}


@end
