//
//  RCTSvg.m
//  RCTSvg
//
//  Created by Pavlo Aksonov on 30.08.15.
//  Copyright (c) 2015 Pavlo Aksonov. All rights reserved.
//

#import "RCTSvg.h"
#import "RCTSvgDynamicRenderer.h"

@implementation RCTSvg

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    [RCTSvgDynamicRenderer sharedInstace].context = context;
    [RCTSvgDynamicRenderer sharedInstace].width = self.width;
    [RCTSvgDynamicRenderer sharedInstace].height = self.height;
    [super drawRect:rect];
}

@end
