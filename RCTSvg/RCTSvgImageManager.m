//
//  RCTSvgImageManager.m
//  RCTSvg
//
//  Created by Pavlo Aksonov on 31.08.15.
//  Copyright (c) 2015 Pavlo Aksonov. All rights reserved.
//

#import "RCTSvgImageManager.h"
#import "RCTSvgImage.h"

@implementation RCTSvgImageManager

RCT_EXPORT_MODULE()
- (UIView *)view
{
    RCTSvgImage *svg = [[RCTSvgImage alloc] init];
    return svg;
}

RCT_EXPORT_VIEW_PROPERTY(_x, NSString)
RCT_EXPORT_VIEW_PROPERTY(_y, NSString)
RCT_EXPORT_VIEW_PROPERTY(_width, NSString)
RCT_EXPORT_VIEW_PROPERTY(_height, NSString)
RCT_EXPORT_VIEW_PROPERTY(mask, NSString)
RCT_EXPORT_VIEW_PROPERTY(scale, NSString)
RCT_EXPORT_VIEW_PROPERTY(xlinkHref, NSString)

@end
