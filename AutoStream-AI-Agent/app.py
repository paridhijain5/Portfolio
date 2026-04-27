import json
from dotenv import load_dotenv
import os

# Load API key (for future use)
load_dotenv()

# Load knowledge base (RAG)
with open("knowledge_base.json") as f:
    kb = json.load(f)

# -----------------------------
# INTENT DETECTION
# -----------------------------
def detect_intent(user_input):
    user_input = user_input.lower()

    if any(word in user_input for word in ["hi", "hello", "hey"]):
        return "greeting"
    
    elif any(word in user_input for word in ["price", "pricing", "cost", "plan"]):
        return "pricing"
    
    elif any(word in user_input for word in ["refund", "policy", "support"]):
        return "policy"
    
    elif any(word in user_input for word in ["buy", "purchase", "subscribe", "try", "interested"]):
        return "high_intent"
    
    else:
        return "unknown"

# -----------------------------
# RAG RESPONSE FUNCTIONS
# -----------------------------
def get_pricing():
    pricing = kb["pricing"]
    
    response = f"""
We offer two plans:

Basic Plan:
- Price: {pricing['basic']['price']}
- Videos: {pricing['basic']['videos_per_month']}
- Resolution: {pricing['basic']['resolution']}

Pro Plan:
- Price: {pricing['pro']['price']}
- Videos: {pricing['pro']['videos_per_month']}
- Resolution: {pricing['pro']['resolution']}
- Features: {', '.join(pricing['pro']['features'])}
"""
    return response

def get_policy():
    policies = kb["policies"]

    response = f"""
Here are our policies:

- Refund: {policies['refund_policy']}
- Support: {policies['support']}
"""
    return response

# -----------------------------
# MAIN CHAT LOOP
# -----------------------------
def chat():
    print("🤖 AutoStream Agent: Hi! How can I help you today?")

    user_data = {
        "name": None,
        "email": None,
        "platform": None
    }

    collecting_lead = False
    current_step = None

    while True:
        user_input = input("You: ")

        # Exit
        if user_input.lower() in ["exit", "quit"]:
            print("🤖 Goodbye!")
            break

        # -----------------------------
        # LEAD COLLECTION FLOW
        # -----------------------------
        if collecting_lead:

            if current_step == "name":
                user_data["name"] = user_input
                current_step = "email"
                print("🤖 Great! Please enter your email:")

            elif current_step == "email":
                user_data["email"] = user_input
                current_step = "platform"
                print("🤖 Which platform do you create content on? (YouTube/Instagram/etc.)")

            elif current_step == "platform":
                user_data["platform"] = user_input

                # ✅ Call tool ONLY after all data collected
                mock_lead_capture(
                    user_data["name"],
                    user_data["email"],
                    user_data["platform"]
                )

                collecting_lead = False
                current_step = None

            continue  # skip normal flow

        # -----------------------------
        # NORMAL INTENT FLOW
        # -----------------------------
        intent = detect_intent(user_input)

        if intent == "greeting":
            print("🤖 Hello! Ask me anything about AutoStream 😊")

        elif intent == "pricing":
            print("🤖", get_pricing())

        elif intent == "policy":
            print("🤖", get_policy())

        elif intent == "high_intent":
            print("🤖 Awesome! Let’s get you started 🚀")
            print("🤖 What’s your name?")

            collecting_lead = True
            current_step = "name"

        else:
            print("🤖 Sorry, I didn’t understand that. Can you rephrase?")

def mock_lead_capture(name, email, platform):
    print(f"\n✅ Lead captured successfully!")
    print(f"Name: {name}")
    print(f"Email: {email}")
    print(f"Platform: {platform}\n")

# Run chatbot
if __name__ == "__main__":
    chat()