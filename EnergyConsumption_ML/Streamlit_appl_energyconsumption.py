import streamlit as st
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.linear_model import LinearRegression
import joblib

# Läs in data från de kombinerade CSV-filerna
data1 = pd.read_csv(
    r'C:\Users\simon\energyconsumption\KwhConsumptionBlower78_1.csv')
data2 = pd.read_csv(
    r'C:\Users\simon\energyconsumption\KwhConsumptionBlower78_2.csv')
data3 = pd.read_csv(
    r'C:\Users\simon\energyconsumption\KwhConsumptionBlower78_3.csv')

# Kombinera dataseten
combined_data = pd.concat([data1, data2, data3], ignore_index=True)

# Konvertera tiden till sekunder
combined_data['TxnTime'] = pd.to_datetime(combined_data['TxnTime']).dt.second

# Ladda den tränade modellen från filen
trained_model = joblib.load(
    r'C:\Users\simon\Agilt projektarbete\trained_model_linear.pkl')

# Läs in testdata från en CSV-fil i din Streamlit-applikation
test_data_streamlit = pd.read_csv('kombinerad_data.csv')

# Konvertera tiden till sekunder
combined_data.loc[:, 'TxnTime'] = pd.to_datetime(
    combined_data['TxnTime']).dt.second

# Gör förutsägelser med den tränade modellen
X_test_streamlit = test_data_streamlit['TxnTime'].values.reshape(-1, 1)
y_pred_streamlit = trained_model.predict(X_test_streamlit)

# Visa resultatet i Streamlit
st.write('Predicted Consumption:', y_pred_streamlit)

# Extrahera x och y från kombinerade data
x = combined_data['TxnTime'].values
y = combined_data['Consumption'].values

# Skapa en streamlit-applikation
st.title("Energy Consumption Prediction")

# Skapa en navigationsmeny
nav = st.sidebar.radio("Navigation Menu", ["Purpose", "Data & Modelling"])

# Definiera en funktion för modellering


def modelling(x, y):
    # Skapa en linjär regressionsmodell
    model = LinearRegression()
    model.fit(x.reshape(-1, 1), y)

    # Skapa en ny uppsättning x-värden för förutsägelser
    x_new = np.linspace(min(x), max(x), 100).reshape(-1, 1)

    # Gör förutsägelser med den tränade modellen
    y_pred = model.predict(x_new)

    # Skapa en plot för data och modellens förutsägelser
    plt.figure(figsize=(8, 4))
    plt.scatter(x, y, label="Data")
    plt.plot(x_new, y_pred, 'r', label="Predictions")
    plt.xlabel("Time (seconds)")
    plt.ylabel("Consumption")
    plt.legend()
    st.pyplot(plt)


# Beroende på användarens val i navigationsmenyn, visa olika sektioner
if nav == "Purpose":
    st.header("Purpose")
    st.write(
        "The purpose of this example demonstration is to give you an overview of Streamlit.")
    st.write("Happy Coding!")

elif nav == "Data & Modelling":
    st.header("Data & Machine Learning Modelling")
    st.subheader("Scatterplot of the Data")
    modelling(x, y)
