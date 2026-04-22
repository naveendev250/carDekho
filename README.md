# 🚗 Car Recommendation MVP

## 🧠 What did I build and why? What did I deliberately cut?

I built an MVP that allows users to input their car preferences such as:
- Safety rating
- Mileage
- Car type (SUV, Sedan, etc.)

Based on these inputs, the system provides:
- A list of recommended cars
- An AI-generated explanation for why those cars fit the user's needs

### ❌ What I deliberately cut
I chose not to include a manual comparison feature.

The assumption behind this decision was:
> If a user doesn’t know much about cars, asking them to manually compare specs adds friction.

Instead, the system directly returns curated recommendations tailored to the user’s requirements.

---

## ⚙️ Tech Stack

### Frontend
- React + Vite
- Chakra UI

### Backend
- Python + FastAPI
- SQLite

### 🤔 Why this stack?
I chose this stack because I am already comfortable and experienced with it, which allowed me to:
- Move faster
- Focus on building the core logic instead of setup/learning overhead

---

## 🤖 AI Usage: What I delegated vs. did manually

### ✅ Delegated to AI
- Writing code
- Fixing bugs
- Iterating on implementation

### ✍️ Done manually
- Designing the core idea and architecture
- Writing and refining prompts for AI
- Making small, precise code changes where needed

### 🧩 Where AI helped the most
- Speeding up development
- Handling repetitive or boilerplate-heavy tasks

### ⚠️ Where AI got in the way
- Small, precise changes were often faster to implement manually
- Required careful prompting to avoid incorrect assumptions

---

## 🚀 Deployment

- Backend deployed on Render
- Frontend deployed on Vercel

---

## ⏱️ If I had 4 more hours...

I would add:

### 🔍 1. Full Car Comparison Feature
- Side-by-side comparison of specs (mileage, safety, features, etc.)
- Clear visualization of differences

### 💬 2. AI-powered Comparison Chat
- Allow users to ask questions like:
  - “Which one is better for city driving?”
  - “Which has better resale value?”
- AI would answer based on the compared vehicles

---

## 🧩 Future Direction

The goal would be to evolve this from:
> A recommendation tool → into an intelligent car decision assistant
