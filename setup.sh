#!/bin/bash

# Emulsify Android App Setup Script
# This script helps set up the Android development environment

echo "🔬 Emulsify Android App Setup"
echo "=================================="

# Check if Android Studio is installed
if command -v studio &> /dev/null; then
    echo "✅ Android Studio found"
else
    echo "❌ Android Studio not found. Please install Android Studio first."
    echo "   Download from: https://developer.android.com/studio"
    exit 1
fi

# Check if adb is available
if command -v adb &> /dev/null; then
    echo "✅ ADB found"
else
    echo "⚠️  ADB not found in PATH. Make sure Android SDK is properly installed."
fi

echo ""
echo "📱 Setting up port forwarding for backend connection..."

# Set up port forwarding for Android emulator/device
echo "Setting up port forwarding: adb reverse tcp:8000 tcp:8000"
adb reverse tcp:8000 tcp:8000

if [ $? -eq 0 ]; then
    echo "✅ Port forwarding setup successful"
else
    echo "⚠️  Port forwarding failed. Make sure:"
    echo "   1. Android device/emulator is connected"
    echo "   2. USB debugging is enabled"
    echo "   3. Backend server is running on localhost:8000"
fi

echo ""
echo "🚀 Next Steps:"
echo "1. Open Android Studio"
echo "2. Open this project (java-migration folder)"
echo "3. Wait for Gradle sync to complete"
echo "4. Connect Android device or start emulator"
echo "5. Click 'Run' to build and install the app"
echo ""
echo "📡 Backend Connection:"
echo "- Emulator: Uses http://10.0.2.2:8000/ (automatic)"
echo "- Physical Device: Update IP in NetworkClient.kt if needed"
echo "- Port Forwarding: Already configured above"
echo ""
echo "🔧 Troubleshooting:"
echo "- If build fails: File → Sync Project with Gradle Files"
echo "- If network fails: Check backend server and IP configuration"
echo "- If permissions denied: Grant storage permissions in app settings"

echo ""
echo "✨ Setup complete! Open the project in Android Studio to continue."