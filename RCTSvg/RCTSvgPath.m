//
//  RCTSvgPath.m
//  RCTSvg
//
//  Created by Pavlo Aksonov on 13.08.15.
//  Copyright (c) 2015 Pavlo Aksonov. All rights reserved.
//

#import "RCTSvgPath.h"
#import "RCTLog.h"

@implementation RCTSvgPath

-(NSDictionary *)objParams {
    return [RCTSvgElement objParams:@"path" object:self];
}

-(void)setD:(NSString * __nullable)d {
    _d = d;
    [self setNeedsDisplay];
//    super.obj = nil;
}

- (void)drawRect:(CGRect)rect {
    GHPath *base = [[GHPath alloc] initWithDictionary:[self objParams]];
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


@implementation RCTSvgPathShadow
static css_dim_t RCTPathMeasure(void *context, float width)
{
    RCTSvgPathShadow *shadowView = (__bridge RCTSvgPathShadow *)context;
    
    GHPath *rect = [[GHPath alloc] initWithDictionary:[RCTSvgElement objParams:@"path" object:shadowView]];
    [[RCTSvgDynamicRenderer sharedInstace] addObject:rect forKey:shadowView.id];
    CGRect bounds = [rect getBoundingBoxWithSVGContext:[RCTSvgDynamicRenderer sharedInstace]];
    CGSize computedSize = CGSizeMake(bounds.size.width+bounds.origin.x,bounds.size.height+bounds.origin.y);//[layoutManager usedRectForTextContainer:textContainer].size;
    
    css_dim_t result;
    result.dimensions[CSS_WIDTH] = RCTCeilPixelValue(computedSize.width);
    result.dimensions[CSS_HEIGHT] = RCTCeilPixelValue(computedSize.height);
    return result;
}

- (void)fillCSSNode:(css_node_t *)node
{
    [super fillCSSNode:node];
    node->measure = RCTPathMeasure;
    node->children_count = 0;
}

@end

