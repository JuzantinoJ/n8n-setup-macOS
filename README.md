# AI Training Scheduler

AI-powered scheduling and coordination assistant using:

- Telegram Bot
- n8n
- OpenAI API
- Google Calendar

---

# Project Goal

This project aims to automate training and rehearsal scheduling using AI workflows.

The system will:

- Collect participant availability
- Analyse attendance percentages
- Recommend optimal dates
- Coordinate scheduling conflicts
- Create Google Calendar events
- Send automated confirmations and reminders

---

# Planned Stack

| Layer                | Technology                       |
| -------------------- | -------------------------------- |
| Messaging Platform   | Telegram                         |
| Workflow Automation  | n8n                              |
| AI Reasoning         | OpenAI GPT-4.1 Mini              |
| Calendar Integration | Google Calendar API              |
| Data Storage         | Airtable / Google Sheets         |
| Hosting              | Docker / Railway / Local Machine |

---

# Project Structure

```text
ai-training-scheduler/
│
├── scripts/
├── docs/
├── workflows/
├── prompts/
├── diagrams/
├── screenshots/
└── README.md

```

# Pre-flight Check

```text
Before starting the project, run:
./scripts/check-n8n-readiness.sh

This checks whether your machine has the required tools installed:

Git
Node.js
npm
Docker
VSCode CLI
n8n

Recommended Node.js Version
This project is tested with:
Node.js 20 LTS

```

# Getting Started

```text
Clone Repository
git clone https://github.com/YOUR_USERNAME/ai-training-scheduler.git
cd ai-training-scheduler

Run Readiness Check
./scripts/check-n8n-readiness.sh

Start n8n
npx n8n

Then open:
http://localhost:5678

```

# Roadmap

Phase 1

- Telegram Bot Integration
- OpenAI API Integration
- Attendance Collection
- Availability Analysis

Phase 2

- Google Calendar Integration
- Automated Scheduling
- Reminder System
- Conflict Resolution Logic

Phase 3

- Multi-agent workflows
- Voice command scheduling
- Analytics dashboard
- WhatsApp integration

Author

# Created by Juzantino Junadi

Focused on:

AI automation
cloud workflows
operational systems
agentic AI
intelligent scheduling systems
