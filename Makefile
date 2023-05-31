project:
	tuist clean
	tuist fetch
	tuist generate --no-open && open TuistSample.xcworkspace
#	tuist generate --no-open && pod install &&  open TuistSample.xcworkspace
	
open:
	tuist generate --no-open && open TuistSample.xcworkspace
#	tuist generate --no-open && pod install &&  open TuistSample.xcworkspace.xcworkspace

asset:
	tuist generate
	pod install
