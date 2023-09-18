wget https://dl.google.com/android/repository/commandlinetools-linux-9123335_latest.zip
unzip commandlinetools-linux-9123335_latest.zip
mv cmdline-tools latest
mkdir $HOME/.android
mkdir $HOME/.android/cmdline-tools
mv latest $HOME/.android/cmdline-tools
# Export the Android SDK path 
rm -f ./commandlinetools-linux-9123335_latest.zip

echo 'export ANDROID_HOME=$HOME/.android' >> ~/.bashrc
echo 'export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin' >> ~/.bashrc
echo 'export PATH=$PATH:$ANDROID_HOME/platform-tools' >> ~/.bashrc
echo 'export PATH=$PATH:$ANDROID_HOME/tools' >> ~/.bashrc
echo 'export PATH=$PATH:$ANDROID_HOME/tools/bin' >> ~/.bashrc
echo 'export PATH=$PATH:$ANDROID_HOME/emulator' >> ~/.bashrc

source ~/.bashrc

yes | sdkmanager "platform-tools" "platforms;android-33"
yes | sdkmanager "build-tools;33.0.0"
yes | sdkmanager "extras;android;m2repository"
yes | sdkmanager --install "ndk;23.1.7779620"
