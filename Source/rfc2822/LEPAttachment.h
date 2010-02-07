#import "LEPAbstractAttachment.h"

@interface LEPAttachment : LEPAbstractAttachment {
    NSData * _data;
}

@property (nonatomic, retain) NSData * data;

+ (LEPAttachment *) attachmentWithContentsOfFile:(NSString *)filename;

+ (LEPAttachment *) attachmentWithHTMLString:(NSString *)html; // with alternative by default
+ (LEPAttachment *) attachmentWithHTMLString:(NSString *)html withTextAlternative:(BOOL)hasAlternative;

+ (LEPAttachment *) attachmentWithString:(NSString *)stringValue;

@end