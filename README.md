# Football Data Analysis Project
This repository contains an in-depth analysis of football player data, focusing on player attributes, performance metrics, and their impact on key factors such as overall rating, potential, wage, and value. The goal is to explore the relationships between these variables and to lay the foundation for building predictive models using machine learning.

The analysis is carried out in a Jupyter Notebook using Python, leveraging libraries such as Pandas, Seaborn, and Matplotlib.
Please use the following code should you need to install any of the libraries: 
1) pip install pandas 
2) pip install numpy 
3) pip install seaborn 
4) pip install matplotlib

## Key Features:
### 1) Data Cleaning

**Unique Identifier Creation:**
A unique identifier column (id) was created for each player using a sequential numbering approach. This ensures that each player can be uniquely identified, which is essential for merging and joining data from multiple sources.
The id column was then reordered to be the first column in the DataFrame to make it easily accessible during analysis and data manipulation.
Dropping Irrelevant Columns:

Several columns that were deemed irrelevant for the analysis or predictive modeling were removed from the dataset.
Removing these columns helped reduce noise in the data and focused the analysis on the most relevant features for model building.

**Handling Missing Data:**
Rows with missing values in critical columns such as value_euro and wage_euro were dropped from the dataset. This ensures that only complete records are used for further analysis, improving the quality and reliability of the data.

### Creating a Player Information DataFrame:
A new DataFrame (df_player_info) was created to store key information about players.

### Calculating Player Age:
An age column was created by calculating the difference between the current year and the player’s birth year (from the birth_date column). This allows for age-based analysis, which is often critical in sports analytics.

### Extracting Primary Position:
The positions column, which may contain multiple positions (e.g., CM, LM, CAM), was processed using a regular expression to extract the player's primary (first) position. This simplifies position-based analysis by focusing on the player's main role.

### Filtering Data for Specific Roles:
Several DataFrames were created to focus on specific player roles:
Defensive Players (df_defense): Filtered the dataset to include players with defensive positions (e.g., LB, RB, CB, LWB, RWB). Relevant defensive attributes such as aggression, interceptions, standing_tackle, and sliding_tackle were retained for further analysis.
Attacking Players (df_attackers): Filtered the dataset to include players with attacking positions (e.g., CM, CAM, ST, LW, RW). Relevant attacking attributes such as finishing, dribbling, and crossing were retained.
Physical Attributes (df_physical): A separate DataFrame was created to focus on players' physical attributes such as reactions, balance, jumping, stamina, and strength.
Goalkeepers (df_gk): Goalkeepers were filtered into a separate DataFrame (df_gk) to focus on goalkeeper-specific attributes such as agility, positioning, reactions, and strength.

### Final Dataset for Model Preparation:
After filtering and cleaning, several role-specific DataFrames were prepared for subsequent model building. Each of these DataFrames focuses on attributes that are most relevant to the player's role, enabling more precise and relevant predictions.

### Visualizations:
Created using Seaborn and Matplotlib to uncover patterns and relationships between different variables.
These include:
Correlation heatmaps to identify relationships between features.
Pair plots to visualize relationships between multiple features.
Box plots to explore the distribution of player attributes by position.
Scatter plots to understand the impact of overall rating on wage and value.
Key Questions Addressed:

What attributes have the most impact on a player's wage and value?
How do attributes like overall rating, potential, and age correlate with each other?


### Feature Engineering
Creation of new features based on existing attributes (e.g., mean of overall rating and potential).
Identification of key features for machine learning models.

### Machine Learning Preparation
Visualization and analysis to justify the inclusion of specific features in predictive models.
Consideration of how attributes like overall rating, potential, age, wage, and value can be used to predict outcomes such as player market value or future potential.

### Data Source
The dataset was sourced from Kaggle, which provides publicly available football player data.

### Why SQL?
SQL databases are beneficial for this project because they allow for easy querying of complex data relationships between players, teams, and their attributes.
The relational structure of the data makes it easier to join tables, filter data, and perform aggregate operations, which are essential in preparing data for machine learning models.
Additionally, SQL’s standard querying language makes it highly flexible and scalable for handling large datasets, such as those typically found in sports analytics.

### Average Rating by Position:

Calculated the average overall rating for players in each position and sorted the results in descending order of the average rating.
Maximum Rating at Each Position:

Retrieved the maximum overall rating for each position and sorted the results in descending order of the maximum rating.
Top 10 Performers by Dribbling Skill:

Selected the top 10 players based on their dribbling skill from the attackers_data table. This involved an inner join with the player_info table to retrieve player names and positions.
Average Wage by Position:

Calculated the average wage (in euros) for players at each position and sorted the results in descending order of the average wage.
Average Value by Position:

Calculated the average market value (in euros) for players at each position and sorted the results in descending order of the average value.
Average Wage by Overall Rating:

Calculated the average wage (in euros) for players grouped by their overall rating and sorted the results in descending order of the average wage.
Average Value by Overall Rating:

Calculated the average market value (in euros) for players grouped by their overall rating and sorted the results in descending order of the average value.
Maximum Wage at Each Position:

Retrieved the maximum wage (in euros) for players at each position. The query grouped by player name and position and sorted the results in descending order of the maximum wage.
Maximum Value at Each Position:

Retrieved the maximum market value (in euros) for players at each position. The query grouped by player name and position and sorted the results in descending order of the maximum value.

### Ethical Considerations
In this project, we have prioritized data ethics and privacy.
The dataset has been sourced from Kaggle and contains anonymized data about football players.
No personally identifiable information (PII) is used in this analysis, and all data processing has been conducted with a focus on respecting the privacy and dignity of individuals.
Furthermore, the project aims to avoid perpetuating any biases in the predictive models, particularly those related to sensitive attributes like nationality or ethnicity.
By carefully handling and processing the data, we ensure that our analysis is conducted responsibly and ethically.
