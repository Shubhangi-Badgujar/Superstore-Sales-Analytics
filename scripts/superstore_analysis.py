# superstore_analysis.py
# Author: Shubhangi Rahul Badgujar
# Project: Superstore Sales, Profit & Discount Analysis (2014-2017)

import numpy as np
import pandas as pd


def load_data(file_path: str) -> pd.DataFrame:
    df = pd.read_csv(file_path)
    df["Order Date"] = pd.to_datetime(df["Order Date"], errors="coerce")
    df["Ship Date"] = pd.to_datetime(df["Ship Date"], errors="coerce")
    return df


def summarize_kpis(df: pd.DataFrame) -> dict:
    total_sales = df["Sales"].sum()
    total_profit = df["Profit"].sum()
    profit_margin_pct = (total_profit / total_sales) * 100 if total_sales else 0.0
    total_orders = df["Order ID"].nunique()
    total_customers = df["Customer ID"].nunique()

    return {
        "total_sales": round(float(total_sales), 2),
        "total_profit": round(float(total_profit), 2),
        "profit_margin_pct": round(float(profit_margin_pct), 2),
        "total_orders": int(total_orders),
        "total_customers": int(total_customers),
    }


def main():
    print("Superstore Sales, Profit & Discount Analysis script ready.")
    print("Expected reference KPIs: Sales=$2,297,200.86, Profit=$286,397.02, Margin=12.47%")


if __name__ == "__main__":
    main()
