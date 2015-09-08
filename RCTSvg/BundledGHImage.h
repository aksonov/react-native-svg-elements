//
//  BundledGHImage.h
//  RCTSvg
//
//  Created by Pavlo Aksonov on 31.08.15.
//  Copyright (c) 2015 Pavlo Aksonov. All rights reserved.
//

#import "SVGAttributedObject.h"

@interface BundledGHImage : GHImage

-(id __nonnull)initWithDictionary:(NSDictionary * __nonnull)theAttributes andImageView:(UIImageView *__nonnull)imageView;
@end
