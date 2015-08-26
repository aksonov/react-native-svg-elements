//
//  RCTSvgRect.m
//  RCTSvg
//
//  Created by Pavlo Aksonov on 25.08.15.
//  Copyright (c) 2015 Pavlo Aksonov. All rights reserved.
//

#import "RCTSvgRect.h"

@implementation RCTSvgRect

-(NSDictionary *)objParams {
    NSMutableDictionary *map = [NSMutableDictionary dictionaryWithDictionary:[self asAttributes]];
    if (self.scale){
        map[@"transform"] = [NSString stringWithFormat:@"scale(%@)", self.scale];
    }
    return @{kAttributesElementName: map, kElementName: @"rect"};
}

-(SVGAttributedObject *)obj {
    GHRenderableObject *o = super.obj;
    if (!o){
        GHRectangle *rect = [[GHRectangle alloc] initWithDictionary:[self objParams]];
        //path.transform = CGAffineTransformMakeScale(self.scale, self.scale);
        
        super.obj = rect;
        [self setNeedsDisplay];
        //        self.bounds =  CGRectMake(0, 0, bounds.size.width*self.scale, bounds.size.height*self.scale);
        //        self.bounds =  CGRectMake(bounds.origin.x * self.scale,  bounds.origin.y * self.scale, bounds.size.width*self.scale, bounds.size.height*self.scale);
    }
    return super.obj;
}

@end
