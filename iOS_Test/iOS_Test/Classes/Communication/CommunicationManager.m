//
//  CommunicationManager.m
//  iOS_Test
//
//  Created by Amjad Khan on 2/16/13.
//  Copyright (c) 2013 Amjad Khan. All rights reserved.
//

#import "CommunicationManager.h"

// Object Declaration
@interface CommunicationManager (){
    NSURLConnection *_theConnection;
    NSMutableURLRequest *_theRequest;
    NSMutableData *_data;
    
}

@end


@implementation CommunicationManager


-(id)init{
    self = [super init];
    if(self){
        // initialization code.
    }
    return self;
}


-(void)checkForUpdate:(NSString*)url{
    
    NSString *escapedString = [url stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
    
    _theRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:escapedString]
										 cachePolicy:NSURLRequestUseProtocolCachePolicy
									 timeoutInterval:30.0];
	_theConnection=[[NSURLConnection alloc] initWithRequest:_theRequest delegate:self];
	
	escapedString = nil;
	_theRequest = nil;
}




#pragma mark
#pragma mark NSURL Connection Methods
#pragma mark

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
	
	
	
	if (_theConnection) {
		_data = [[NSMutableData data] retain];
	} else {
		// Inform the user that the connection failed.
		NSLog(@"Connection Failed in Start Download");
	}
	//return @"test";
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
	
	[_data appendData:data];
	
	
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
	
	NSString *str = [[[NSString alloc] initWithData:_data encoding:NSUTF8StringEncoding] autorelease];
	[_data release];
	_data = nil;
	[_theConnection release];
	_theConnection = nil;
	_theRequest = nil;
	
    if([self.updateDelegate respondsToSelector:@selector(updateReady:)])
        [self.updateDelegate updateReady:str];
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
	NSLog(@"error occurred %@",[error localizedDescription]);
	
	[_theConnection release];
	_theConnection = nil;
	
	[_data release];
	_data = nil;
}


@end
