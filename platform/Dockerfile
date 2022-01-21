FROM ubuntu:focal

LABEL maintainer="Ruurd Heuvel <rheuvel89@gmail.com>"

ENV TZ=Europe/Amsterdam

# Get command line tools version from here: https://developer.android.com/studio
ENV SDK_CMD_TOOLS=6858069
# Get BUILD ID from here: https://dev.azure.com/xamarin/public/_build?definitionId=48&_a=summary
# Click on the desired commit and extract the buildId from the url
ENV XAMARIN_OSS_BUILD_ID=34843

RUN apt-get update && apt-get install -y \
    curl \
    gnupg2 \
    tzdata \
    && rm -rf /var/lib/apt/lists/*

# .NET
RUN curl -k "https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb" -o dotnet.deb && \
    dpkg -i dotnet.deb

# MONO
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
    echo "deb https://download.mono-project.com/repo/ubuntu stable-focal main" | tee /etc/apt/sources.list.d/mono-official-stable.list && \
    apt-get update && apt-get install -y \
    mono-complete \
    dotnet-sdk-5.0 \
    nuget \
    && rm -rf /var/lib/apt/lists/*

# Xamarin Android OSS Linux
RUN apt-get update && apt-get install -y \
    unzip \
    jq \
    lxd \
    bzip2 \
    libzip5 \
    libzip-dev \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /usr/lib/xamarin.android && \
    mkdir /usr/lib/mono/xbuild/Xamarin/ && \
    mkdir /xamarin && \
    mkdir /tmp/xamarin-linux/ && \
    mkdir /tmp/xamarin-linux/Installers - Linux/

RUN curl -k "https://dev.azure.com/xamarin/public/_apis/build/builds/$XAMARIN_OSS_BUILD_ID/artifacts?artifactName=Installers%20-%20Linux&api-version=7.0" | curl -L $(jq -r '.resource.downloadUrl') -o xamarin-linux.zip
RUN unzip -q xamarin-linux.zip -d /tmp/xamarin-linux
RUN rm xamarin-linux.zip
RUN cd "/tmp/xamarin-linux/Installers - Linux/"
#RUN tar xjf ./xamarin.android-oss-v*.tar.bz2 --strip 1 -C /xamarin
RUN tar xjf "/tmp/xamarin-linux/Installers - Linux/xamarin.android-oss-v11.2.99.0_Linux-x86_64_master_05bb8e0e-Release.tar.bz2" --strip 1 -C /xamarin
RUN cp -a /xamarin/bin/Release/lib/xamarin.android/. /usr/lib/xamarin.android/
RUN rm -rf /usr/lib/mono/xbuild/Xamarin/Android && \
    rm -rf /usr/lib/mono/xbuild-frameworks/MonoAndroid && \
    ln -s /usr/lib/xamarin.android/xbuild/Xamarin/Android/ /usr/lib/mono/xbuild/Xamarin/Android && \
    ln -s /usr/lib/xamarin.android/xbuild-frameworks/MonoAndroid/ /usr/lib/mono/xbuild-frameworks/MonoAndroid && \
    ln -s /usr/lib/x86_64-linux-gnu/libzip.so.5.0 /usr/lib/x86_64-linux-gnu/libzip.so.4 && \
    rm -rf /tmp/xamarin-linux

ENV PATH=/xamarin/bin/Release/bin:$PATH

# JAVA
RUN apt-get update && apt-get install -y \
    openjdk-8-jdk-headless \
    && rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/

# Android SDK
RUN apt-get update && apt-get install -y \
    unzip &&\
    rm -rf /var/lib/apt/lists/* &&\
    mkdir -p /usr/lib/android-sdk/cmdline-tools/latest && \
    curl -k "https://dl.google.com/android/repository/commandlinetools-linux-{$SDK_CMD_TOOLS}_latest.zip" -o commandlinetools-linux.zip && \
    unzip -q commandlinetools-linux.zip -d /usr/lib/android-sdk/tmp && \
    mv  /usr/lib/android-sdk/tmp/cmdline-tools/* /usr/lib/android-sdk/cmdline-tools/latest && \
    rm -rf /usr/lib/android-sdk/tmp/ && \
    rm commandlinetools-linux.zip 

# Link Android SDK path
RUN mkdir /root/Library && \
    mkdir /root/Library/Android && \
    ln -s /usr/lib/android-sdk /root/Library/Android/sdk

ENV ANDROID_SDK_ROOT=/usr/lib/android-sdk
ENV PATH=$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$PATH

RUN yes | sdkmanager --licenses && \
    sdkmanager "platform-tools"