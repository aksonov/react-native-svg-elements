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

#define distance 100

@implementation RCTSvgEllipse {
    RCTSvgElement *element;
}

-(id)init {
    self = [super init];
    self.backgroundColor = [UIColor clearColor];
    return self;
}

-(NSDictionary *)objParams {
    return [RCTSvgElement objParams:@"ellipse" object:self];
}

-(id<GHRenderable>) obj {
    if (!element){
        GHEllipse *base = [[GHEllipse alloc] initWithDictionary:[self objParams]];
        element = [[RCTSvgElement alloc] initWithFrame: self.frame];
        element.obj = base;
        element.x = distance;
        element.y = distance;
        self.backgroundColor = [UIColor clearColor];
        
        
        [self addSubview:element];
    }
    return element.obj;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    if (self.obj){
        element.frame = CGRectMake(-distance, -distance, self.frame.size.width + 2*distance, self.frame.size.height + 2*distance);
    }

}
@end

@implementation RCTSvgEllipseShadow
static css_dim_t RCTEllipseMeasure(void *context, float width)
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
    node->measure = RCTEllipseMeasure;
    node->children_count = 0;
}

@end