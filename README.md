# Classification Association Rules 

#### This is a part of the project discribed in the [Identifying Factors Involved in Road Accident Using Data Mining Techniques](https://github.com/Raghadd7/Raghadd7.github.io/blob/master/IF_page.md) page 





The following table shows four examples of the rules with their corresponding support, confidence and lift values.

| Antecedent (LHS)        | Consequent (RHS)       | Support           | Confidence   | Lift          | 
| ----------------------- | ---------------------- | ----------------- | ------------ | ------------- | 
| {Speed_limit=[50,70], Light_Conditions= Darkness- no lighting, Urban_or_Rural_Area= Rural, Casualty_Class= Pedestrian}  | {Casualty_Severity=Fatal} | 0.005577466 | 0.7981110 | 4.197737 |
| {Number_of_Vehicles=[1,23), Number_of_Casualties=[1,24), Light_Conditions= Darkness - no lighting, Casualty_Class= Pedestrian, Sex_of_Casualty= Male} | {Casualty_Severity=Fatal} | 0.005272190 | 0.7580071 | 3.986807 |
| {Light_Conditions= Darkness - no lighting, Casualty_Class= Pedestrian} | {Casualty_Severity=Fatal} | 0.006493292 | 0.7410546 | 3.897644 |
| {Speed_limit=[50,70], Weather_Conditions= Fine no high winds, Road_Surface_Conditions= Dry, Casualty_Class= Pedestrian, Sex_of_Casualty= Male} |  {Casualty_Severity=Fatal} | 0.005494959 | 0.7138264 | 3.754434 |

