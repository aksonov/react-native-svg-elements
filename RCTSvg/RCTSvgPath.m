//
//  RCTSvgPath.m
//  RCTSvg
//
//  Created by Pavlo Aksonov on 13.08.15.
//  Copyright (c) 2015 Pavlo Aksonov. All rights reserved.
//

#import "RCTSvgPath.h"

@implementation RCTSvgPath

-(NSDictionary *)objParams {
    NSMutableDictionary *map = [NSMutableDictionary dictionaryWithDictionary:[self asAttributes]];
    if (self.scale){
        map[@"transform"] = [NSString stringWithFormat:@"scale(%@)", self.scale];
    }
    return @{kAttributesElementName: map, kElementName: @"path"};
}

-(void)setD:(NSString * __nullable)d {
    _d = d;
    super.obj = nil;
    [self prepare];
}

-(SVGAttributedObject *)obj {
    GHRenderableObject *o = super.obj;
    if (!o){
        GHPath *path = [[GHPath alloc] initWithDictionary:[self objParams]];
        //path.transform = CGAffineTransformMakeScale(self.scale, self.scale);
        CGRect bounds = CGPathGetBoundingBox(path.quartzPath);
        
        super.obj = path;
        [self setNeedsDisplay];
        //        self.bounds =  CGRectMake(0, 0, bounds.size.width*self.scale, bounds.size.height*self.scale);
        //        self.bounds =  CGRectMake(bounds.origin.x * self.scale,  bounds.origin.y * self.scale, bounds.size.width*self.scale, bounds.size.height*self.scale);
    }
    return super.obj;
}


@end
