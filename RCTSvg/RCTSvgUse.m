//
//  SVGUse.m
//  SVGReact
//
//  Created by Pavlo Aksonov on 07.08.15.
//  Copyright (c) 2015 Pavlo Aksonov. All rights reserved.
//

#import "RCTSvgUse.h"
#import "SVGAttributedObject.h"
#import "NSObject+Serialize.h"

@implementation RCTSvgUse

-(NSDictionary *)objParams {
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:[self asAttributes]];
    
    dict[@"xlink:href"] = self.xlinkHref;
    if (self.scale){
        dict[@"transform"] = [NSString stringWithFormat:@"scale(%f)", self.scale];
    }
    return @{kAttributesElementName: dict, kElementName: @"use"};
}


-(id) obj {
    if (!super.obj){
        GHRenderableObjectPlaceholder *p = [[GHRenderableObjectPlaceholder alloc] initWithDictionary:[self objParams]];
        [super setObj:p];
    }
    return super.obj;
}


@end


@implementation RCTSvgUseShadow
static css_dim_t RCTUseMeasure(void *context, float width)
{
    RCTSvgUseShadow *shadowView = (__bridge RCTSvgUseShadow *)context;
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:[RCTSvgElement objParams:@"use" object:shadowView]];
    
    dict[@"xlink:href"] = shadowView.xlinkHref;
    GHRenderableObjectPlaceholder *rect = [[GHRenderableObjectPlaceholder alloc] initWithAttributes:dict];
    float scale = 1;
    if (shadowView.scale){
        scale = shadowView.scale;
    }
    id<GHRenderable> myConcrete = [rect concreteObjectForSVGContext:[RCTSvgDynamicRenderer sharedInstace] excludingPrevious:nil];
    
    CGRect bounds = [myConcrete getBoundingBoxWithSVGContext:[RCTSvgDynamicRenderer sharedInstace]];
    CGSize computedSize = CGSizeMake(bounds.size.width*scale,bounds.size.height*scale);//[layoutManager usedRectForTextContainer:textContainer].size;
//    CGSize computedSize = CGSizeMake(bounds.size.width+bounds.origin.x,bounds.size.height+bounds.origin.y);//[layoutManager usedRectForTextContainer:textContainer].size;
    
    css_dim_t result;
    result.dimensions[CSS_WIDTH] = RCTCeilPixelValue(computedSize.width);
    result.dimensions[CSS_HEIGHT] = RCTCeilPixelValue(computedSize.height);
    return result;
}

- (void)fillCSSNode:(css_node_t *)node
{
    [super fillCSSNode:node];
    node->measure = RCTUseMeasure;
    node->children_count = 0;
}

@end

