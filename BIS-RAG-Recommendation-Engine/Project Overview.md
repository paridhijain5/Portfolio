# BIS Standard Recommendation Engine

An AI-powered Retrieval-Augmented Generation (RAG) system developed for the Bureau of Indian Standards x Sigma Squad AI Hackathon.

## Overview

Indian Micro and Small Enterprises (MSEs) often face challenges in identifying the correct Bureau of Indian Standards (BIS) regulations applicable to their products. This project automates BIS standard discovery using semantic search and vector embeddings.

The system accepts a product description as input and returns the most relevant BIS standards within seconds.

## Features

* Automated BIS standard recommendation
* Semantic search using transformer embeddings
* FAISS vector database for fast retrieval
* Retrieval-Augmented Generation (RAG) pipeline
* Streamlit-based interactive web interface
* Low-latency inference pipeline
* Evaluation-ready output generation

## Tech Stack

* Python
* Sentence Transformers
* FAISS
* Streamlit
* PyMuPDF
* NumPy
* JSON

## Workflow

1. Extract BIS standards from PDF documents
2. Convert standards into embeddings
3. Store embeddings inside FAISS vector database
4. Convert user queries into embeddings
5. Retrieve top matching BIS standards
6. Display recommendations through the UI

## Evaluation Results

* Hit Rate @3: 90%
* MRR @5: 0.775
* Average Latency: 0.22 seconds

## Project Structure

```bash
bis-rag-hackathon/
│
├── data/
├── outputs/
├── src/
├── app.py
├── inference.py
├── requirements.txt
└── README.md
```

## Running the Project

### Install Dependencies

pip install -r requirements.txt

### Run Streamlit App

streamlit run app.py

### Run Inference Pipeline

python inference.py --input data/public_test_set.json --output outputs/results.json


## Demo Video
[Watch Demo](https://drive.google.com/file/d/1yeB504xN2ywx1TxoRqC5IFMH3cPD5eMJ/view?usp=sharing)


## Hackathon

[Bureau of Indian Standards x Sigma Squad AI Hackathon](https://unstop.com/hackathons/bureau-of-indian-standards-x-sigma-squad-ai-hackathon-indian-institute-of-technology-iit-tirupati-1679162)


## License
These projects are licensed under the MIT License - see the [MIT LICENSE](LICENSE) file for details.
