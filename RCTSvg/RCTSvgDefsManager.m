//
//  SVGDefsManager.m
//  SVGReact
//
//  Created by Pavlo Aksonov on 06.08.15.
//  Copyright (c) 2015 Pavlo Aksonov. All rights reserved.
//

#import "RCTSvgDefsManager.h"
#import "RCTSvgDefs.h"

@implementation RCTSvgDefsManager

RCT_EXPORT_MODULE()

- (UIView *)view
{
    RCTSvgDefs *svg = [[RCTSvgDefs alloc] init];
    return svg;
    //
    //    return [[SVGPath alloc] init];
}

@end
