# type21_public

- `type21_public` is a public repository for the type21 project and now is under development.

## Description

- `type21_public` is a public repository for the type21 project and now is under development, Type21 is a Flutter-based mobile android applications deigned for rice filed management using AGDD to calculate state of rice and forecast harvest date after get enough AGDD data, so `enough AGDD data` is mean `Growing Degree Days` of rice, and `enough` is mean AGDD of rice is reach 80% of max AGDD of each rice species, so after AGDD of rice is reach 80% or above is might forecast harvest date by using GDD of past 7 days to forecast next 7 days GDD and i also use SMA to calculate next 7 day GDD as well, so is a combine of SMA and GDD to forecast harvest date of rice, and i also use Firebase functions to get 7 days forecast to get temperatures every days with that firebase functions it might update temp and gdd every day to make a forecast  functions is more accurate then using SMA to forecast.

### GDD And AGDD

- `AGDD` and `GDD` first of all `GDD` or `Growing Degree Days` is a heat units are used to estimate the growth and development of crops. They can be used retrospectively to calculate the current growth stage of crop, or help to forecast the date that crop will reach a predetermined growth stage.
so we development and test in Nakhon-Phanom Provide in Thailand other country may not work properly, and this app is make for spacial for Hom mali rice 105(KDML105) and Sticky rice(RD6) where is most popular in Nakhon-Phanom Provide in Thailand.

#### GDD

- `GDD`Growing Degree Days are calculated by taking the integral of warmth above a base temperature,Tbase(plant type dependant for rice in Thailand is 9 celsius)
- a simpler, approximately to calculate GDD uses the average of daily maximum and minimum temperatures compared to a Tbase to calculate degree-days for each day.
  as an equation: GDD =((Tmax+Tmin)/2)-Tbase
   if the minimum temperature Tmin is below the Tbase so GDD is might be 0

#### AGDD

- `AGDD` Accumulated degree days, or ADD, can be used to determine whether the total heat requirement for a stage of development has been met for an organism or predict whether it will be reached,  also use accumulated degree days to predict insect or plant development and success. These calculations can help scientists to understand the life of an organism by providing a helpful estimation of the total effect that temperature and time have on that organism.
- so for calculated AGDD is a simple ways is just Sum of GDD every days, so for example if we have 3 days with GDD = 10, 20, 30 so AGDD is 10+20+30 = 60.

### Example of GDD calculation

- for example, a day with Tmax = 37 and Tmin = 29 (and for a rice Tbase is 9) GDD = (37+29)/2-9 = 24
- for a second example, a day with Tmax = 12 and Tmin = 7 (and for a rice Tbase is 9)
 GDD = (12+7)/2-9 = 0 as i said before the minimum temperature Tmin is below the Tbase so GDD is might be 0.

## Rice Genetic Coefficient

The **genetic coefficient** is specific information about rice varieties described in the Rice Genetic Coefficient file *RICER980.CUL* of the CERES-Rice model. It includes **development coefficients**, which are variables that determine the physiological changes in rice, such as flowering and maturity. There are four values (P1, P20, P2R, and P5), and **growth coefficients** controlling quantitative changes or rice yield production with four values (G1, G2, G3, and G4). These coefficients are defined as follows:

1. **P1** is the time (growing degree days, GDD, in degrees Celsius) that exceeds the base temperature of 9 degrees Celsius from germination to the end of the basic vegetative phase or the phase where rice does not respond to photoperiod.

2. **P20** is the critical photoperiod, or the longest daylight hours (hours) that result in the highest rate of panicle initiation. If the photoperiod is greater than P20, the development rate decreases.

3. **P2R** is the time (in GDD) that panicle initiation (PI) is delayed per hour of daylight beyond P20.

4. **P5** is the time (in GDD) from the beginning of grain filling (3-4 days after flowering) to physiological maturity, with a base temperature of 9 degrees Celsius.

5. **G1** is the number of potential spikelets estimated from the number of spikelets per gram of dry weight of the main culm (excluding leaves and leaf sheaths and spikes) during anthesis. The typical value is 55.

6. **G2** is the weight of one seed (g) under ideal growing conditions, meaning no light, water, nutrient, pest, and disease limitations.

7. **G3** is the tillering coefficient (scaler value) compared to the IR64 variety under unlimited environmental conditions. Varieties with higher tillering will have coefficients greater than 1.0.

8. **G4** is the temperature tolerance coefficient. The normal value is 1.0 for varieties grown under normal conditions. For Japonica rice types grown in hot conditions, G4 is equal to or greater than 1.0, and for Indicate rice types in cold climates, it is less than 1.0.

### **Table 1: Genetic Coefficients of Eight Rice Varieties**

| Variety   | Phenology Coefficient (P1) | Phenology Coefficient (P2R) | Phenology Coefficient (P5) | Phenology Coefficient (P2O) | Growth Coefficient (G1) | Growth Coefficient (G2) | Growth Coefficient (G3) | Growth Coefficient (G4) |
|-----------|-----------------------------|-----------------------------|-----------------------------|-----------------------------|------------------------|------------------------|------------------------|------------------------|
| RD29      | 344.4                       | 194.3                       | 558.9                       | 11.96                       | 52.0                   | 0.0300                 | 0.65                   | 0.95                   |
| RD31      | 239.7                       | 186.7                       | 523.3                       | 11.42                       | 69.3                   | 0.0280                 | 0.93                   | 1.12                   |
| CNT1      | 407.3                       | 139.8                       | 568.4                       | 11.93                       | 51.5                   | 0.0300                 | 0.94                   | 0.89                   |
| PSL2      | 390.9                       | 198.6                       | 434.7                       | 11.87                       | 78.2                   | 0.0300                 | 0.82                   | 1.20                   |
| SPR3      | 332.4                       | 197.9                       | 474.7                       | 11.87                       | 79.9                   | 0.0290                 | 0.89                   | 1.04                   |
| RD6       | 367.9                       | 195.3                       | 367.1                       | 12.71                       | 64.3                   | 0.0220                 | 0.73                   | 1.14                   |
| KDML105   | 505.7                       | 180.8                       | 393.1                       | 11.02                       | 77.8                   | 0.0220                 | 0.52                   | 0.92                   |
| LN        | 403.7                       | 115.7                       | 537.8                       | 11.09                       | 53.2                   | 0.0200                 | 0.43                   | 0.85                   |

### **Table 2: Statistical Agreement Between Observed (Obs.) and Simulated (Sim.) Anthesis and Maturity Dates of Eight Rice Varieties**

| Variety   | Anthesis Date (Obs.) | Anthesis Date (Sim.) | RMSE (Anthesis) | RMSEn (%) (Anthesis) | Maturity Date (Obs.) | Maturity Date (Sim.) | RMSE (Maturity) | RMSEn (%) (Maturity) |
|-----------|-----------------------|-----------------------|------------------|------------------------|-----------------------|-----------------------|-----------------|-----------------------|
| RD29      | 127.78                | 130.67                | 9.40             | 7.36                   | 98.13                 | 107.00                | 13.79           | 14.06                 |
| RD31      | 71.13                 | 70.50                 | 5.49             | 7.71                   | 99.50                 | 102.75                | 9.19            | 9.24                  |
| CNT1      | 78.25                 | 75.00                 | 11.82            | 15.11                  | 104.13                | 105.38                | 11.45           | 10.99                 |
| PSL2      | 77.63                 | 84.00                 | 11.14            | 14.35                  | 104.38                | 109.63                | 7.04            | 6.74                  |
| SPR3      | 76.88                 | 71.88                 | 11.34            | 14.75                  | 103.13                | 104.50                | 14.14           | 13.71                 |
| RD6       | 93.20                 | 90.80                 | 4.94             | 5.30                   | 121.00                | 114.20                | 8.39            | 6.93                  |
| KDML105   | 91.00                 | 89.80                 | 40.39            | 44.39                  | 120.60                | 115.60                | 44.06           | 36.54                 |
| LN        | 141.25                | 166.00                | 25.15            | 17.80                  | 169.75                | 198.50                | 29.18           | 17.19                 |

### Rice Max GDD

- for my project `max GDD` is mean AGDD where rice is reach state where you can start harvest
- KDML 105 and RD6 max gdd is have many value base on photoperiod
- 10-11 hours/day max GDD is around 2000-2200 celsius
- 12+ hours/day max GDD is around 2700 celsius.

## Features

- **Real-Time Weather Data**: Fetch and display up to date weather information at your locations
- **Google map Integration**:View and interact with your filed locations on a Google map.
- **User Authentications**: User can login and logout using Email and google accounts.
- **Interactive UI**:Show your filed data and GDD in an interactive UI.

Firebase offers a suite of services that are integrated into the `Type21` application:

1. **Authentication**:
    - Manage user sign-up, login, and session using Firebase Authentication.
    - Supports multiple authentication methods including email/password
    <!---
    Google sign-in.
    --->

2. **Real-time Database & Cloud Firestore**:
    - Store and retrieve user preferences, history, and other specific data.
    - Provides real-time sync across devices and offline support.

3. ### Cloud Functions

Firebase Cloud Functions facilitate backend operations for the `Type21` application. These
serverless functions handle data processing, external service interactions, and various other tasks
that enhance the app's functionality. Here's a detailed overview of each function:

#### TempData

- **Purpose**: To fetch and store daily temperature data for every field.
- **Trigger**: Scheduled to activate daily at 7:00 AM (Asia/Bangkok timezone).

- **Data Flow**
- 1. Initiates by fetching field information from the Firestore collection "fields".
- 2. Acquires temperature data for each field through an external weather API.
- 3. Processes and saves the gathered temperature data back into Firestore.

#### CheckWeather

- **Purpose**: Regularly checks weather conditions and updates the Firestore database accordingly.
- **Trigger**: Scheduled execution (specific intervals can be specified based on requirements).

- **Data Flow**
- 1. Retrieves a list of specified regions or locations from Firestore.
- 2. For each location, it contacts an external weather service to get current weather conditions.
- 3. Updates Firestore with the latest weather data for each location.

#### UpdateUserData

- **Purpose**: Updates user-specific data in the Firestore database.
- **Trigger**: Activates upon specific user actions or changes in user-related data.

- **Data Flow**
- 1. Detects changes or actions related to user data (e.g., profile update, preferences change).
- 2. Processes and validates the new data provided.
- 3. Updates the Firestore database with the new user data.

#### CalculateAGDD

- **Purpose**: Computes the Accumulated Growing Degree Days (AGDD) for specific crops.
- **Trigger**: Scheduled to run at specific intervals or upon request.

##### - **Data Flow**

- 1. Gathers temperature and crop data from Firestore.
- 2. Computes AGDD using crop-specific base temperatures and daily temperature data.
- 3. Stores the calculated AGDD values back into Firestore.

#### NotifyUsers

- **Purpose**: Sends notifications to users based on specific conditions or triggers.
- **Trigger**: Based on specified conditions like weather changes, AGDD thresholds, etc.

- **Data Flow**
- 1. Monitors Firestore for changes or conditions that should trigger notifications.
- 2. Processes the data to determine which users should receive notifications.
- 3. Uses Firebase Cloud Messaging to dispatch notifications to the relevant users.

#### getTemperatureDataByMonth

- **Purpose**: Calculate and store monthly accumulated temperature data for each field.
- **Trigger**: Scheduled to activate every Monday at 7:30 AM (Asia/Bangkok timezone).

- **Data Flow**
- 1. Fetch field information from the Firestore collection "fields".
- 2. For each field, acquire temperature data from its respective sub-collection.
- 3. Calculate the monthly accumulated Growing Degree Days (GDD) for each temperature data point.
- 4. Store the calculated monthly GDD values in the Firestore sub-collection " temperatures_monthly" for each field.

#### calculateSMA (Utility Functions)

- **Purpose**: Calculate the Simple Moving Average (SMA) for a given array of values.
- **Parameters**:
  - `data`: The array of values for which the SMA is to be calculated.
  - `days`: The number of days to consider for the SMA calculation.
- **Returns**: The calculated SMA value or null if not enough data.

- **Data Flow**
- 1. Checks if the array of values contains enough data points for the SMA calculation.
- 2. Calculates the SMA using the specified number of days.
- 3. Returns the calculated SMA value.

#### harvestForecastDate

- **Purpose**: Predict the harvest date based on accumulated GDD and a 7-day SMA of temperature
      data.
- **Trigger**: Scheduled to activate every Monday at 9:10 AM (Asia/Bangkok timezone).
- **Data Flow**:
- 1. Fetch all field documents from the Firestore collection "fields".
- 2. For each field, retrieve the riceMaxGdd and accumulated GDD.
- 3. If the accumulated GDD has reached 80% of the riceMaxGdd, the function proceeds to forecast the harvest date.
- 4. Fetch and process temperature data for the field to create an array of daily GDD values.
- 5. Calculate a 7-day SMA for the GDD data.
- 6. Use the SMA value to forecast how many more days are required to reach the riceMaxGdd.
- 7. Calculate the forecasted harvest date and update it in the Firestore database for the field.

4. ### Analytics & Crashlytics

- Understand app usage patterns and user behavior with Firebase Analytics.
- Monitor app stability with real-time crash reports from Firebase Crashlytics.

5. ### Firebase Security

- Robust security features ensuring data privacy and integrity.
- Defined security rules for databases, storage, and other services ensuring authorized access.

## Getting Started

Follow these steps to get `Type21` running on your local machine for development and testing
purposes.

### Prerequisites

- Flutter SDK (latest version recommended).
- Firebase account for backend and authentication services.
- Active internet connection for fetching data.
- Open Weather Api Key.

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/lighting0217/type21.git
   ```

2. Navigate to the project directory:

   ```bash
   cd type21
   ```

3. Install Flutter dependencies:

   ```bash
   flutter pub get
   ```

4. Ensure you've set up Firebase authentication for your Flutter app. Refer to Firebase
   documentation for a step-by-step guide.

### Running the App

Once you've set up the environment and installed all dependencies, run the following command:

```bash
flutter run
```

## Built With

- **Flutter**
- **Firebase**
- **Google Maps Flutter Plugin**
- **Open Weather API**

## Contributing

Contributions are what make the open-source community such an inspiring place to learn, inspire, and
create. Any contributions you make to `Type21` are greatly appreciated.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## Setting Up API Keys and Firebase for Type21 Public API Keys Setup

To ensure the proper functioning of the application, you need to set up API keys for OpenWeather and Google Maps in your code. Here's how to do it:

### OpenWeather API Key

1. Visit the [OpenWeather website](https://openweathermap.org/) and either create an account or log in if you already have one.

2. After logging in, go to the [API Keys](https://home.openweathermap.org/api_keys) page to create a new API key.

3. Once you've created your API key, copy the API key value.

4. In your code, locate the following section and replace `"YOUR_OPENWEATHER_API_KEY"` with your actual OpenWeather API key:

```dart
const openWeatherAPIKey = "YOUR_OPENWEATHER_API_KEY";
```````````

### Google Maps API Key

- Go to the Google Cloud Console and sign in or create a new Google Cloud account if needed.
- After signing in, search for and select "Google Maps JavaScript API" under "API & Services" by navigating to "API & Services" > "Dashboard" and enabling this API.
- In the "Credentials" page (API & Services > Credentials), create a new API key.
- Copy the API key value.
- In your code, locate the following XML section within your AndroidManifest.xml file and replace "YOUR_GOOGLE_MAPS_API_KEY" with your actual Google Maps API key:
    <meta-data
        android:name="com.google.android.geo.API_KEY"
        android:value="YOUR_GOOGLE_MAPS_API_KEY" />

### Firebase Setup

- Apart from API keys, you also need to integrate this project with Firebase. Follow these steps to configure Firebase for your project:
- Go to the Firebase Console and sign in or create a new Firebase account if needed.
- Click "Add project" to create a new project or select an existing project.
- In your Firebase project's settings (Project Settings), accessible by clicking the gear icon in the top right corner, navigate to the "General" tab.
- Scroll down to the "Your apps" section, and click "Add app."
- Select Android as the platform and follow the setup instructions.
- You will receive a "google-services.json" file from Firebase. Copy this file and paste it into the "android/app" folder of your project.
- With these configurations, you have set up your API keys and integrated the project with Firebase. Your application is now ready to use!
- Please replace "YOUR_OPENWEATHER_API_KEY" and "YOUR_GOOGLE_MAPS_API_KEY" with your actual API keys in the provided Markdown text, and configure Firebase to match your project accordingly.
- Make sure to replace `"YOUR_OPENWEATHER_API_KEY"` and `"YOUR_GOOGLE_MAPS_API_KEY"` with your actual API key values when implementing these steps in your project.
