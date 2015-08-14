//
//  SVGLinearGradientManager.m
//  SVGReact
//
//  Created by Pavlo Aksonov on 06.08.15.
//  Copyright (c) 2015 Pavlo Aksonov. All rights reserved.
//

#import "RCTSvgLinearGradientManager.h"
#import "RCTSvgLinearGradient.h"

@implementation RCTSvgLinearGradientManager

RCT_EXPORT_MODULE()

- (UIView *)view
{
    RCTSvgLinearGradient *svg = [[RCTSvgLinearGradient alloc] init];
    return svg;
}
RCT_EXPORT_VIEW_PROPERTY(id, NSString)
RCT_EXPORT_VIEW_PROPERTY(stop, NSArray)
RCT_EXPORT_VIEW_PROPERTY(x1, NSString)
RCT_EXPORT_VIEW_PROPERTY(x2, NSString)
RCT_EXPORT_VIEW_PROPERTY(y1, NSString)
RCT_EXPORT_VIEW_PROPERTY(y2, NSString)


@end
