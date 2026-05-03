import streamlit as st
import json
import faiss
import numpy as np
from sentence_transformers import SentenceTransformer

# Load model
model = SentenceTransformer("all-mpnet-base-v2")

# Load index
index = faiss.read_index("data/bis_index.faiss")

# Load metadata
with open("data/metadata.json", "r", encoding="utf-8") as f:
    metadata = json.load(f)

# Page config
st.set_page_config(page_title="BIS RAG System")

st.title("BIS Standard Recommendation Engine")

st.write("AI-powered BIS compliance recommendation system for Micro and Small Enterprises.")

query = st.text_area(
    "Enter Product Description",
    placeholder="Example: We manufacture white cement for decorative construction."
)

def search(query, top_k=5):

    query_embedding = model.encode([query])

    query_embedding = np.array(query_embedding).astype("float32")

    faiss.normalize_L2(query_embedding)

    distances, indices = index.search(query_embedding, top_k)

    results = []

    for idx in indices[0]:

        item = metadata[idx]

        results.append(item)

    return results

if st.button("Get BIS Recommendations"):

    if query.strip() == "":
        st.warning("Please enter a product description.")

    else:

        results = search(query)

        st.subheader("Recommended Standards")

        for i, result in enumerate(results, 1):

            st.markdown(f"### {i}. {result['standard']}")

            st.write(f"**Title:** {result['title']}")

            st.write(result['content'][:300] + "...")