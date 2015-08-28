//
//  RCTSvgCircleManager.m
//  RCTSvg
//
//  Created by Pavlo Aksonov on 26.08.15.
//  Copyright (c) 2015 Pavlo Aksonov. All rights reserved.
//

#import "RCTSvgCircleManager.h"
#import "RCTSvgCircle.h"

@implementation RCTSvgCircleManager
RCT_EXPORT_MODULE()

- (UIView *)view
{
    RCTSvgCircle *svg = [[RCTSvgCircle alloc] init];
    return svg;
}

-(RCTShadowView *)shadowView {
    return [[RCTSvgCircleShadow alloc] init];
}

RCT_EXPORT_VIEW_PROPERTY(cx, NSString)
RCT_EXPORT_VIEW_PROPERTY(cy, NSString)
RCT_EXPORT_VIEW_PROPERTY(r, NSString)
RCT_EXPORT_VIEW_PROPERTY(stroke, NSString)
RCT_EXPORT_VIEW_PROPERTY(strokeWidth, NSString)
RCT_EXPORT_VIEW_PROPERTY(id, NSString)
RCT_EXPORT_VIEW_PROPERTY(fill, NSString)
RCT_EXPORT_VIEW_PROPERTY(fillOpacity, NSString)
RCT_EXPORT_VIEW_PROPERTY(mask, NSString)
RCT_EXPORT_VIEW_PROPERTY(scale, NSString)

RCT_EXPORT_SHADOW_PROPERTY(cx, NSString)
RCT_EXPORT_SHADOW_PROPERTY(cy, NSString)
RCT_EXPORT_SHADOW_PROPERTY(r, NSString)
RCT_EXPORT_SHADOW_PROPERTY(stroke, NSString)
RCT_EXPORT_SHADOW_PROPERTY(strokeWidth, NSString)
RCT_EXPORT_SHADOW_PROPERTY(id, NSString)
RCT_EXPORT_SHADOW_PROPERTY(fill, NSString)
RCT_EXPORT_SHADOW_PROPERTY(fillOpacity, NSString)
RCT_EXPORT_SHADOW_PROPERTY(mask, NSString)
RCT_EXPORT_SHADOW_PROPERTY(scale, NSString)


@end
