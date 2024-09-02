#!/bin/bash

# Platform Layer
docker push rheuvel/xamarin-android:platform-only

# NDK Layer
docker push rheuvel/xamarin-android:ndk-only

# API Levels + NDK
#docker push rheuvel/xamarin-android:26-ndk-latest
#docker push rheuvel/xamarin-android:27-ndk-latest
#docker push rheuvel/xamarin-android:28-ndk-latest
#docker push rheuvel/xamarin-android:29-ndk-latest
#docker push rheuvel/xamarin-android:30-ndk-latest
#docker push rheuvel/xamarin-android:31-ndk-latest
#docker push rheuvel/xamarin-android:33-ndk-latest
docker push rheuvel/xamarin-android:33-ndk-latest

# API Levels
#docker push rheuvel/xamarin-android:26-latest
#docker push rheuvel/xamarin-android:27-latest
#docker push rheuvel/xamarin-android:28-latest
#docker push rheuvel/xamarin-android:29-latest
#docker push rheuvel/xamarin-android:30-latest
#docker push rheuvel/xamarin-android:31-latest
#docker push rheuvel/xamarin-android:33-latest
docker push rheuvel/xamarin-android:33-latest
