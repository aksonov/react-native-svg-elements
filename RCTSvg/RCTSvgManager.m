//
//  RCTSvgManager.m
//  RCTSvg
//
//  Created by Pavlo Aksonov on 14.08.15.
//  Copyright (c) 2015 Pavlo Aksonov. All rights reserved.
//

#import "RCTSvgManager.h"
#import "RCTSvg.h"

@implementation RCTSvgManager
RCT_EXPORT_MODULE()

- (UIView *)view
{
    RCTSvg *svg = [[RCTSvg alloc] init];
    return svg;
}
RCT_EXPORT_VIEW_PROPERTY(width, float)
RCT_EXPORT_VIEW_PROPERTY(height, float)

@end
