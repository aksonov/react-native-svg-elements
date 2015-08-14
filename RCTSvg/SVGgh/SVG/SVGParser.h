//
//  SVGParser.h
//  SVGgh
// The MIT License (MIT)

//  Copyright (c) 2011-2014 Glenn R. Howes

//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.

//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//
//  Created by Glenn Howes on 2/2/11.
//

#if defined(__has_feature) && __has_feature(modules)
@import Foundation;
#else
#import <Foundation/Foundation.h>
#endif

NS_ASSUME_NONNULL_BEGIN

/*! @brief object capable of reading in an SVG document in XML form
*/
@interface SVGParser : NSObject 
@property(nonatomic, strong)           NSError* __nullable 	parserError;
@property(nonatomic, strong)           NSDictionary* __nullable  root;
@property(strong, nonatomic, readonly) NSURL* __nullable 	svgURL;

/*! @brief init method which takes a URL reference to a .svg file
* @param url a reference to a standard .svg file
*/
-(id)initWithContentsOfURL:(NSURL *)url;

/*! @brief init method which takes an SVG document which already exists as a string
* @param utf8String string containing the SVG document
*/
-(id)initWithString:(NSString*)utf8String;


/*! @brief not allowing a standard init method
 */
-(nullable instancetype) init __attribute__((unavailable("init not available")));

/*! @brief method to create a URL relative to the URL used to create this object (assuming use of a URL to create it)
* @param subPath relative path to this parser's svgURL
*/
-(nullable NSURL*)	relativeURL:(NSString*)subPath;

/*! @brief a routine to return an absolute URL
* @param aPath the file path to the resource
*/
-(nullable NSURL*)   absoluteURL:(NSString*)aPath;
@end

NS_ASSUME_NONNULL_END
