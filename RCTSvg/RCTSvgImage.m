//
//  RCTSvgImage.m
//  RCTSvg
//
//  Created by Pavlo Aksonov on 31.08.15.
//  Copyright (c) 2015 Pavlo Aksonov. All rights reserved.
//

#import "RCTSvgImage.h"
#import "BundledGHImage.h"
#import "UIView+React.h"

@implementation RCTSvgImage {
    UIImageView *imageView;
}

-(void)setXlinkHref:(NSString * __nullable)xlinkHref {
    _xlinkHref = xlinkHref;
    [self setNeedsDisplay];
}

-(NSDictionary *)objParams {
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:[RCTSvgElement objParams:@"image" object:self]];
    
    if (self.xlinkHref){
        dict[kAttributesElementName][@"xlink:href"] = self.xlinkHref;
    }
    return dict;
}

-(void)insertReactSubview:(id<RCTComponent>)subview atIndex:(NSInteger)atIndex {
    imageView = (UIImageView *)subview;
}

-(SVGAttributedObject *)obj {
    GHRenderableObject *o = super.obj;
    self.clipsToBounds = YES;
    if (!o){
        BundledGHImage *rect = [[BundledGHImage alloc] initWithDictionary:[self objParams] andImageView:imageView];
        super.obj = rect;
        [self setNeedsDisplay];
    }
    return super.obj;
}

@end
