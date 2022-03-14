# SoulOfNoob's Home Assistant add-on repository

Add-on documentation: <https://developers.home-assistant.io/docs/add-ons>

[![Open your Home Assistant instance and show the add add-on repository dialog with a specific repository URL pre-filled.](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https://github.com/SoulOfNoob/HASSIO-Addons)

## Add-ons

This repository contains the following add-ons

### [Example add-on](./example)

![Supports aarch64 Architecture][aarch64-yes-shield]
![Supports amd64 Architecture][amd64-yes-shield]
![Supports armhf Architecture][armhf-yes-shield]
![Supports armv7 Architecture][armv7-yes-shield]
![Supports i386 Architecture][i386-yes-shield]

_Example add-on to use as a blueprint for new add-ons._

### [Omada Controller 5 add-on](./omada-5)

![Supports amd64 Architecture][amd64-yes-shield]
![Supports armv7 Architecture][armv7-yes-shield]
![Supports armv7 Architecture][arm64-yes-shield]
![Supports aarch64 Architecture][aarch64-yes-shield]
![Supports armhf Architecture][armhf-no-shield]
![Supports i386 Architecture][i386-no-shield]

_Omada Controller V5 addon for Home Assistant_

<!--

Notes to developers after forking or using the github template feature:
- While developing comment out the 'image' key from 'example/config.yaml' to make the supervisor build the addon
  - Remember to put this back when pushing up your changes.
- When you merge to the 'main' branch of your repository a new build will be triggered.
  - Make sure you adjust the 'version' key in 'example/config.yaml' when you do that.
  - Make sure you update 'example/CHANGELOG.md' when you do that.
  - The first time this runs you might need to adjust the image configuration on github container registry to make it public
- Adjust the 'image' key in 'example/config.yaml' so it points to your username instead of 'home-assistant'.
  - This is where the build images will be published to.
- Rename the example directory.
  - The 'slug' key in 'example/config.yaml' should match the directory name.
- Adjust all keys/url's that points to 'home-assistant' to now point to your user/fork.
- Share your repository on the forums https://community.home-assistant.io/c/projects/9
- Do awesome stuff!
 -->

[aarch64-yes-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[aarch64-no-shield]: https://img.shields.io/badge/aarch64-no-red.svg
[amd64-yes-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[amd64-no-shield]: https://img.shields.io/badge/amd64-no-red.svg
[arm64-yes-shield]: https://img.shields.io/badge/arm64-yes-green.svg
[arm64-no-shield]: https://img.shields.io/badge/arm64-no-red.svg
[armhf-yes-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armhf-no-shield]: https://img.shields.io/badge/armhf-no-red.svg
[armv7-yes-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[armv7-no-shield]: https://img.shields.io/badge/armv7-no-red.svg
[i386-yes-shield]: https://img.shields.io/badge/i386-yes-green.svg
[i386-no-shield]: https://img.shields.io/badge/i386-no-red.svg
