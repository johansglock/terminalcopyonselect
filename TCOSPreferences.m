#import "TCOSPreferences.h"

@implementation TCOSPreferences
+(TCOSPreferences*)sharedInstance
{
	static TCOSPreferences* pref = nil;
	if (pref == nil) {
		pref = [[TCOSPreferences alloc] init];
	}
	return pref;
}

-(id)init
{
	self = [super init];

	[NSBundle loadNibNamed:@"TCOSPreferences.nib" owner:self];
	return self;
}

-(void)awakeFromNib
{
	BOOL copyOnSelect = [[NSUserDefaults standardUserDefaults] boolForKey:USER_DEFAULTS_KEY];
	BOOL pasteOnRightClick = [[NSUserDefaults standardUserDefaults] boolForKey:USER_DEFAULTS_RIGHTCLICK_KEY];
	NSMenu* applicationMenu = [[[[NSApplication sharedApplication] mainMenu] itemAtIndex: 0] submenu];

	copyOnSelectMenuItem.state = copyOnSelect;
	pasteOnRightClickMenuItem.state = pasteOnRightClick;
	
	for(NSMenuItem* menuItem in [terminalMenuAdditions itemArray]){
		[terminalMenuAdditions removeItem:menuItem];
		[applicationMenu insertItem:menuItem atIndex:3];
	}
}

-(IBAction)
toggle:(NSMenuItem *)sender
{
	sender.state = 1 - sender.state;
	NSString* key = sender.tag == 0 ? USER_DEFAULTS_KEY : USER_DEFAULTS_RIGHTCLICK_KEY;
	[[NSUserDefaults standardUserDefaults] setBool:sender.state forKey:key];
}
@end