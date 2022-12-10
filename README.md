# fetch-fbook
Repository for automated Android Facebook tests

## Introduction

This repository is used for automated testing for the Android Facebook app. The folder structure of this repository is primarily based on the structure used by the [Selenium Cucumber gem](https://github.com/selenium-cucumber/selenium-cucumber-ruby).

## Setup

### `zsh` Profile
The default shell in Mac OS is `zsh`, but gitlab pipelines expect to use `bash`. For this reason, these instructions will have you set up environment variables, etc. in a `~/.bash_profile` file, and will set up a `~/.zshrc` profile to reference the bash profile.

To set up a `zsh` profile:

1. Create an empty profile file and open it.

         $ touch ~/.zshrc
         $ open ~/.zshrc

2. Add the following to the file and save:

         if [ -f ~/.bash_profile ] ; then
            . ~/.bash_profile
         fi

After this, any `zsh` shell terminals will use the settings specified in `~/.bash_profile`.

### Xcode
Xcode command line tools are needed by Homebrew to download some of the required packages. It is recommended that you [install the full Xcode app from the App Store](https://apps.apple.com/us/app/xcode/id497799835?mt=12).

After installing Xcode, launch the app, then go to the `Xcode` menu, select `Preferences...`, then select the `Locations` tab to ensure that the Command Line Tools are selected.

![Command Line Tools](images/command-line-tools.png)

### Homebrew
Homebrew is a package manager for Mac OS and Linux.

To install, go to [Homebrew's webpage](https://brew.sh/) and follow their installation instructions.

Once installed, install Cask.

        $ brew tap homebrew/cask

Then, use homebrew to install node

        $ brew install node

### Ruby
Although MacOS comes with Ruby pre-installed, it doesn't provide all the permissions needed to run tests successfully. For this reason, you should install a separate Ruby version using `RVM`, which is also a gemset manager.

#### RVM

To install RVM, visit https://rvm.io/rvm/install

Next install Ruby version 2.7.6 as follows.

1. Run `rvm install 2.7.6`
2. Run `rvm --default use 2.7.6` to set the ruby version you just installed as the default ruby interpreter for your computer.
3. Confirm the ruby version with `ruby -v`.
   * If you get the incorrect version of ruby, try `source ~/.bash_profile`, kill your terminal session, start a new one, and try `ruby -v` again.

### Java JVM

Android emulators require the Java Virtual Machine (JVM) to run properly. You can install a Java 8 JDK with Homebrew:

      $ brew tap adoptopenjdk/openjdk
      $ brew install --cask adoptopenjdk8

Once installed, the JDK will be located in a folder similar to the following (your JDK version may differ):

    /Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home

### Android SDK

You will need the Android SDK Tools to be installed on your system.

1. First, create the following folder:

         $ mkdir -p ~/Library/Android/sdk/platforms

2. Go to the [Android Studio Downloads](https://developer.android.com/studio#downloads) page, and follow the instructions to download Android Studio

3. You should now have **~/Library/Android/sdk/cmdline-tools**.

4. Next, create a folder called `latest`, within the `cmdline-tools` folder:

         $ mkdir -p ~/Library/Android/sdk/cmdline-tools/latest

5. Now, move everything within `~/Library/Android/sdk/cmdline-tools` (except the `latest` folder) into `~/Library/Android/sdk/cmdline-tools/latest`:

         $ mv ~/Library/Android/sdk/cmdline-tools/bin* ~/Library/Android/sdk/cmdline-tools/latest
         $ mv ~/Library/Android/sdk/cmdline-tools/lib* ~/Library/Android/sdk/cmdline-tools/latest

   Make sure you move all directories and files into the `latest` directory.

### Android Emulator

1. Open the Android Studio app on your computer

2. Click "More Actions" > Virtual Device Manager

3. On the Device Manager window, click "Create Device"

4. Choose an Android device (I am using a Pixel 6), and click "Next"

5. Choose an Android system image (I am using Tiramisu (API_33)), and click "Next"

6. Click "Finish"

7. You should now have access to an Android Emulator. To launch it, go to "More Actions" > Virtual Device Manager, and click the Play button next to the emulator

### Set up PATH variables in `~/.bash_profile`

1. Add the following to your `~/.bash_profile` file:

        # Android 
        export JAVA_HOME=$(/usr/libexec/java_home)
        export ANDROID_HOME=/Users/[your username]/Library/Android/sdk
        export ANDROID_SDK_ROOT=/Users/[your username]/Library/Android/sdk
        export PATH=$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/build-tools:$ANDROID_HOME/cmdline-tools/latest/bin:$PATH

   **Note:** If you copy the above and paste into your file, remove any leading spaces from the lines.


2. Save and quit. Then, source the `.bash_profile`:

         $ source ~/.bash_profile

3. Get a list of available build tools from Android, and make note of the most current version, for example `33.0.0`, which will be used in the next step:

         $ sdkmanager --list | grep build-tools

4. Download `platform-tools`, `build_tools`, and `extras;intel;Hardware_Accelerated_Execution_Manager` with the SDK manager (which is part of the SDK tools you just installed) and accept the license agreement.


   **Note:** If using an M1+ laptop, skip the Hardware Accelerated Execution Manager, as it won't run on these machines.

         $ sdkmanager "platform-tools" "build-tools;[build number from previous step]" "extras;intel;Hardware_Accelerated_Execution_Manager"

5. You will need to install the HAXM package downloaded in Step 4 above, unless your laptop has an M1+ chip. In Finder, double-click the dmg file that was downloaded.

            $ANDROID_HOME/extras/intel/Hardware_Accelerated_Execution_Manager/IntelHAXM_[version].dmg

### Appium
Both mobile platforms require Appium, which has both a server and a desktop application.

   Install the Appium server and the mobile drivers with npm.

         $ npm install -g appium@next
         $ appium driver install xcuitest
         $ appium driver install uiautomator2

### Bundler

You will need Bundler to manage your gems

      $ gem install bundler

Now, do a bundle install:
   
      $ bundle install

### Cucumber

Cucumber is the framework in which these tests are structured. To install it, follow their [Installation instructions for Ruby](https://cucumber.io/docs/installation/ruby/)

## Running tests

### Start Appium server
Before you run a test, you will need to start an Appium server. Open a terminal window, and run:

      $ appium --base-path /wd/hub --address 127.0.0.1 --port 4723
**Note:** You will also need to kill this server after the test finishes (instructions below)

Wait a moment for the server to start. The logs should indicate that uiautomator2 is now available:

      [Appium] Available drivers:
      [Appium]   - uiautomator2@2.11.1 (automationName 'UiAutomator2')

### Run tests from terminal

Once your Appium server is up and running, open a separate terminal window to execute your tests

In the new terminal window, CD into the root directory of the project:

      $ cd [project directory]/fetch-fbook/

To run all the tests in the features directory, cd into your project root directory, and run:

      $ cucumber features/ 

To run a specific feature file, cd into your project root directory, and choose a specific feature file:

      $ cucumber features/profile.feature 

To run a specific scenario, you'll need to provide the line number of that scenario:

      $ cucumber features/profile.feature:11 

### Kill Appium server

Before running tests again, you'll need to kill the current Appium server, and start a new one

To do this, either `control+c` in the terminal window that is displaying the appium logs, or in a separate terminal window:

      $ pkill -9 -f appium