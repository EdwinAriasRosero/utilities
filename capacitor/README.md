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

## Package Scripts
Add the following scripts to your package.json file. Replace `{root application path}` with your project's root path:

```json
{
    "scripts": {
        "android": "eaAndroidBuilder {root application path} capacitorApp",
        "deploy": "npm run build && npx cap sync && npm run android"
    }
}
```

## Usage
Run `npm run deploy` in your terminal to generate a debug APK of your application.

## Validations
1. If the APK isn't generated on the first attempt, try running the command again. If issues persist, review your configuration.
1. Sometimes npx cap add android may not function as expected. In such cases, try running npx cap init first or refer to the Capacitor documentation for troubleshooting.