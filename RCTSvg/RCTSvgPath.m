//
//  RCTSvgPath.m
//  RCTSvg
//
//  Created by Pavlo Aksonov on 13.08.15.
//  Copyright (c) 2015 Pavlo Aksonov. All rights reserved.
//

#import "RCTSvgPath.h"
#import "RCTLog.h"

const int distance = 100;

@implementation RCTSvgPath {
    RCTSvgElement *element;
}

-(id)init {
    self = [super init];
    self.backgroundColor = [UIColor clearColor];
    return self;
}

-(id<GHRenderable>)obj {
    if (!element) {
        element = [[RCTSvgElement alloc] initWithFrame:CGRectZero];
        element.obj = [[GHPath alloc] initWithDictionary:[self objParams]];
        element.x = distance;
        element.y = distance;
        [self addSubview:element];
    }
    return element.obj;
}

-(NSDictionary *)objParams {
    return [RCTSvgElement objParams:@"path" object:self];
}

-(void)setD:(NSString * __nullable)d {
    _d = d;
//    super.obj = nil;
    [self setNeedsDisplay];
}

-(void)layoutSubviews {
    [super layoutSubviews];
    if (self.obj){
        element.frame = CGRectMake(-distance, -distance, self.frame.size.width + distance, self.frame.size.height + distance);
    }
}

-(void)drawRect:(CGRect)rect {
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

