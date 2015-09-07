//
//  BundledGHImage.h
//  RCTSvg
//
//  Created by Pavlo Aksonov on 31.08.15.
//  Copyright (c) 2015 Pavlo Aksonov. All rights reserved.
//

#import "SVGAttributedObject.h"

@interface BundledGHImage : GHImage

-(id)initWithDictionary:(NSDictionary * __nonnull)theAttributes andImageView:(UIImageView *)imageView;
@end
