<p align="center"><ins>Built for Bureau of Indian Standards x Sigma Squad AI Hackathon</ins></p>

![](https://github.com/paridhijain5/Portfolio/blob/main/BIS-RAG-Recommendation-Engine/bis_rag_architecture.png)

# <u>BIS Standard Recommendation Engine</u>

AI-powered Retrieval-Augmented Generation (RAG) system for automating BIS standard discovery for Indian Micro and Small Enterprises (MSEs).

Built for the Bureau of Indian Standards x Sigma Squad AI Hackathon.

---

# Screenshots

| Homepage Interface | Recommendations |


<table>
  <tr>
    <td width="55%">
      <img src="https://github.com/paridhijain5/Portfolio/blob/main/BIS-RAG-Recommendation-Engine/homepage_interface.png" width="100%">
    </td>
    <td width="45%">
      <img src="https://github.com/paridhijain5/Portfolio/blob/main/BIS-RAG-Recommendation-Engine/recommendation_results_1.png" width="100%"><br><br>
      <img src="https://github.com/paridhijain5/Portfolio/blob/main/BIS-RAG-Recommendation-Engine/recommendation_results_2.png" width="100%">
    </td>
  </tr>
</table>



# Features

* Semantic BIS standard retrieval
* FAISS vector database
* Sentence-transformer embeddings
* Streamlit web interface
* Fast recommendation pipeline

---

# Tech Stack

* Python
* FAISS
* Sentence Transformers
* Streamlit
* PyMuPDF

---

# Evaluation Results

| Metric      | Score    |
| ----------- | -------- |
| Hit Rate @3 | 90%      |
| MRR @5      | 0.775    |
| Avg Latency | 0.22 sec |

---

# Run Project

## Install dependencies

pip install -r requirements.txt

## Run UI

streamlit run app.py

## Run inference

python inference.py --input data/public_test_set.json --output outputs/results.json

---

## Demo Video
[Watch Demo](your-link)
