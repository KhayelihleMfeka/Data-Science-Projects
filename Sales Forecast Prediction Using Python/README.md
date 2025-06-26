**Project : Sales Forecast Prediction using Python**
**Khayelihle Ngcebo Mfeka**

# Project Overview



Sales forecasting is an important aspect of business planning, helping organizations predict future sales and make informed decisions about inventory management, marketing strategies and resource allocation. In this project I will explore how to build a sales forecast prediction model using Python.Sales forecasting involves estimating current or future sales based on data trends.

Below is the step-by-step implementation of the sales prediction model.

**Poject Steps**

1. **Import required libraries/Install**

   * **pandas** - This library helps to load the data frame in a 2D array format and has multiple functions to perform analysis tasks in one go.
   * **numpy** - Numpy arrays are very fast and can perform large computations in a very short time.
   * **matplotlib** - This library is used to draw visualizations.
   * **seaborn** - This library is used to draw visualizations.
   * **xgboost** - provides an efficient and scalable implementation of gradient-boosted decision trees.
   * **scikit learn** - This module contains multiple libraries having pre-implemented functions to perform tasks from data preprocessing to model development and evaluation.

2. **Loading the dataset (pandas)**

    * The dataset used for this project features like Row ID, Order ID, Customer ID, Customer ID, etc.
    * You can find the data [here](https://github.com/KhayelihleMfeka/Data-Science-Projects/blob/main/Sales%20Forecast%20Prediction%20Using%20Python/Sales_Data.csv)

3. **Data Preprocessing and Visualization (pandas and matplotlib)**

    In this step I preprocess the data and visualize the sales trend over time.
    *  **pd.to_datetime**: Converts the "Order Date" column into datetime format allowing us to        perform time-based operations.
    *  **groupby**: Groups the data by "Order Date" and sums the sales for each date, creating a       time series of daily sales.

4. **Feature Engineering - Creating Lagged Features**

    In this step I create lagged features to capture the temporal patterns in the sales data.
   
    * **create_lagged_features**: This function generates lagged features by shifting the sales          data by a given number of time steps like 1, 2, 3, etc. Lag features help the model learn          from the previous sales data to predict future sales.
    * **dropna**: Drops rows with missing values which are introduced due to the shift operation         when lagging.
  
5. **Preparing the Data for Training**

   In this step I prepare the data for training and testing.
   
    * **drop(columns)**: Removes the 'Order Date' and 'Sales' columns from the feature set X             since they are not needed for training as sales is the target variable.
    * **train_test_split**: Splits the dataset into training (80%) and testing (20%) sets.
    * **shuffle=False**: ensures that the data is split in chronological order preserving the             time series structure.

6. **Training the XGBoost Model**

    In this step I will train the XGBoost model. It is a machine learning algorithm that uses          gradient boosting to create highly accurate predictive models particularly well-suited for         regression tasks like sales forecasting.

      * **XGBRegressor**: Initializes an XGBoost model for regression tasks.
      * **objective='reg:squarederror'**: indicates that we are solving a regression problem i.e          predicting continuous sales values.
      * **learning_rate (lr)**: Controls the step size at each iteration while moving toward a           minimum of the loss function with smaller values leading to slower convergence.

    * **n_estimators**: The number of boosting rounds or trees to build with higher values             improving model accuracy but potentially leading to overfitting.
    * **max_depth**: Defines the maximum depth of each decision tree controlling the complexity        of the model. Deeper trees can model more complex patterns.
    * **fit**: Trains the model on the training data (X_train, y_train).
  
7. **Making Predictions and Evaluating the Model**

   In this step, I make predictions and evaluate the model performance using RMSE.
   
   * **predict**: Makes predictions on the test set (X_test) using the trained XGBoost model.
   * **mean_squared_error**: Computes the Mean Squared Error (MSE) between actual and                   predicted values. We use np.sqrt to compute the Root Mean Squared Error (RMSE), which               is a standard metric for evaluating regression models.

    **Results**: The RMSE of 734.63 indicates the average deviation between the actual and predicted sales values. A lower RMSE value               signifies better model accuracy, with the model's predictions being closer to the actual sales data. As we have large             amount of Sales data this RMSE score is accptable.

8. **Visualizing Results**

   In this step I will plot both the actual and predicted sales to visually compare the performance of the model.

     **Results**: As we can see the predicted and actual values are quite close to each other this proves the efficiency of our         model. Sales        forecasting using machine learning models like XGBoost can significantly enhance the accuracy of              predictions by capturing         temporal patterns in historical data. It can be used for improving sales predictions             helping businesses optimize inventory,       pricing and demand planning.

**Code**

You can find the code for this project [here](https://github.com/KhayelihleMfeka/Data-Science-Projects/blob/main/Sales%20Forecast%20Prediction%20Using%20Python/Sales%20Forecast%20Prediction%20Project.ipynb).

File overview:

Sales Forecast Prediction Project.ipynb - a Jupyter notebook that contains all of the code.
