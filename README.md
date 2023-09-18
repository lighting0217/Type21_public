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
