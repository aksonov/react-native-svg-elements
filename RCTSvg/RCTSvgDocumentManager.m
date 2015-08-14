//
//  SVGDocumentManager.m
//  SVGReact
//
//  Created by Pavlo Aksonov on 07.08.15.
//  Copyright (c) 2015 Pavlo Aksonov. All rights reserved.
//

#import "RCTSvgDocumentManager.h"
#import "SVGDocumentView.h"

@implementation RCTSvgDocumentManager
RCT_EXPORT_MODULE()

- (UIView *)view
{
    SVGDocumentView *svg = [[SVGDocumentView alloc] init];
    return svg;
}
RCT_EXPORT_VIEW_PROPERTY(artworkPath, NSString)

@end
