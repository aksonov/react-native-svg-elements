//
//  RCTSvgRectManager.m
//  RCTSvg
//
//  Created by Pavlo Aksonov on 25.08.15.
//  Copyright (c) 2015 Pavlo Aksonov. All rights reserved.
//

#import "RCTSvgRectManager.h"
#import "RCTSvgRect.h"

@implementation RCTSvgRectManager

RCT_EXPORT_MODULE()

- (UIView *)view
{
    RCTSvgRect *svg = [[RCTSvgRect alloc] init];
    return svg;
}

RCT_EXPORT_VIEW_PROPERTY(rx, NSString)
RCT_EXPORT_VIEW_PROPERTY(ry, NSString)
RCT_EXPORT_VIEW_PROPERTY(x, NSString)
RCT_EXPORT_VIEW_PROPERTY(y, NSString)
RCT_EXPORT_VIEW_PROPERTY(_width, NSString)
RCT_EXPORT_VIEW_PROPERTY(_height, NSString)
RCT_EXPORT_VIEW_PROPERTY(stroke, NSString)
RCT_EXPORT_VIEW_PROPERTY(strokeWidth, NSString)
RCT_EXPORT_VIEW_PROPERTY(id, NSString)
RCT_EXPORT_VIEW_PROPERTY(fill, NSString)
RCT_EXPORT_VIEW_PROPERTY(fillOpacity, NSString)
RCT_EXPORT_VIEW_PROPERTY(mask, NSString)
RCT_EXPORT_VIEW_PROPERTY(scale, float)

- (RCTShadowView *)shadowView {
    RCTSvgRectShadow *svg = [[RCTSvgRectShadow alloc] init];
    return svg;
}

RCT_EXPORT_SHADOW_PROPERTY(rx, NSString)
RCT_EXPORT_SHADOW_PROPERTY(ry, NSString)
RCT_EXPORT_SHADOW_PROPERTY(x, NSString)
RCT_EXPORT_SHADOW_PROPERTY(y, NSString)
RCT_EXPORT_SHADOW_PROPERTY(_width, NSString)
RCT_EXPORT_SHADOW_PROPERTY(_height, NSString)
RCT_EXPORT_SHADOW_PROPERTY(stroke, NSString)
RCT_EXPORT_SHADOW_PROPERTY(strokeWidth, NSString)
RCT_EXPORT_SHADOW_PROPERTY(id, NSString)
RCT_EXPORT_SHADOW_PROPERTY(fill, NSString)
RCT_EXPORT_SHADOW_PROPERTY(fillOpacity, NSString)
RCT_EXPORT_SHADOW_PROPERTY(mask, NSString)
RCT_EXPORT_SHADOW_PROPERTY(scale, float)


@end
