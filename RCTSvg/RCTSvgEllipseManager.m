//
//  RCTSvgCircleManager.m
//  RCTSvg
//
//  Created by Pavlo Aksonov on 26.08.15.
//  Copyright (c) 2015 Pavlo Aksonov. All rights reserved.
//

#import "RCTSvgEllipseManager.h"
#import "RCTSvgEllipse.h"

@implementation RCTSvgEllipseManager
RCT_EXPORT_MODULE()

- (UIView *)view
{
    RCTSvgEllipse *svg = [[RCTSvgEllipse alloc] init];
    return svg;
}

RCT_EXPORT_VIEW_PROPERTY(cx, NSString)
RCT_EXPORT_VIEW_PROPERTY(cy, NSString)
RCT_EXPORT_VIEW_PROPERTY(rx, NSString)
RCT_EXPORT_VIEW_PROPERTY(ry, NSString)
RCT_EXPORT_VIEW_PROPERTY(stroke, NSString)
RCT_EXPORT_VIEW_PROPERTY(strokeWidth, NSString)
RCT_EXPORT_VIEW_PROPERTY(id, NSString)
RCT_EXPORT_VIEW_PROPERTY(fill, NSString)
RCT_EXPORT_VIEW_PROPERTY(fillOpacity, NSString)
RCT_EXPORT_VIEW_PROPERTY(mask, NSString)
RCT_EXPORT_VIEW_PROPERTY(scale, NSString)

-(RCTShadowView *)shadowView {
    return [[RCTSvgEllipseShadow alloc] init];
}

RCT_EXPORT_SHADOW_PROPERTY(cx, NSString)
RCT_EXPORT_SHADOW_PROPERTY(cy, NSString)
RCT_EXPORT_SHADOW_PROPERTY(rx, NSString)
RCT_EXPORT_SHADOW_PROPERTY(ry, NSString)
RCT_EXPORT_SHADOW_PROPERTY(stroke, NSString)
RCT_EXPORT_SHADOW_PROPERTY(strokeWidth, NSString)
RCT_EXPORT_SHADOW_PROPERTY(id, NSString)
RCT_EXPORT_SHADOW_PROPERTY(fill, NSString)
RCT_EXPORT_SHADOW_PROPERTY(fillOpacity, NSString)
RCT_EXPORT_SHADOW_PROPERTY(mask, NSString)
RCT_EXPORT_SHADOW_PROPERTY(scale, NSString)


@end
