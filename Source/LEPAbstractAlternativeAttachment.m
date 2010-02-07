//
//  LEPAbstractAlternativeAttachment.m
//  etPanKit
//
//  Created by DINH Viêt Hoà on 31/01/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "LEPAbstractAlternativeAttachment.h"

@implementation LEPAbstractAlternativeAttachment

@synthesize attachments = _attachments;

- (id) init
{
	self = [super init];
	
	return self;
}

- (void) dealloc
{
	[_attachments release];
	[super dealloc];
}

- (void) setMessage:(LEPAbstractMessage *)message
{
	_message = message;
	for(NSArray * oneAlternative in _attachments) {
		for(LEPAbstractAttachment * attachment in oneAlternative) {
			[attachment setMessage:message];
		}
	}
}

- (NSString *) description
{
	NSMutableString * result;

	result = [NSMutableString string];
	[result appendFormat:@"{%@: 0x%p %@\n", [self class], self, [self mimeType]];
	for(NSArray * oneAlternative in _attachments) {
		[result appendFormat:@"  {"];
		for(unsigned int i = 0 ; i < [oneAlternative count] ; i ++) {
			LEPAbstractAttachment * attachment;
			
			attachment = [oneAlternative objectAtIndex:i];
			if (i == [oneAlternative count] - 1) {
				[result appendFormat:@"%@", attachment];
			}
			else {
				[result appendFormat:@"%@, ", attachment];
			}
		}
		[result appendFormat:@"}\n"];
	}
	[result appendFormat:@"}"];
	
	return result;
}

@end