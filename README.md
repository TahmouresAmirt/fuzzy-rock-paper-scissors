# 🧠 Fuzzy Logic Rock-Paper-Scissors

This project is a smart twist on the classic Rock-Paper-Scissors game. Instead of playing randomly, the computer uses a **fuzzy logic system** to make decisions based on the player's behavior — reducing "by chance" moves and simulating intelligent play.

## 🎯 Motivation

Traditional implementations rely on randomness. This project explores how we can:
- Recognize and respond to human **patterns**,
- Simulate **strategic thinking** using fuzzy inference,
- Explore **non-player games** with intelligent agents.

## 🔧 How It Works

- Built in **MATLAB** using a **(Fuzzy Inference System)**
- Input features include:
  - `RockFreq`, `PaperFreq`, `ScissorsFreq`: Frequency of each player move
  - `Repetition`: Whether the player repeats the same move
  - `CounterRate`: Whether the player is countering computer moves
  - `CycleScore`: If the player follows a cycle (e.g., Rock → Paper → Scissors)

The fuzzy system uses these features to infer the **optimal next move** — Rock, Paper, or Scissors — based on a set of if-then rules.

## 🧠 Why Fuzzy Logic?

Fuzzy logic provides **soft decision-making** under uncertainty, ideal for situations where input isn't strictly binary or predictable — just like human behavior in games.

## 🚀 Try It Out

1. Open the `rock_paper_scissors.m` in MATLAB
2. Customize the input patterns
3. Tune or improve the fuzzy rules in `fuzzy_model.m`

## 📬 Let's Connect
The current rule set is an early version and **can definitely be improved**! I'm open to suggestions, experiments, and alternative strategies.
My Email: ce.tahmoursi@gmail.com
