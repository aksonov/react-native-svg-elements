//
//  RCTCircle.m
//  RCTSvg
//
//  Created by Pavlo Aksonov on 26.08.15.
//  Copyright (c) 2015 Pavlo Aksonov. All rights reserved.
//

#import "RCTSvgCircle.h"
#import "RCTSvgDynamicRenderer.h"
#import "RCTUtils.h"

@implementation RCTSvgCircle
-(NSDictionary *)objParams {
    return [RCTSvgElement objParams:@"circle" object:self];
}

-(SVGAttributedObject *)obj {
    GHRenderableObject *o = super.obj;
    if (!o){
        GHCircle *rect = [[GHCircle alloc] initWithDictionary:[self objParams]];
        super.obj = rect;
    }
    return super.obj;
}

-(void)drawRect:(CGRect)rect {
    [super drawRect:rect];
}


@end

@implementation RCTSvgCircleShadow
static css_dim_t RCTCircleMeasure(void *context, float width)
{
    RCTSvgCircleShadow *shadowView = (__bridge RCTSvgCircleShadow *)context;
    
    GHCircle *rect = [[GHCircle alloc] initWithDictionary:[RCTSvgElement objParams:@"circle" object:shadowView]];
    [[RCTSvgDynamicRenderer sharedInstace] addObject:rect forKey:shadowView.id];
    CGRect bounds = [rect getBoundingBoxWithSVGContext:[RCTSvgDynamicRenderer sharedInstace]];
    CGSize computedSize = CGSizeMake(bounds.size.width+bounds.origin.x+1,bounds.size.height+bounds.origin.y+1);//[layoutManager usedRectForTextContainer:textContainer].size;
    
    css_dim_t result;
    result.dimensions[CSS_WIDTH] = RCTCeilPixelValue(computedSize.width);
    result.dimensions[CSS_HEIGHT] = RCTCeilPixelValue(computedSize.height);
    return result;
}

- (void)fillCSSNode:(css_node_t *)node
{
    [super fillCSSNode:node];
    node->measure = RCTCircleMeasure;
    node->children_count = 0;
}

@end