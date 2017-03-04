# GoldenPassport

A native implementation of Google Authenticator for Mac based on Swift3.

# Screenshot

![main](screenshot/main.png)

![add](screenshot/add-window.png)

# Features

- Recognize OTPAuth URL from QRCode
- Support RESTful API to obtain the verification code
- Click an auth-menu to copy the verification code
- Use a global hot key(`Shift+Cmd+[0-9]`) to direct fill out the verification code

# How to use

1. Download the latest version of GoldenPassport from [releases](https://github.com/stanzhai/GoldenPassport/releases)
2. Put `GoldenPassport.app` to your `Application` folder then start it. 
3. Add an auth URL from the status menu

Now, you can get the verification code by:

- From the status menu, copy the verification by clicking an auth-menu 
- Or, use a global hot key(`Shift+Cmd+[0-9]`) to direct fill out the verification code

You can use the RESTful API if you want to get the verification code from a shell script by the following way:

```
# you can get the url from `http://localhost:17304/`
code=$(curl 'http://localhost:17304/code/stan@stanzhai.site')
# ues the verification code
echo $code
```

# Todo

- Support auto startup with system.
- i18n

# Resources

- [Swift Resources](https://developer.apple.com/swift/resources/)
- [macOS Development Tutorials](https://www.raywenderlich.com/category/macos)
- [google-authenticator](https://github.com/google/google-authenticator)
- [WeatherBar](http://footle.org/WeatherBar/)
