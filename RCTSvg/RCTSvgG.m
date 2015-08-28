//
//  SVGG.m
//  SVGReact
//
//  Created by Pavlo Aksonov on 07.08.15.
//  Copyright (c) 2015 Pavlo Aksonov. All rights reserved.
//

#import "RCTSvgG.h"

@implementation RCTSvgG

-(id)init {
    self = [super init];
    children = [NSMutableArray array];
    return self;
}

@end

@implementation RCTSvgGShadow
static css_dim_t RCTGMeasure(void *context, float width)
{
    RCTSvgGShadow *shadowView = (__bridge RCTSvgGShadow *)context;
    
//    GHCircle *rect = [[GHCircle alloc] initWithDictionary:[RCTSvgElement objParams:@"circle" object:shadowView]];
//    [[RCTSvgDynamicRenderer sharedInstace] addObject:rect forKey:shadowView.id];
//    CGRect bounds = [rect getBoundingBoxWithSVGContext:[RCTSvgDynamicRenderer sharedInstace]];
    CGSize computedSize = CGSizeMake(400, 400);
//    CGSize computedSize = CGSizeMake(bounds.size.width+bounds.origin.x+1,bounds.size.height+bounds.origin.y+1);//[layoutManager usedRectForTextContainer:textContainer].size;
    
    css_dim_t result;
    result.dimensions[CSS_WIDTH] = RCTCeilPixelValue(computedSize.width);
    result.dimensions[CSS_HEIGHT] = RCTCeilPixelValue(computedSize.height);
    return result;
}

-(void)insertReactSubview:(id<RCTViewNodeProtocol>)subview atIndex:(NSInteger)atIndex {
    [super insertReactSubview:subview atIndex:atIndex];
    [children addObject:subview];
}
- (void)fillCSSNode:(css_node_t *)node
{
    [super fillCSSNode:node];
    node->measure = RCTGMeasure;
    node->children_count = 0;

}

@end