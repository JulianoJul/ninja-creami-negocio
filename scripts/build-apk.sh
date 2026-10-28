#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

# El sistema tiene JDK 27, pero Gradle/AGP de Capacitor 8 necesitan JDK 21.
JDK21="$HOME/.local/share/jdk21"
if [ -x "$JDK21/bin/java" ]; then
  export JAVA_HOME="$JDK21"
fi

export ANDROID_HOME="${ANDROID_HOME:-$HOME/Android/Sdk}"
export ANDROID_SDK_ROOT="$ANDROID_HOME"
export PATH="$JAVA_HOME/bin:$ANDROID_HOME/platform-tools:$PATH"

MODE="${1:-debug}"

echo "→ Sincronizando web con Android…"
npx cap sync android

cd android
if [ "$MODE" = "release" ]; then
  echo "→ Compilando APK release…"
  ./gradlew assembleRelease
  echo
  echo "APK: android/app/build/outputs/apk/release/app-release.apk"
else
  echo "→ Compilando APK debug…"
  ./gradlew assembleDebug
  echo
  echo "APK: android/app/build/outputs/apk/debug/app-debug.apk"
fi
