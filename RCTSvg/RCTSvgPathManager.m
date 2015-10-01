//
//  SVGPathManager.m
//  
//
//  Created by Pavlo Aksonov on 03.08.15.
//
//

#import "RCTSvgPathManager.h"
#import "RCTSvgPath.h"

@implementation RCTSvgPathManager

RCT_EXPORT_MODULE()

- (UIView *)view
{
    RCTSvgPath *svg = [[RCTSvgPath alloc] init];
    return svg;
}

RCT_EXPORT_VIEW_PROPERTY(d, NSString)
RCT_EXPORT_VIEW_PROPERTY(stroke, NSString)
RCT_EXPORT_VIEW_PROPERTY(strokeWidth, NSString)
RCT_EXPORT_VIEW_PROPERTY(strokeLinecap, NSString)
RCT_EXPORT_VIEW_PROPERTY(strokeMiterLimit, NSString)
RCT_EXPORT_VIEW_PROPERTY(id, NSString)
RCT_EXPORT_VIEW_PROPERTY(fill, NSString)
RCT_EXPORT_VIEW_PROPERTY(fillOpacity, NSString)
RCT_EXPORT_VIEW_PROPERTY(opacity, NSString)
RCT_EXPORT_VIEW_PROPERTY(fillRule, NSString)
RCT_EXPORT_VIEW_PROPERTY(mask, NSString)
RCT_EXPORT_VIEW_PROPERTY(scale, float)
RCT_EXPORT_VIEW_PROPERTY(_transform, NSString)

- (RCTShadowView *)shadowView
{
    RCTSvgPathShadow *svg = [[RCTSvgPathShadow alloc] init];
    return svg;
}

RCT_EXPORT_SHADOW_PROPERTY(d, NSString)
RCT_EXPORT_SHADOW_PROPERTY(stroke, NSString)
RCT_EXPORT_SHADOW_PROPERTY(strokeWidth, NSString)
RCT_EXPORT_SHADOW_PROPERTY(strokeLinecap, NSString)
RCT_EXPORT_SHADOW_PROPERTY(strokeMiterLimit, NSString)
RCT_EXPORT_SHADOW_PROPERTY(id, NSString)
RCT_EXPORT_SHADOW_PROPERTY(fill, NSString)
RCT_EXPORT_SHADOW_PROPERTY(fillOpacity, NSString)
RCT_EXPORT_SHADOW_PROPERTY(opacity, NSString)
RCT_EXPORT_SHADOW_PROPERTY(fillRule, NSString)
RCT_EXPORT_SHADOW_PROPERTY(mask, NSString)
RCT_EXPORT_SHADOW_PROPERTY(scale, float)
RCT_EXPORT_SHADOW_PROPERTY(_transform, NSString)

@end
