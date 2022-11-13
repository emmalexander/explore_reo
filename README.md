# explore_app

This app displays a long list of every country, their capitals and their flags as provided by the [REST Country API](https://restcountries.com/#api-endpoints-v3-all)

It has a details screen where you can know more about the country such as the flags, coat of arm, the population of the country, the capital, the continent, etc.

You can as well search through the list by the country name and capital.

The Theme switching is handled with the help of a provider class in the providers directory.
This app can switch between dark and light mode.

Things I could have done if I had more time:
- Network Exceptions(Properly). But in case of a network issue just swipe down to refresh!
- Filtering by continents and time zones.
- Translations.
- Searching by Region, Subregion, Currency and Language.
- Better State Management
- Group the list by the countries by first letters.
- Unit and Widget test.

[Here](https://appetize.io/app/5ombqozodtz63rafm3ii2rawhy) is the Appetize link.

[APK LINK](https://drive.google.com/file/d/1jkZ7NWBSkZG80mZ0T94RP-jskz1K2HE1/view?usp=sharing)

Packages used in this project:

- [Provider Package](https://pub.dev/packages/provider): For State Management.
- [Shared Preferences](https://pub.dev/packages/shared_preferences): This helps to store the last selected theme before closing the app.
- [Google Fonts](https://pub.dev/packages/google_fonts): To use google fonts.
- [Http](https://pub.dev/packages/http): This package handles network access. Parse uri to get data from the API.
- [Flutter ScreenUtil](https://pub.dev/packages/flutter_screenutil): For UI responsiveness.
- [Card Swiper](https://pub.dev/packages/card_swiper): This is a Card Swiper package used to swipe between the flag image and the coat of arm image.

