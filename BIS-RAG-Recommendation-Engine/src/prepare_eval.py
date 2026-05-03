import json

# Load public test set
with open("data/public_test_set.json", "r", encoding="utf-8") as f:
    expected_data = json.load(f)

# Load your results
with open("outputs/results.json", "r", encoding="utf-8") as f:
    result_data = json.load(f)

# Map expected standards
expected_map = {}

for item in expected_data:
    expected_map[item["id"]] = item["expected_standards"]

# Merge expected standards
final_eval = []

for item in result_data:

    item["expected_standards"] = expected_map[item["id"]]

    final_eval.append(item)

# Save merged file
with open("outputs/eval_ready.json", "w", encoding="utf-8") as f:
    json.dump(final_eval, f, indent=2)

print("eval_ready.json created.")