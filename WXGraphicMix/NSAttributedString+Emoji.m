//
//  ViewController.m
//  WXGraphicMix
//
//  Created by 潇 on 16/1/7.
//  Copyright © 2016年 潇. All rights reserved.
//

#import "NSAttributedString+Emoji.h"
#import <UIKit/UIKit.h>

@interface EmojiAttachment : NSTextAttachment

@end

@implementation EmojiAttachment

//设置图片和文字相等的高度
- (CGRect)attachmentBoundsForTextContainer:(NSTextContainer *)textContainer proposedLineFragment:(CGRect)lineFrag glyphPosition:(CGPoint)position characterIndex:(NSUInteger)charIndex
{
    return CGRectMake( 0 , -3, lineFrag.size.height, lineFrag.size.height);
}

@end


@implementation NSAttributedString (Emoji)


+ (NSAttributedString *)emojiStringWithString:(NSMutableAttributedString *)emojiString {
    
    NSRegularExpression *regularE = [NSRegularExpression regularExpressionWithPattern:@"s[0-9]{3}" options:NSRegularExpressionCaseInsensitive error:nil];
    
    NSString *str = emojiString.string;
    
    NSTextCheckingResult *result = [regularE firstMatchInString:str options:NSMatchingReportCompletion range:NSMakeRange(0, str.length)];
    
    if (result != nil) {
        NSString *imageName = [NSString stringWithFormat:@"%@.png", [str substringWithRange:result.range]];
        
        EmojiAttachment *attachment = [[EmojiAttachment alloc] initWithData:nil ofType:nil];
        attachment.image = [UIImage imageNamed:imageName];
        
        NSAttributedString *attrString = [NSAttributedString attributedStringWithAttachment:attachment];
        
        [emojiString replaceCharactersInRange:result.range withAttributedString:attrString];
        
        [self emojiStringWithString:emojiString];
    }else {
        return emojiString;
    }
    
    return emojiString;
}

@end
