//
//  SVGMask.m
//  SVGReact
//
//  Created by Pavlo Aksonov on 07.08.15.
//  Copyright (c) 2015 Pavlo Aksonov. All rights reserved.
//

#import "RCTSvgMask.h"
#import "RCTSvgElement.h"
#import "RCTSvg.h"

@implementation RCTSvgMask

-(void)setFill:(NSString * __nullable)fill {
    _fill = fill;
    // register
}

- (void)insertReactSubview:(UIView *)subview atIndex:(NSInteger)atIndex
{
    // will not insert because we don't need to draw them
    //[super insertSubview:subview atIndex:atIndex];
    
    // just add them to registry
    if ([subview conformsToProtocol:@protocol(SVGRenderable)]){
        child = [subview performSelector:@selector(objParams)];
    }
    
}

-(void)setRenderer:(RCTSvgDynamicRenderer * __nullable)renderer {
    _renderer = renderer;
    [[RCTSvgDynamicRenderer sharedInstace] addObject:[self obj] forKey:[[self obj] attributes][@"id"]];
    [renderer addObject:[self obj] forKey:[[self obj] attributes][@"id"]];
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



@end
