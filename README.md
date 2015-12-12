# Wesh - mobile application

## Installation

To install you will need access to the following projects:

 * @TODO (backend)
 * https://github.com/sghribi/wesh (front)
 
To install backend, follow instructions in README of `@TODO` project.

Front development requires these following packages:

 * `npm`
 * `ionic`
 * `cordova`
 * `ant`

Assuming `npm` is installed, run this to install requirements :

``` bash
sudo npm install -g ionic
sudo npm install -g cordova
sudo apt-get install ant android-tools-adb
```

And run :

``` bash
# Install npm + bower dependencies and then build
npm install

# Edit config.json file
cp tools/build/config/config.json.dist tools/build/config/config.json

# Configure Facebook connect plugin
cordova -d plugin add cordova-plugin-facebook4 --variable APP_ID="@TODO" --variable APP_NAME="Wesh"

# Launch the watcher + livereload
npm start
# http://localhost:8000
```

## Git workflow

Branches description
--------------------

The **master** branch corresponds to the **production** environment where the final project is.
The **dev** branch corresponds to the **dev** environment where tests are done.
Other branches are **development** branches. Each development branch should match a **feature**, and match the following
pattern: **feature/XXX/name-of-the-feature**.

How to use Git on the project
-----------------------------

- Create a new branch **feature/XXX/name-of-the-feature** from **master**
- Commit your modifications on it
- Merge your custom branch on **dev**
- Deploy and build on the **dev** environment
- Upon validation, merge **feature/XXX/name-of-the-feature** onto **master**
- Deploy and build on the **prod** environment

**NOTE**: Do not merge **dev** on **master** otherwise you will merge not validated features and deploy them on
the **prod** environment!

## Developement

To test your iOS and Android platforms side-by-site, just run :

``` bash
ionic serve --lab
```

## Build and deploy

**WARNING** : don't forget to increment version in `config.xml` file after each release.

Android
-------

The first time, run :

``` bash
cordova platform add android
```

Then install Android SDK :

```
cd && wget "https://dl.google.com/android/android-sdk_r24.1.2-linux.tgz" && tar xvf android-sdk_r24.1.2-linux.tgz
```
Add path `~/android-sdk_r24.1.2-linux/tools` in your `.bashrc` or `.zshrc`

Then install JDK from here : http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html or on Debian with `sudo apt-get install openjdk-7-jdk`

Run the Android SDK Manager (`android &` on Debian), and choose : `Android SDK Build-Tools`, `Android SDK Tools`, `Android SDK Platform-tools`, `SDK Platform` of the target device, and the drivers corresponding to your OS.

To build on Android devices, run:

``` bash
# Debug
ionic run android --device

# Release (prod)
ionic run android --release
```


iOS (only on Mac)
-----------------

``` bash
cordova platform add ios
```

**@TODO: ...**

To build on iOS devices, run :

**@TODO: ...**

To build and deploy to HockeyApp, run:

``` bash
cordova-deploy --build --ios --hockey
```
