//
//  RCTSvgRect.m
//  RCTSvg
//
//  Created by Pavlo Aksonov on 25.08.15.
//  Copyright (c) 2015 Pavlo Aksonov. All rights reserved.
//

#import "RCTSvgRect.h"
#import "UIView+React.h"

@implementation RCTSvgRect

-(NSDictionary *)objParams {
    return [RCTSvgElement objParams:@"rect" object:self];
}

-(SVGAttributedObject *)obj {
    GHRenderableObject *o = super.obj;
    if (!o){
        GHRectangle *rect = [[GHRectangle alloc] initWithDictionary:[self objParams]];
        super.obj = rect;
        [self setNeedsDisplay];
    }
    return super.obj;
}
@end

@implementation RCTSvgRectShadow
static css_dim_t RCTRectMeasure(void *context, float width)
{
    RCTSvgRectShadow *shadowView = (__bridge RCTSvgRectShadow *)context;
    
    GHRectangle *rect = [[GHRectangle alloc] initWithDictionary:[RCTSvgElement objParams:@"rect" object:shadowView]];
    [[RCTSvgDynamicRenderer sharedInstace] addObject:rect forKey:shadowView.id];
    CGRect bounds = [rect getBoundingBoxWithSVGContext:[RCTSvgDynamicRenderer sharedInstace]];
    CGSize computedSize = CGSizeMake(bounds.size.width+bounds.origin.x,bounds.size.height+bounds.origin.y);
    
    css_dim_t result;
    result.dimensions[CSS_WIDTH] = RCTCeilPixelValue(computedSize.width);
    result.dimensions[CSS_HEIGHT] = RCTCeilPixelValue(computedSize.height);
    return result;
}

- (void)fillCSSNode:(css_node_t *)node
{
    [super fillCSSNode:node];
    node->measure = RCTRectMeasure;
    node->children_count = 0;
}


@end