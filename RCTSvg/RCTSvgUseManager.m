//
//  SVGUseManager.m
//  SVGReact
//
//  Created by Pavlo Aksonov on 07.08.15.
//  Copyright (c) 2015 Pavlo Aksonov. All rights reserved.
//

#import "RCTSvgUseManager.h"
#import "RCTSvgUse.h"

@implementation RCTSvgUseManager
RCT_EXPORT_MODULE()

- (UIView *)view
{
    RCTSvgUse *svg = [[RCTSvgUse alloc] init];
    return svg;
}
RCT_EXPORT_VIEW_PROPERTY(xlinkHref, NSString)
RCT_EXPORT_VIEW_PROPERTY(stroke, NSString)
RCT_EXPORT_VIEW_PROPERTY(strokeWidth, NSString)
RCT_EXPORT_VIEW_PROPERTY(fill, NSString)
RCT_EXPORT_VIEW_PROPERTY(fillOpacity, NSString)
RCT_EXPORT_VIEW_PROPERTY(mask, NSString)
RCT_EXPORT_VIEW_PROPERTY(scale, NSString)
RCT_EXPORT_VIEW_PROPERTY(id, NSString)

@end
