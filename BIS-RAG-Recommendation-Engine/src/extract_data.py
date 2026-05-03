import fitz
import re
import json

PDF_PATH = "data/dataset.pdf"

doc = fitz.open(PDF_PATH)

full_text = ""

# Extract all text
for page in doc:
    full_text += page.get_text()

print("PDF extracted.")

# Split by SUMMARY OF
sections = full_text.split("SUMMARY OF")

standards = []

for section in sections[1:]:

    lines = [line.strip() for line in section.split("\n") if line.strip()]

    if len(lines) < 3:
        continue

    # Standard number line
    match = re.search(r"(IS\s*[\d]+(?:\s*\(PART\s*\d+\))?\s*:\s*\d+)", lines[0], re.IGNORECASE)

    if match:
        standard = match.group(1).strip()
    else:
        continue

    # Title line
    title = lines[1]

    # Content
    content = " ".join(lines[2:25])

    # Basic cleaning
    standard = standard.replace("SUMMARY OF", "").strip()

    # Keep only proper IS standards
    if not standard.startswith("IS"):
        continue

    if len(standard) > 100:
        continue

    standards.append({
        "standard": standard,
        "title": title,
        "content": content
    })

print(f"Total clean standards: {len(standards)}")

# Save JSON
with open("data/standards.json", "w", encoding="utf-8") as f:
    json.dump(standards, f, indent=2, ensure_ascii=False)

print("Saved standards.json")