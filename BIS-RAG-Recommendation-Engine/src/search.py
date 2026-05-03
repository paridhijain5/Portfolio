import json
import faiss
import numpy as np
from sentence_transformers import SentenceTransformer

# Load model
model = SentenceTransformer("all-mpnet-base-v2")

# Load FAISS index
index = faiss.read_index("data/bis_index.faiss")

# Load metadata
with open("data/metadata.json", "r", encoding="utf-8") as f:
    metadata = json.load(f)

print("RAG system loaded.")

def search(query, top_k=5):

    # Convert query to embedding
    query_embedding = model.encode([query])

    query_embedding = np.array(query_embedding).astype("float32")
    faiss.normalize_L2(query_embedding)

    # Search vector DB
    distances, indices = index.search(query_embedding, top_k)

    results = []

    for idx in indices[0]:

        item = metadata[idx]

        results.append({
            "standard": item["standard"],
            "title": item["title"],
            "content": item["content"][:500]
        })

    return results


# TEST QUERY
query = input("Enter query: ")

results = search(query)

print("\nTop Results:\n")

for i, result in enumerate(results, 1):

    print(f"{i}. {result['standard']}")
    print(f"Title: {result['title']}")
    print()