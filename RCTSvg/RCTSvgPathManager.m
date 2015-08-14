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
RCT_EXPORT_VIEW_PROPERTY(id, NSString)
RCT_EXPORT_VIEW_PROPERTY(fill, NSString)
RCT_EXPORT_VIEW_PROPERTY(fillOpacity, NSString)
RCT_EXPORT_VIEW_PROPERTY(mask, NSString)
RCT_EXPORT_VIEW_PROPERTY(scale, NSString)

@end
