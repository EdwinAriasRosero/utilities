# Capacitor/Docker

Add utilities for compiling a capacitor project with docker (You can skip all android sdk configuration)

## Capacitor oficial documentation
https://capacitorjs.com/solution/angular

# Steps
> ng add @capacitor/angular

> ng build --prod

> npm i @capacitor/ios @capacitor/android

> npx cap init

> npx cap add android

> npx cap add ios

## Installation

npm i @utilities-ea/capacitor -D

## package script

"android": "eaAndroidBuilder C:\\DV\\capacitor-app capacitorApp"


# Docker specification

1. Ubuntu 20.04
1. node 18
1. Android 34


# Compilation

1. ng build
1. npx cap sync
1. npm run android

# Validations

check capacitor.config.ts and configure webDir with dist path





<!-- 
# Demo

https://stackblitz.com/edit/stackblitz-starters-coddjt?file=src%2Fmain.ts

# Installation
> npm i @control-ea/spinner

# Instructions

## Modules
```ts
import { SpinnerComponent } from '@control-ea/spinner';
```

## Use

Add in `app.component.html` the tag `<ea-spinner color="{optional}" />`

> Note: only add this tag once.

```hmtl app.component.ts
<ea-spinner color="red" />
```

In components now you can inject `SpinnerService` and use its methods `show(message?)` or `hide()`

```ts
constructor(private spinnerService: SpinnerService) {

    this.spinnerService.show("Saving data...");

    timer(1000).subscribe(_ => {
        this.spinnerService.show("Data saved...");
    })

    timer(2000).subscribe(_ => {
        this.spinnerService.show("Loading data...");
    })

    timer(3000).subscribe(_ => {
        this.spinnerService.hide();
    });

}
```

> Note: color and message inputs are optional
> Note: You can send optional content in `<ea-spinner> <img src="img.gif"> </ea-spinner>` if you want to customize spinner, services you can continue using in same way

## Result

![Spinner](https://github.com/EdwinAriasRosero/controls/blob/main/libs/spinner/assets/spinner.PNG?raw=true)

## Custom content

![Custom spinner](https://github.com/EdwinAriasRosero/controls/blob/main/libs/spinner/assets/spinner-custom.PNG?raw=true) -->
