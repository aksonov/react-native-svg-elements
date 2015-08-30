//
//  RCTCircle.m
//  RCTSvg
//
//  Created by Pavlo Aksonov on 26.08.15.
//  Copyright (c) 2015 Pavlo Aksonov. All rights reserved.
//

#import "RCTSvgEllipse.h"
#import "RCTSvgDynamicRenderer.h"
#import "RCTUtils.h"

@implementation RCTSvgEllipse
-(NSDictionary *)objParams {
    return [RCTSvgElement objParams:@"ellipse" object:self];
}

- (void)drawRect:(CGRect)rect {
    GHEllipse *base = [[GHEllipse alloc] initWithDictionary:[self objParams]];
    RCTSvgElement *element = [[RCTSvgElement alloc] initWithFrame: self.frame];
    element.obj = base;
    element.frame = CGRectMake(-100, -100, self.frame.size.width + 100, self.frame.size.height + 100);
    element.x = 100;
    element.y = 100;
    self.backgroundColor = [UIColor clearColor];

    
    [self addSubview:element];
    [super drawRect:rect];
}

@end

@implementation RCTSvgEllipseShadow
static css_dim_t RCTCircleMeasure(void *context, float width)
{
    RCTSvgEllipseShadow *shadowView = (__bridge RCTSvgEllipseShadow *)context;
    
    GHEllipse *rect = [[GHEllipse alloc] initWithDictionary:[RCTSvgElement objParams:@"ellipse" object:shadowView]];
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