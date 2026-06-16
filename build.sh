#!/usr/bin/env bash

VERSION_CODE="7"
VERSION_NAME="0.0.7"

set -euo pipefail
rm -rf .git/modules/src/rebase-apply
cd src
git am --whitespace=nowarn --keep-non-patch ../patches/*.patch

cp -R ../res/. app/src/main/res/
sed -i 's|applicationId = "[^"]*"|applicationId = "io.github.jqssun.btremote"|' app/build.gradle.kts
sed -i "s|versionCode = [0-9]\+|versionCode = $VERSION_CODE|" app/build.gradle.kts
sed -i 's|versionName = "[^"]*"|versionName = "'"$VERSION_NAME"'"|' app/build.gradle.kts
sed -i 's|Android TV|macOS/iOS/iPadOS/tvOS/Windows/Linux|' app/src/main/res/values*/strings.xml
sed -i 's|<string name="app_name">[^<]*</string>|<string name="app_name">Bluetooth Remote</string>|' app/src/main/res/values*/strings.xml
sed -i 's|const val SOURCE_CODE_LINK = "[^"]*"|const val SOURCE_CODE_LINK = "https://github.com/jqssun/android-bt-remote"|' app/src/main/java/com/atharok/btremote/common/utils/Constants.kt
sed -i 's|const val WEB_SITE_LINK = "[^"]*"|const val WEB_SITE_LINK = "https://github.com/jqssun/android-bt-remote"|' app/src/main/java/com/atharok/btremote/common/utils/Constants.kt

# git reset --hard origin/HEAD && git clean -fdx