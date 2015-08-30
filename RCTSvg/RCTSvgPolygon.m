//
//  RCTSvgPolygon.m
//  RCTSvg
//
//  Created by Pavlo Aksonov on 30.08.15.
//  Copyright (c) 2015 Pavlo Aksonov. All rights reserved.
//

#import "RCTSvgPolygon.h"

@implementation RCTSvgPolygon
-(NSDictionary *)objParams {
    return [RCTSvgElement objParams:@"polygon" object:self];
}

-(SVGAttributedObject *)obj {
    GHRenderableObject *o = super.obj;
    if (!o){
        GHPolygon *rect = [[GHPolygon alloc] initWithDictionary:[self objParams]];
        super.obj = rect;
        [self setNeedsDisplay];
    }
    return super.obj;
}
@end

@implementation RCTSvgPolygonShadow
static css_dim_t RCTRectMeasure(void *context, float width)
{
    RCTSvgPolygonShadow *shadowView = (__bridge RCTSvgPolygonShadow *)context;
    
    GHPolygon *rect = [[GHPolygon alloc] initWithDictionary:[RCTSvgElement objParams:@"polygon" object:shadowView]];
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