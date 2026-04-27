# <u>AutoStream AI Agent</u>

## Project Overview

This project is a Conversational AI Agent built for a fictional SaaS product **AutoStream**, which provides automated video editing tools for content creators.

The agent can:

* Understand user intent
* Answer questions using a knowledge base (RAG)
* Identify high-intent users
* Capture leads via a simulated API call

---

## Tech Stack

* Python 3
* LangChain
* OpenAI API
* JSON (for knowledge base)

---

## How to Run

1. Clone the repository:

```
git clone <your-repo-link>
cd AutoStream-Agent
```

2. Create virtual environment:

```
python -m venv venv
venv\Scripts\activate
```

3. Install dependencies:

```
pip install -r requirements.txt
```

4. Add your API key in `.env` file:

```
OPENAI_API_KEY=your_api_key_here
```

5. Run the application:

```
python app.py
```

---

## Architecture Explanation

This project uses a conversational AI agent built using Python and LangChain. The system follows a Retrieval-Augmented Generation (RAG) approach by storing product-related data in a local JSON file, which is dynamically accessed to answer user queries accurately.

Intent detection is implemented using keyword-based classification to categorize user input into greeting, informational queries, policy-related queries, and high-intent actions. Based on the detected intent, the agent responds appropriately using structured data.

State management is handled within the chat loop by maintaining user interaction flow and tracking lead collection steps. When a high-intent user is identified, the agent transitions into a multi-step data collection process, storing user inputs (name, email, platform) before triggering a mock lead capture function.

This design ensures that tool execution occurs only after complete data collection, mimicking real-world AI agent workflows.

---

## WhatsApp Integration (Concept)

To integrate this AI agent with WhatsApp, we can use the WhatsApp Business API along with webhooks.

When a user sends a message on WhatsApp, it is received by a backend server through a webhook. The server processes the message using the AI agent and generates a response. This response is then sent back to the user via the WhatsApp API.

Platforms like Twilio or Meta’s Cloud API can be used to manage WhatsApp communication. The backend can be deployed on cloud platforms such as AWS, Render, or Heroku to ensure scalability and availability.

---

## Demo

The demo should show:

* Pricing query handling
* High-intent detection
* Lead data collection
* Successful lead capture

**Demo Video**
Watch the demo here: 
