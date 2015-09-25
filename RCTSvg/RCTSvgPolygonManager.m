//
//  RCTSvgPolygonManager.m
//  RCTSvg
//
//  Created by Pavlo Aksonov on 30.08.15.
//  Copyright (c) 2015 Pavlo Aksonov. All rights reserved.
//

#import "RCTSvgPolygonManager.h"
#import "RCTSvgPolygon.h"

@implementation RCTSvgPolygonManager
RCT_EXPORT_MODULE()

- (UIView *)view
{
    RCTSvgPolygon *svg = [[RCTSvgPolygon alloc] init];
    return svg;
}

RCT_EXPORT_VIEW_PROPERTY(points, NSString)
RCT_EXPORT_VIEW_PROPERTY(stroke, NSString)
RCT_EXPORT_VIEW_PROPERTY(strokeWidth, NSString)
RCT_EXPORT_VIEW_PROPERTY(id, NSString)
RCT_EXPORT_VIEW_PROPERTY(fill, NSString)
RCT_EXPORT_VIEW_PROPERTY(fillOpacity, NSString)
RCT_EXPORT_VIEW_PROPERTY(mask, NSString)
RCT_EXPORT_VIEW_PROPERTY(scale, float)

- (RCTShadowView *)shadowView {
    RCTSvgPolygonShadow *svg = [[RCTSvgPolygonShadow alloc] init];
    return svg;
}

RCT_EXPORT_SHADOW_PROPERTY(points, NSString)
RCT_EXPORT_SHADOW_PROPERTY(stroke, NSString)
RCT_EXPORT_SHADOW_PROPERTY(strokeWidth, NSString)
RCT_EXPORT_SHADOW_PROPERTY(id, NSString)
RCT_EXPORT_SHADOW_PROPERTY(fill, NSString)
RCT_EXPORT_SHADOW_PROPERTY(fillOpacity, NSString)
RCT_EXPORT_SHADOW_PROPERTY(mask, NSString)
RCT_EXPORT_SHADOW_PROPERTY(scale, float)


@end
