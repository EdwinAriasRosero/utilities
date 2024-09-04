# Capacitor/Docker

Add utilities for compiling a Capacitor project (on Windows OS + Android + debug mode) using Docker. We skip Android SDK configuration.

[Official Capacitor documentation](https://capacitorjs.com/solution/angular)

## Dependencies

- [Docker](https://www.docker.com/)

### Docker Image Specification

1. Ubuntu 20.04
2. Node 18
3. Android 34

## Installation

Run in your terminal

```bash
ng add @capacitor/angular
npm i @capacitor/android
npx cap add android
npm i @ea-utilities/capacitor -D
```

> Note: If error running `npx cap add android` try executing first `npx cap init` and follow instructions

## Package Scripts
Add the following scripts to your package.json file. Replace `{root application path}` with your project's root path:

```json
{
    "scripts": {
        "android": "eaAndroidBuilder {root application path} capacitorApp",
        // "android": "eaAndroidBuilder C:/dv/myAngularPath myAngularApp",
        "deploy": "npm run build && npx cap sync && npm run android"
    }
}
```

## Usage
Run `npm run deploy` in your terminal to generate a debug APK of your application.

Find in dist folder `app-debug.apk` file

## Validations and error
1. If the APK isn't generated on the first attempt, try running the command again. If issues persist, review your configuration.
1. Sometimes npx cap add android may not function as expected. In such cases, try running npx cap init first or refer to the Capacitor documentation for troubleshooting.
1. If `[error] The web assets directory (.\dist) must contain an index.html file. It will be the entry point for the web portion of the Capacitor app.` console error please configure `capacitor.config.ts` `webDir` with relative build dist directory