# Project 1
**Sales Forecast Prediction using Python: Khayelihle Ngcebo Mfeka**

Sales forecasting is an important aspect of business planning, helping organizations predict future sales and make informed decisions about inventory management, marketing strategies and resource allocation. In this article we will explore how to build a sales forecast prediction model using Python.

Sales forecasting involves estimating current or future sales based on data trends.

Below is the step-by-step implementation of the sales prediction model.

**Poject Steps**

1. Import required libraries/Install

   * **pandas** - This library helps to load the data frame in a 2D array format and has multiple functions to perform analysis tasks in one go.
   * **numpy** - Numpy arrays are very fast and can perform large computations in a very short time.
   * **matplotlib** - This library is used to draw visualizations.
   * **seaborn** - This library is used to draw visualizations.
   * **xgboost** - provides an efficient and scalable implementation of gradient-boosted decision trees.
   * **scikit learn** - This module contains multiple libraries having pre-implemented functions to perform tasks from data preprocessing to model development and evaluation.

2. Loading the dataset (pandas)

    * The dataset used for this project features like Row ID, Order ID, Customer ID, Customer ID, etc.
    * You can find the data [here](https://github.com/KhayelihleMfeka/Data-Science-Projects/blob/main/Sales%20Forecast%20Prediction%20Using%20Python/train.csv)

3. Data Preprocessing and Visualization (pandas and matplotlib)

    In this step I preprocess the data and visualize the sales trend over time.
    *  **pd.to_datetime**: Converts the "Order Date" column into datetime format allowing us to        perform time-based operations.
    *  **groupby**: Groups the data by "Order Date" and sums the sales for each date, creating a       time series of daily sales.

4. Feature Engineering - Creating Lagged Features

    In this step I create lagged features to capture the temporal patterns in the sales data.
    * **create_lagged_features**: This function generates lagged features by shifting the sales          data by a given number of time steps like 1, 2, 3, etc. Lag features help the model learn          from the previous sales data to predict future sales.
    * **dropna**: Drops rows with missing values which are introduced due to the shift operation         when lagging.


