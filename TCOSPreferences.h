#import <Cocoa/Cocoa.h>

#define USER_DEFAULTS_KEY @"Copy On Select"
#define USER_DEFAULTS_RIGHTCLICK_KEY @"Paste On Right Click"

@interface TCOSPreferences : NSObject
{
	IBOutlet NSMenu *terminalMenuAdditions;
	IBOutlet NSMenuItem* copyOnSelectMenuItem;
	IBOutlet NSMenuItem* pasteOnRightClickMenuItem;
}
+(TCOSPreferences*)sharedInstance;
-(id)init;
-(IBAction)toggle:(NSMenuItem *)sender;
@end