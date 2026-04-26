# <u>Trader Performance vs Market Sentiment Analysis</u>

## Objective
Analyze how market sentiment (Fear/Greed) impacts trader behavior and performance using Hyperliquid trading data.

## Methodology
1. **Data Preparation**
   - Cleaned and validated datasets (no missing values or duplicates)
   - Converted timestamps and aligned data at daily level
   - Merged sentiment with trading activity

2. **Feature Engineering**
   - Daily PnL per trader
   - Win rate
   - Trade frequency
   - Average trade size (risk proxy)
   - Long/short ratio

3. **Analysis**
   - Compared performance across sentiment regimes
   - Studied behavioral changes (activity, risk, direction)
   - Segmented traders (activity & risk levels)

4. **Modeling (Bonus)**
   - Built a Random Forest model to predict profitability


## Key Insights
- **Fear markets are most profitable**
  - Highest PnL (~209K) and win rate (~41%)

- **Trading activity drives performance**
  - High-frequency traders outperform consistently

- **Risk alone is not enough**
  - High risk + low activity leads to losses

- **Extreme Greed reduces efficiency**
  - Lower median PnL and consistency


## Strategy Recommendations
- Increase activity during **Fear markets**
- Avoid **high risk with low activity**
- Use **controlled risk during Greed**
- Reduce trading in **Neutral markets**


## Predictive Model
- Accuracy: ~93.75%
- Most important features:
  - Win rate
  - Trade frequency
  - Long/short ratio


## ▶️ How to Run

```bash
pip install -r requirements.txt
```


## License
This project is licensed under the MIT License: see the [MIT License](https://github.com/paridhijain5/Portfolio/blob/main/LICENSE) file for details.
