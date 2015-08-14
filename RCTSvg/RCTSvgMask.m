//
//  SVGMask.m
//  SVGReact
//
//  Created by Pavlo Aksonov on 07.08.15.
//  Copyright (c) 2015 Pavlo Aksonov. All rights reserved.
//

#import "RCTSvgMask.h"

@implementation RCTSvgMask

- (void)insertReactSubview:(UIView *)subview atIndex:(NSInteger)atIndex
{
    // will not insert because we don't need to draw them
    [super insertSubview:subview atIndex:atIndex];
    
    // just add them to registry
    if ([subview isKindOfClass:[RCTSvgElement class]]){
        child = [((RCTSvgElement *)subview) objParams];
    }
    [self prepare];
}

-(NSDictionary *)objParams {
    NSDictionary *dict = [self asAttributes];
    return @{kAttributesElementName : dict, kContentsElementName: @[child], kElementName: @"mask"};
}


-(id) obj {
    if (!super.obj){
        GHMask *p = [[GHMask alloc] initWithDictionary:[self objParams]];
        [super setObj:p];
    }
    return super.obj;
}

-(void)drawRect:(CGRect)rect {
    [super drawRect:rect];
}


@end
