import json
import time
import argparse
import faiss
import numpy as np
from sentence_transformers import SentenceTransformer

# Load embedding model
model = SentenceTransformer("all-mpnet-base-v2")

# Load FAISS index
index = faiss.read_index("data/bis_index.faiss")

# Load metadata
with open("data/metadata.json", "r", encoding="utf-8") as f:
    metadata = json.load(f)

print("System loaded.")

def search(query, top_k=5):

    query_embedding = model.encode([query])

    query_embedding = np.array(query_embedding).astype("float32")

    faiss.normalize_L2(query_embedding)

    distances, indices = index.search(query_embedding, top_k)

    results = []

    for idx in indices[0]:

        item = metadata[idx]

        results.append(item["standard"])

    return results


def run_inference(input_path, output_path):

    with open(input_path, "r", encoding="utf-8") as f:
        queries = json.load(f)

    final_results = []

    for item in queries:

        query_id = item["id"]
        query_text = item["query"]

        start_time = time.time()

        retrieved = search(query_text)

        latency = round(time.time() - start_time, 2)

        final_results.append({
            "id": query_id,
            "retrieved_standards": retrieved,
            "latency_seconds": latency
        })

        print(f"Processed: {query_id}")

    with open(output_path, "w", encoding="utf-8") as f:
        json.dump(final_results, f, indent=2)

    print(f"\nResults saved to {output_path}")


if __name__ == "__main__":

    parser = argparse.ArgumentParser()

    parser.add_argument("--input", required=True)

    parser.add_argument("--output", required=True)

    args = parser.parse_args()

    run_inference(args.input, args.output)