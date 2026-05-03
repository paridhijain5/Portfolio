import json
import faiss
import numpy as np
from sentence_transformers import SentenceTransformer

# Load standards
with open("data/standards.json", "r", encoding="utf-8") as f:
    standards = json.load(f)

print(f"Loaded {len(standards)} standards.")

# Better embedding model
model = SentenceTransformer("all-mpnet-base-v2")

documents = []

for item in standards:

    text = f"""
    BIS Standard: {item['standard']}

    Product Title:
    {item['title']}

    Description:
    {item['content']}
    """

    documents.append(text)

print("Creating embeddings...")

embeddings = model.encode(
    documents,
    show_progress_bar=True,
    convert_to_numpy=True
)

embeddings = embeddings.astype("float32")

# Normalize embeddings
faiss.normalize_L2(embeddings)

dimension = embeddings.shape[1]

# Cosine similarity
index = faiss.IndexFlatIP(dimension)

index.add(embeddings)

print("FAISS index created.")

# Save index
faiss.write_index(index, "data/bis_index.faiss")

# Save metadata
with open("data/metadata.json", "w", encoding="utf-8") as f:
    json.dump(standards, f, indent=2)

print("Saved successfully.")