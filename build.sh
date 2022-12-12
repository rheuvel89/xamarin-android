#!/bin/bash

# Platform Layer
docker build -t rheuvel/xamarin-android:platform-only ./platform

# NDK Layer
docker build -t rheuvel/xamarin-android:ndk-only ./ndk

# API Levels + NDK
docker build -t rheuvel/xamarin-android:26-ndk-latest ./26/ndk
docker build -t rheuvel/xamarin-android:27-ndk-latest ./27/ndk
docker build -t rheuvel/xamarin-android:28-ndk-latest ./28/ndk
docker build -t rheuvel/xamarin-android:29-ndk-latest ./29/ndk
docker build -t rheuvel/xamarin-android:30-ndk-latest ./30/ndk
docker build -t rheuvel/xamarin-android:31-ndk-latest ./31/ndk
docker build -t rheuvel/xamarin-android:31-ndk-latest ./33/ndk

# API Levels
docker build -t rheuvel/xamarin-android:26-latest ./26
docker build -t rheuvel/xamarin-android:27-latest ./27
docker build -t rheuvel/xamarin-android:28-latest ./28
docker build -t rheuvel/xamarin-android:29-latest ./29
docker build -t rheuvel/xamarin-android:30-latest ./30
docker build -t rheuvel/xamarin-android:31-latest ./31
docker build -t rheuvel/xamarin-android:31-latest ./33
