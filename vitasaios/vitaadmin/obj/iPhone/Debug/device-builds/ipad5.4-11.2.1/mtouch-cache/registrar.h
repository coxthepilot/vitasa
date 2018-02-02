#pragma clang diagnostic ignored "-Wdeprecated-declarations"
#pragma clang diagnostic ignored "-Wtypedef-redefinition"
#pragma clang diagnostic ignored "-Wobjc-designated-initializers"
#define DEBUG 1
#include <stdarg.h>
#include <objc/objc.h>
#include <objc/runtime.h>
#include <objc/message.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <MessageUI/MessageUI.h>
#import <CloudKit/CloudKit.h>
#import <Intents/Intents.h>
#import <CoreGraphics/CoreGraphics.h>

@protocol UIPickerViewModel;
@class MessageUI_Mono_MFMailComposeViewControllerDelegate;
@class UIKit_UIControlEventProxy;
@class __MonoMac_NSActionDispatcher;
@class __MonoMac_NSAsyncActionDispatcher;
@class zsquared_C_PickerModel;
@class zsquared_C_ShiftsTableSource;
@class AppDelegate;
@class zsquared_C_ItemPicker_C_PickerDataModel;
@class zsquared_C_UserPicker_C_PickerDataModel;
@class ViewController;
@class VC_Main;
@class vitaadmin_VC_Messages_MessagePickerViewModel;
@class VC_Messages;
@class vitaadmin_VC_Suggestions_C_SuggestionsTableSource;
@class VC_Suggestions;
@class VC_WorkItems;
@class vitaadmin_VC_Sites_C_SiteCoordinatorPickerModel;
@class vitaadmin_VC_Sites_C_SitesTableSource;
@class VC_Sites;
@class VC_Calendar;
@class vitaadmin_VC_ShowNotifications_C_NotificationsTableSource;
@class VC_ShowNotifications;
@class vitaadmin_VC_Users_C_UsersTableSource;
@class VC_Users;
@class vitaadmin_VC_Config_C_VersionsTableSource;
@class VC_Config;
@class VC_Site;
@class vitaadmin_VC_User_C_WorkItemsTableSource;
@class vitaadmin_VC_User_C_SiteNamesTableSource;
@class VC_User;
@class VC_CheckSignUps;
@class vitaadmin_VC_OpenSites_C_OpenSitesTableSource;
@class VC_OpenSites;
@class vitaadmin_VC_Suggestions_C_SuggestionsTableDelegate;
@class vitaadmin_VC_WorkItems_C_WorkItemsTableDelegate;
@class vitaadmin_VC_WorkItems_C_WorkItemsTableSource;
@class vitaadmin_VC_Sites_C_SitesTableDelegate;
@class vitaadmin_VC_Calendar_C_CalendarEntryTableManager_C_CalendarEntryTableSource;
@class vitaadmin_VC_Calendar_C_ShiftTableManager_C_ShiftTableSource;
@class vitaadmin_VC_ShowNotifications_C_NotificationsTableDelegate;
@class vitaadmin_VC_Users_C_UsersTableDelegate;
@class vitaadmin_VC_CheckSignUps_C_WorkItemsTableSource;
@class vitaadmin_VC_Calendar_C_CalendarEntryTableManager_C_CalendarEntryTableDelegate;
@class vitaadmin_VC_Calendar_C_ShiftTableManager_C_ShiftTableDelegate;
@class __UIGestureRecognizerToken;
@class __UIGestureRecognizerParameterlessToken;
@class __UIGestureRecognizerParametrizedToken;
@class __UIRotationGestureRecognizer;
@class __UILongPressGestureRecognizer;
@class __UITapGestureRecognizer;
@class __UIPanGestureRecognizer;
@class __UIPinchGestureRecognizer;
@class __UISwipeGestureRecognizer;
@class __UIScreenEdgePanGestureRecognizer;
@class UIKit_UIBarButtonItem_Callback;
@class UIKit_UIScrollView__UIScrollViewDelegate;
@class UIKit_UITextView__UITextViewDelegate;
@class __NSObject_Disposer;

@protocol UIPickerViewModel<UIPickerViewDataSource, UIPickerViewDelegate>
@end

@interface zsquared_C_PickerModel : NSObject<UIPickerViewModel> {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(NSInteger) pickerView:(UIPickerView *)p0 numberOfRowsInComponent:(NSInteger)p1;
	-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)p0;
	-(NSString *) pickerView:(UIPickerView *)p0 titleForRow:(NSInteger)p1 forComponent:(NSInteger)p2;
	-(void) pickerView:(UIPickerView *)p0 didSelectRow:(NSInteger)p1 inComponent:(NSInteger)p2;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface zsquared_C_ShiftsTableSource : NSObject<UIScrollViewDelegate> {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1;
	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1;
	-(void) tableView:(UITableView *)p0 didSelectRowAtIndexPath:(NSIndexPath *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface AppDelegate : NSObject<UIApplicationDelegate> {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIWindow *) window;
	-(void) setWindow:(UIWindow *)p0;
	-(BOOL) application:(UIApplication *)p0 didFinishLaunchingWithOptions:(NSDictionary *)p1;
	-(void) applicationWillResignActive:(UIApplication *)p0;
	-(void) applicationDidEnterBackground:(UIApplication *)p0;
	-(void) applicationWillEnterForeground:(UIApplication *)p0;
	-(void) applicationDidBecomeActive:(UIApplication *)p0;
	-(void) applicationWillTerminate:(UIApplication *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@interface zsquared_C_ItemPicker_C_PickerDataModel : NSObject<UIPickerViewModel> {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(NSInteger) pickerView:(UIPickerView *)p0 numberOfRowsInComponent:(NSInteger)p1;
	-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)p0;
	-(NSString *) pickerView:(UIPickerView *)p0 titleForRow:(NSInteger)p1 forComponent:(NSInteger)p2;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface zsquared_C_UserPicker_C_PickerDataModel : NSObject<UIPickerViewModel> {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(NSInteger) pickerView:(UIPickerView *)p0 numberOfRowsInComponent:(NSInteger)p1;
	-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)p0;
	-(NSString *) pickerView:(UIPickerView *)p0 titleForRow:(NSInteger)p1 forComponent:(NSInteger)p2;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface ViewController : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Spinner;
	@property (nonatomic, assign) UIButton * B_Login;
	@property (nonatomic, assign) UITextField * TB_Email;
	@property (nonatomic, assign) UITextField * TB_Password;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Spinner;
	-(void) setAI_Spinner:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Login;
	-(void) setB_Login:(UIButton *)p0;
	-(UITextField *) TB_Email;
	-(void) setTB_Email:(UITextField *)p0;
	-(UITextField *) TB_Password;
	-(void) setTB_Password:(UITextField *)p0;
	-(void) viewDidLoad;
	-(void) didReceiveMemoryWarning;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_Main : UIViewController {
}
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_CheckSignUps;
	@property (nonatomic, assign) UIButton * B_Config;
	@property (nonatomic, assign) UIButton * B_EmailToUsers;
	@property (nonatomic, assign) UIButton * B_Messages;
	@property (nonatomic, assign) UIButton * B_Notifications;
	@property (nonatomic, assign) UIButton * B_OpenSites;
	@property (nonatomic, assign) UIButton * B_Sites;
	@property (nonatomic, assign) UIButton * B_Suggestions;
	@property (nonatomic, assign) UIButton * B_Users;
	@property (nonatomic, assign) UIButton * B_WorkItems;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_CheckSignUps;
	-(void) setB_CheckSignUps:(UIButton *)p0;
	-(UIButton *) B_Config;
	-(void) setB_Config:(UIButton *)p0;
	-(UIButton *) B_EmailToUsers;
	-(void) setB_EmailToUsers:(UIButton *)p0;
	-(UIButton *) B_Messages;
	-(void) setB_Messages:(UIButton *)p0;
	-(UIButton *) B_Notifications;
	-(void) setB_Notifications:(UIButton *)p0;
	-(UIButton *) B_OpenSites;
	-(void) setB_OpenSites:(UIButton *)p0;
	-(UIButton *) B_Sites;
	-(void) setB_Sites:(UIButton *)p0;
	-(UIButton *) B_Suggestions;
	-(void) setB_Suggestions:(UIButton *)p0;
	-(UIButton *) B_Users;
	-(void) setB_Users:(UIButton *)p0;
	-(UIButton *) B_WorkItems;
	-(void) setB_WorkItems:(UIButton *)p0;
	-(void) viewDidLoad;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface vitaadmin_VC_Messages_MessagePickerViewModel : NSObject<UIPickerViewModel> {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)p0;
	-(NSInteger) pickerView:(UIPickerView *)p0 numberOfRowsInComponent:(NSInteger)p1;
	-(NSString *) pickerView:(UIPickerView *)p0 titleForRow:(NSInteger)p1 forComponent:(NSInteger)p2;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_Messages : UIViewController {
}
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_Load;
	@property (nonatomic, assign) UIButton * B_Save;
	@property (nonatomic, assign) UITextField * TB_Message;
	@property (nonatomic, assign) UITextField * TB_Slug;
	@property (nonatomic, assign) UITextView * TxV_English;
	@property (nonatomic, assign) UITextView * TxV_Spanish;
	@property (nonatomic, assign) UIWebView * WV_English;
	@property (nonatomic, assign) UIWebView * WV_Spanish;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_Load;
	-(void) setB_Load:(UIButton *)p0;
	-(UIButton *) B_Save;
	-(void) setB_Save:(UIButton *)p0;
	-(UITextField *) TB_Message;
	-(void) setTB_Message:(UITextField *)p0;
	-(UITextField *) TB_Slug;
	-(void) setTB_Slug:(UITextField *)p0;
	-(UITextView *) TxV_English;
	-(void) setTxV_English:(UITextView *)p0;
	-(UITextView *) TxV_Spanish;
	-(void) setTxV_Spanish:(UITextView *)p0;
	-(UIWebView *) WV_English;
	-(void) setWV_English:(UIWebView *)p0;
	-(UIWebView *) WV_Spanish;
	-(void) setWV_Spanish:(UIWebView *)p0;
	-(void) viewDidLoad;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface vitaadmin_VC_Suggestions_C_SuggestionsTableSource : NSObject<UIScrollViewDelegate> {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1;
	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_Suggestions : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UILabel * L_Date;
	@property (nonatomic, assign) UILabel * L_From;
	@property (nonatomic, assign) UILabel * L_Subject;
	@property (nonatomic, assign) UILabel * L_UpdatedDate;
	@property (nonatomic, assign) UISegmentedControl * SC_State;
	@property (nonatomic, assign) UITableView * TV_Suggestions;
	@property (nonatomic, assign) UIWebView * WV_Message;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UILabel *) L_Date;
	-(void) setL_Date:(UILabel *)p0;
	-(UILabel *) L_From;
	-(void) setL_From:(UILabel *)p0;
	-(UILabel *) L_Subject;
	-(void) setL_Subject:(UILabel *)p0;
	-(UILabel *) L_UpdatedDate;
	-(void) setL_UpdatedDate:(UILabel *)p0;
	-(UISegmentedControl *) SC_State;
	-(void) setSC_State:(UISegmentedControl *)p0;
	-(UITableView *) TV_Suggestions;
	-(void) setTV_Suggestions:(UITableView *)p0;
	-(UIWebView *) WV_Message;
	-(void) setWV_Message:(UIWebView *)p0;
	-(void) viewDidLoad;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_WorkItems : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_Update;
	@property (nonatomic, assign) UILabel * L_Date;
	@property (nonatomic, assign) UILabel * L_Shift;
	@property (nonatomic, assign) UILabel * L_Site;
	@property (nonatomic, assign) UILabel * L_User;
	@property (nonatomic, assign) UISegmentedControl * SC_Approval;
	@property (nonatomic, assign) UITextField * TB_Hours;
	@property (nonatomic, assign) UITableView * TV_WorkItems;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_Update;
	-(void) setB_Update:(UIButton *)p0;
	-(UILabel *) L_Date;
	-(void) setL_Date:(UILabel *)p0;
	-(UILabel *) L_Shift;
	-(void) setL_Shift:(UILabel *)p0;
	-(UILabel *) L_Site;
	-(void) setL_Site:(UILabel *)p0;
	-(UILabel *) L_User;
	-(void) setL_User:(UILabel *)p0;
	-(UISegmentedControl *) SC_Approval;
	-(void) setSC_Approval:(UISegmentedControl *)p0;
	-(UITextField *) TB_Hours;
	-(void) setTB_Hours:(UITextField *)p0;
	-(UITableView *) TV_WorkItems;
	-(void) setTV_WorkItems:(UITableView *)p0;
	-(void) viewDidLoad;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface vitaadmin_VC_Sites_C_SiteCoordinatorPickerModel : NSObject<UIPickerViewModel> {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)p0;
	-(NSInteger) pickerView:(UIPickerView *)p0 numberOfRowsInComponent:(NSInteger)p1;
	-(NSString *) pickerView:(UIPickerView *)p0 titleForRow:(NSInteger)p1 forComponent:(NSInteger)p2;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface vitaadmin_VC_Sites_C_SitesTableSource : NSObject<UIScrollViewDelegate> {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1;
	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_Sites : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_CreateNewSite;
	@property (nonatomic, assign) UIButton * B_Refresh;
	@property (nonatomic, assign) UITableView * TV_Sites;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_CreateNewSite;
	-(void) setB_CreateNewSite:(UIButton *)p0;
	-(UIButton *) B_Refresh;
	-(void) setB_Refresh:(UIButton *)p0;
	-(UITableView *) TV_Sites;
	-(void) setTV_Sites:(UITableView *)p0;
	-(void) viewDidLoad;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_Calendar : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_ExcNewShift;
	@property (nonatomic, assign) UIButton * B_ExcSave;
	@property (nonatomic, assign) UIButton * B_NewException;
	@property (nonatomic, assign) UILabel * L_Advanced;
	@property (nonatomic, assign) UILabel * L_Basic;
	@property (nonatomic, assign) UILabel * L_CalendarEntryFor;
	@property (nonatomic, assign) UILabel * L_Close;
	@property (nonatomic, assign) UILabel * L_DeleteShift;
	@property (nonatomic, assign) UILabel * L_ExcSite;
	@property (nonatomic, assign) UILabel * L_Open;
	@property (nonatomic, assign) UILabel * L_ShiftDetails;
	@property (nonatomic, assign) UILabel * L_Shifts;
	@property (nonatomic, assign) UILabel * L_SiteIsOpen;
	@property (nonatomic, assign) UILabel * L_UsersOnShift;
	@property (nonatomic, assign) UISwitch * SW_ExcIsOpen;
	@property (nonatomic, assign) UITextField * TB_DateForCalendarEntry;
	@property (nonatomic, assign) UITextField * TB_ExcAdvShift;
	@property (nonatomic, assign) UITextField * TB_ExcBasicShift;
	@property (nonatomic, assign) UITextField * TB_ExcCloseShift;
	@property (nonatomic, assign) UITextField * TB_ExcDate;
	@property (nonatomic, assign) UITextField * TB_ExcOpenShift;
	@property (nonatomic, assign) UITableView * TV_Exceptions;
	@property (nonatomic, assign) UITableView * TV_ExcShifts;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_ExcNewShift;
	-(void) setB_ExcNewShift:(UIButton *)p0;
	-(UIButton *) B_ExcSave;
	-(void) setB_ExcSave:(UIButton *)p0;
	-(UIButton *) B_NewException;
	-(void) setB_NewException:(UIButton *)p0;
	-(UILabel *) L_Advanced;
	-(void) setL_Advanced:(UILabel *)p0;
	-(UILabel *) L_Basic;
	-(void) setL_Basic:(UILabel *)p0;
	-(UILabel *) L_CalendarEntryFor;
	-(void) setL_CalendarEntryFor:(UILabel *)p0;
	-(UILabel *) L_Close;
	-(void) setL_Close:(UILabel *)p0;
	-(UILabel *) L_DeleteShift;
	-(void) setL_DeleteShift:(UILabel *)p0;
	-(UILabel *) L_ExcSite;
	-(void) setL_ExcSite:(UILabel *)p0;
	-(UILabel *) L_Open;
	-(void) setL_Open:(UILabel *)p0;
	-(UILabel *) L_ShiftDetails;
	-(void) setL_ShiftDetails:(UILabel *)p0;
	-(UILabel *) L_Shifts;
	-(void) setL_Shifts:(UILabel *)p0;
	-(UILabel *) L_SiteIsOpen;
	-(void) setL_SiteIsOpen:(UILabel *)p0;
	-(UILabel *) L_UsersOnShift;
	-(void) setL_UsersOnShift:(UILabel *)p0;
	-(UISwitch *) SW_ExcIsOpen;
	-(void) setSW_ExcIsOpen:(UISwitch *)p0;
	-(UITextField *) TB_DateForCalendarEntry;
	-(void) setTB_DateForCalendarEntry:(UITextField *)p0;
	-(UITextField *) TB_ExcAdvShift;
	-(void) setTB_ExcAdvShift:(UITextField *)p0;
	-(UITextField *) TB_ExcBasicShift;
	-(void) setTB_ExcBasicShift:(UITextField *)p0;
	-(UITextField *) TB_ExcCloseShift;
	-(void) setTB_ExcCloseShift:(UITextField *)p0;
	-(UITextField *) TB_ExcDate;
	-(void) setTB_ExcDate:(UITextField *)p0;
	-(UITextField *) TB_ExcOpenShift;
	-(void) setTB_ExcOpenShift:(UITextField *)p0;
	-(UITableView *) TV_Exceptions;
	-(void) setTV_Exceptions:(UITableView *)p0;
	-(UITableView *) TV_ExcShifts;
	-(void) setTV_ExcShifts:(UITableView *)p0;
	-(void) viewDidAppear:(BOOL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface vitaadmin_VC_ShowNotifications_C_NotificationsTableSource : NSObject<UIScrollViewDelegate> {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1;
	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_ShowNotifications : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_CreateNew;
	@property (nonatomic, assign) UIButton * B_Save;
	@property (nonatomic, assign) UIButton * B_Send;
	@property (nonatomic, assign) UISegmentedControl * SC_Audience;
	@property (nonatomic, assign) UITextField * TB_Created;
	@property (nonatomic, assign) UITextField * TB_Sent;
	@property (nonatomic, assign) UITextField * TB_Updated;
	@property (nonatomic, assign) UITextView * TV_Message;
	@property (nonatomic, assign) UITableView * TV_Notifications;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_CreateNew;
	-(void) setB_CreateNew:(UIButton *)p0;
	-(UIButton *) B_Save;
	-(void) setB_Save:(UIButton *)p0;
	-(UIButton *) B_Send;
	-(void) setB_Send:(UIButton *)p0;
	-(UISegmentedControl *) SC_Audience;
	-(void) setSC_Audience:(UISegmentedControl *)p0;
	-(UITextField *) TB_Created;
	-(void) setTB_Created:(UITextField *)p0;
	-(UITextField *) TB_Sent;
	-(void) setTB_Sent:(UITextField *)p0;
	-(UITextField *) TB_Updated;
	-(void) setTB_Updated:(UITextField *)p0;
	-(UITextView *) TV_Message;
	-(void) setTV_Message:(UITextView *)p0;
	-(UITableView *) TV_Notifications;
	-(void) setTV_Notifications:(UITableView *)p0;
	-(void) viewDidLoad;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface vitaadmin_VC_Users_C_UsersTableSource : NSObject<UIScrollViewDelegate> {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1;
	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_Users : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UILabel * L_UsersData;
	@property (nonatomic, assign) UITableView * TV_Users;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UILabel *) L_UsersData;
	-(void) setL_UsersData:(UILabel *)p0;
	-(UITableView *) TV_Users;
	-(void) setTV_Users:(UITableView *)p0;
	-(void) viewDidLoad;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface vitaadmin_VC_Config_C_VersionsTableSource : NSObject<UIScrollViewDelegate> {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1;
	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_Config : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UILabel * L_AdminVersion;
	@property (nonatomic, assign) UILabel * L_BackendURL;
	@property (nonatomic, assign) UILabel * L_ConfigURL;
	@property (nonatomic, assign) UILabel * L_Offline;
	@property (nonatomic, assign) UILabel * L_SitesJsonURL;
	@property (nonatomic, assign) UITableView * TV_Versions;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UILabel *) L_AdminVersion;
	-(void) setL_AdminVersion:(UILabel *)p0;
	-(UILabel *) L_BackendURL;
	-(void) setL_BackendURL:(UILabel *)p0;
	-(UILabel *) L_ConfigURL;
	-(void) setL_ConfigURL:(UILabel *)p0;
	-(UILabel *) L_Offline;
	-(void) setL_Offline:(UILabel *)p0;
	-(UILabel *) L_SitesJsonURL;
	-(void) setL_SitesJsonURL:(UILabel *)p0;
	-(UITableView *) TV_Versions;
	-(void) setTV_Versions:(UITableView *)p0;
	-(void) viewDidLoad;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_Site : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_Calendar;
	@property (nonatomic, assign) UIButton * B_SaveChanges;
	@property (nonatomic, assign) UIButton * B_WorkItems;
	@property (nonatomic, assign) UILabel * L_Slug;
	@property (nonatomic, assign) UISwitch * SW_Accepting;
	@property (nonatomic, assign) UISwitch * SW_AtLimit;
	@property (nonatomic, assign) UISwitch * SW_Closed;
	@property (nonatomic, assign) UISwitch * SW_DropOff;
	@property (nonatomic, assign) UISwitch * SW_Express;
	@property (nonatomic, assign) UISwitch * SW_MFT;
	@property (nonatomic, assign) UISwitch * SW_NearLimit;
	@property (nonatomic, assign) UITextField * TB_Backup;
	@property (nonatomic, assign) UITextField * TB_City;
	@property (nonatomic, assign) UITextField * TB_Latitude;
	@property (nonatomic, assign) UITextField * TB_Longitude;
	@property (nonatomic, assign) UITextField * TB_PlaceID;
	@property (nonatomic, assign) UITextField * TB_Primary;
	@property (nonatomic, assign) UITextField * TB_SeasonEnd;
	@property (nonatomic, assign) UITextField * TB_SeasonStart;
	@property (nonatomic, assign) UITextField * TB_SiteName;
	@property (nonatomic, assign) UITextField * TB_State;
	@property (nonatomic, assign) UITextField * TB_Street;
	@property (nonatomic, assign) UITextField * TB_Zip;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_Calendar;
	-(void) setB_Calendar:(UIButton *)p0;
	-(UIButton *) B_SaveChanges;
	-(void) setB_SaveChanges:(UIButton *)p0;
	-(UIButton *) B_WorkItems;
	-(void) setB_WorkItems:(UIButton *)p0;
	-(UILabel *) L_Slug;
	-(void) setL_Slug:(UILabel *)p0;
	-(UISwitch *) SW_Accepting;
	-(void) setSW_Accepting:(UISwitch *)p0;
	-(UISwitch *) SW_AtLimit;
	-(void) setSW_AtLimit:(UISwitch *)p0;
	-(UISwitch *) SW_Closed;
	-(void) setSW_Closed:(UISwitch *)p0;
	-(UISwitch *) SW_DropOff;
	-(void) setSW_DropOff:(UISwitch *)p0;
	-(UISwitch *) SW_Express;
	-(void) setSW_Express:(UISwitch *)p0;
	-(UISwitch *) SW_MFT;
	-(void) setSW_MFT:(UISwitch *)p0;
	-(UISwitch *) SW_NearLimit;
	-(void) setSW_NearLimit:(UISwitch *)p0;
	-(UITextField *) TB_Backup;
	-(void) setTB_Backup:(UITextField *)p0;
	-(UITextField *) TB_City;
	-(void) setTB_City:(UITextField *)p0;
	-(UITextField *) TB_Latitude;
	-(void) setTB_Latitude:(UITextField *)p0;
	-(UITextField *) TB_Longitude;
	-(void) setTB_Longitude:(UITextField *)p0;
	-(UITextField *) TB_PlaceID;
	-(void) setTB_PlaceID:(UITextField *)p0;
	-(UITextField *) TB_Primary;
	-(void) setTB_Primary:(UITextField *)p0;
	-(UITextField *) TB_SeasonEnd;
	-(void) setTB_SeasonEnd:(UITextField *)p0;
	-(UITextField *) TB_SeasonStart;
	-(void) setTB_SeasonStart:(UITextField *)p0;
	-(UITextField *) TB_SiteName;
	-(void) setTB_SiteName:(UITextField *)p0;
	-(UITextField *) TB_State;
	-(void) setTB_State:(UITextField *)p0;
	-(UITextField *) TB_Street;
	-(void) setTB_Street:(UITextField *)p0;
	-(UITextField *) TB_Zip;
	-(void) setTB_Zip:(UITextField *)p0;
	-(void) viewDidLoad;
	-(void) viewDidAppear:(BOOL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface vitaadmin_VC_User_C_WorkItemsTableSource : NSObject<UIScrollViewDelegate> {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1;
	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface vitaadmin_VC_User_C_SiteNamesTableSource : NSObject<UIScrollViewDelegate> {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1;
	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_User : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_SaveUserDetails;
	@property (nonatomic, assign) UIButton * B_ViewSignups;
	@property (nonatomic, assign) UILabel * L_SignUps;
	@property (nonatomic, assign) UISegmentedControl * SC_Certification;
	@property (nonatomic, assign) UISwitch * SW_Administrator;
	@property (nonatomic, assign) UISwitch * SW_CertificationChanged;
	@property (nonatomic, assign) UISwitch * SW_EmailChanged;
	@property (nonatomic, assign) UISwitch * SW_NameChanged;
	@property (nonatomic, assign) UISwitch * SW_NewUser;
	@property (nonatomic, assign) UISwitch * SW_PasswordChanged;
	@property (nonatomic, assign) UISwitch * SW_PhoneChanged;
	@property (nonatomic, assign) UISwitch * SW_RolesChanged;
	@property (nonatomic, assign) UISwitch * SW_SiteCoordinator;
	@property (nonatomic, assign) UISwitch * SW_Volunteer;
	@property (nonatomic, assign) UITextField * TB_Email;
	@property (nonatomic, assign) UITextField * TB_Name;
	@property (nonatomic, assign) UITextField * TB_Password1;
	@property (nonatomic, assign) UITextField * TB_Password2;
	@property (nonatomic, assign) UITextField * TB_Phone;
	@property (nonatomic, assign) UITableView * TV_SignUps;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_SaveUserDetails;
	-(void) setB_SaveUserDetails:(UIButton *)p0;
	-(UIButton *) B_ViewSignups;
	-(void) setB_ViewSignups:(UIButton *)p0;
	-(UILabel *) L_SignUps;
	-(void) setL_SignUps:(UILabel *)p0;
	-(UISegmentedControl *) SC_Certification;
	-(void) setSC_Certification:(UISegmentedControl *)p0;
	-(UISwitch *) SW_Administrator;
	-(void) setSW_Administrator:(UISwitch *)p0;
	-(UISwitch *) SW_CertificationChanged;
	-(void) setSW_CertificationChanged:(UISwitch *)p0;
	-(UISwitch *) SW_EmailChanged;
	-(void) setSW_EmailChanged:(UISwitch *)p0;
	-(UISwitch *) SW_NameChanged;
	-(void) setSW_NameChanged:(UISwitch *)p0;
	-(UISwitch *) SW_NewUser;
	-(void) setSW_NewUser:(UISwitch *)p0;
	-(UISwitch *) SW_PasswordChanged;
	-(void) setSW_PasswordChanged:(UISwitch *)p0;
	-(UISwitch *) SW_PhoneChanged;
	-(void) setSW_PhoneChanged:(UISwitch *)p0;
	-(UISwitch *) SW_RolesChanged;
	-(void) setSW_RolesChanged:(UISwitch *)p0;
	-(UISwitch *) SW_SiteCoordinator;
	-(void) setSW_SiteCoordinator:(UISwitch *)p0;
	-(UISwitch *) SW_Volunteer;
	-(void) setSW_Volunteer:(UISwitch *)p0;
	-(UITextField *) TB_Email;
	-(void) setTB_Email:(UITextField *)p0;
	-(UITextField *) TB_Name;
	-(void) setTB_Name:(UITextField *)p0;
	-(UITextField *) TB_Password1;
	-(void) setTB_Password1:(UITextField *)p0;
	-(UITextField *) TB_Password2;
	-(void) setTB_Password2:(UITextField *)p0;
	-(UITextField *) TB_Phone;
	-(void) setTB_Phone:(UITextField *)p0;
	-(UITableView *) TV_SignUps;
	-(void) setTV_SignUps:(UITableView *)p0;
	-(void) viewDidLoad;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_CheckSignUps : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UITableView * TV_SignUps;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UITableView *) TV_SignUps;
	-(void) setTV_SignUps:(UITableView *)p0;
	-(void) viewDidLoad;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface vitaadmin_VC_OpenSites_C_OpenSitesTableSource : NSObject<UIScrollViewDelegate> {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(NSInteger) numberOfSectionsInTableView:(UITableView *)p0;
	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1;
	-(NSString *) tableView:(UITableView *)p0 titleForHeaderInSection:(NSInteger)p1;
	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_OpenSites : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UITextField * TB_Date;
	@property (nonatomic, assign) UITableView * TV_Sites;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UITextField *) TB_Date;
	-(void) setTB_Date:(UITextField *)p0;
	-(UITableView *) TV_Sites;
	-(void) setTV_Sites:(UITableView *)p0;
	-(void) viewDidLoad;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface vitaadmin_VC_Suggestions_C_SuggestionsTableDelegate : NSObject<UITableViewDelegate, UIScrollViewDelegate> {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(NSArray *) tableView:(UITableView *)p0 editActionsForRowAtIndexPath:(NSIndexPath *)p1;
	-(void) tableView:(UITableView *)p0 didSelectRowAtIndexPath:(NSIndexPath *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface vitaadmin_VC_WorkItems_C_WorkItemsTableDelegate : NSObject<UITableViewDelegate, UIScrollViewDelegate> {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(NSArray *) tableView:(UITableView *)p0 editActionsForRowAtIndexPath:(NSIndexPath *)p1;
	-(void) tableView:(UITableView *)p0 didSelectRowAtIndexPath:(NSIndexPath *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface vitaadmin_VC_WorkItems_C_WorkItemsTableSource : NSObject<UIScrollViewDelegate> {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1;
	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface vitaadmin_VC_Sites_C_SitesTableDelegate : NSObject<UITableViewDelegate, UIScrollViewDelegate> {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(void) tableView:(UITableView *)p0 didDeselectRowAtIndexPath:(NSIndexPath *)p1;
	-(void) tableView:(UITableView *)p0 didSelectRowAtIndexPath:(NSIndexPath *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface vitaadmin_VC_Calendar_C_CalendarEntryTableManager_C_CalendarEntryTableSource : NSObject<UIScrollViewDelegate> {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1;
	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface vitaadmin_VC_Calendar_C_ShiftTableManager_C_ShiftTableSource : NSObject<UIScrollViewDelegate> {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1;
	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface vitaadmin_VC_ShowNotifications_C_NotificationsTableDelegate : NSObject<UITableViewDelegate, UIScrollViewDelegate> {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(NSArray *) tableView:(UITableView *)p0 editActionsForRowAtIndexPath:(NSIndexPath *)p1;
	-(void) tableView:(UITableView *)p0 didDeselectRowAtIndexPath:(NSIndexPath *)p1;
	-(void) tableView:(UITableView *)p0 didSelectRowAtIndexPath:(NSIndexPath *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface vitaadmin_VC_Users_C_UsersTableDelegate : NSObject<UITableViewDelegate, UIScrollViewDelegate> {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(NSArray *) tableView:(UITableView *)p0 editActionsForRowAtIndexPath:(NSIndexPath *)p1;
	-(void) tableView:(UITableView *)p0 didDeselectRowAtIndexPath:(NSIndexPath *)p1;
	-(void) tableView:(UITableView *)p0 didSelectRowAtIndexPath:(NSIndexPath *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface vitaadmin_VC_CheckSignUps_C_WorkItemsTableSource : NSObject<UIScrollViewDelegate> {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1;
	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface vitaadmin_VC_Calendar_C_CalendarEntryTableManager_C_CalendarEntryTableDelegate : NSObject<UITableViewDelegate, UIScrollViewDelegate> {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(NSArray *) tableView:(UITableView *)p0 editActionsForRowAtIndexPath:(NSIndexPath *)p1;
	-(void) tableView:(UITableView *)p0 didDeselectRowAtIndexPath:(NSIndexPath *)p1;
	-(void) tableView:(UITableView *)p0 didSelectRowAtIndexPath:(NSIndexPath *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface vitaadmin_VC_Calendar_C_ShiftTableManager_C_ShiftTableDelegate : NSObject<UITableViewDelegate, UIScrollViewDelegate> {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(NSArray *) tableView:(UITableView *)p0 editActionsForRowAtIndexPath:(NSIndexPath *)p1;
	-(void) tableView:(UITableView *)p0 didDeselectRowAtIndexPath:(NSIndexPath *)p1;
	-(void) tableView:(UITableView *)p0 didSelectRowAtIndexPath:(NSIndexPath *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface __UIGestureRecognizerToken : NSObject {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface __UIGestureRecognizerParameterlessToken : __UIGestureRecognizerToken {
}
	-(void) target;
@end

@interface __UIGestureRecognizerParametrizedToken : __UIGestureRecognizerToken {
}
	-(void) target:(UIGestureRecognizer *)p0;
@end

