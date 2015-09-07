//
//  BundledGHImage.m
//  RCTSvg
//
//  Created by Pavlo Aksonov on 31.08.15.
//  Copyright (c) 2015 Pavlo Aksonov. All rights reserved.
//

#import "BundledGHImage.h"

@implementation BundledGHImage {
    UIImageView *_imageView;
}
-(id)initWithDictionary:(NSDictionary * __nonnull)theAttributes andImageView:(UIImageView *)imageView {
    _imageView = imageView;
    return [super initWithDictionary:theAttributes];
}

-(UIImage*) newNativeImageWithSVGContext:(id<SVGContext>)svgContext {
    return _imageView.image;
}
@end
