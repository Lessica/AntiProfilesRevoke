TARGET := iphone:clang:14.5:13.0
ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = AntiProfilesRevoke

AntiProfilesRevoke_FILES = Tweak.xm
AntiProfilesRevoke_CFLAGS = -fobjc-arc
AntiProfilesRevoke_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
