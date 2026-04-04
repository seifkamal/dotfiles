---
name: apple-reminders
description: Read, add, complete, edit, or delete reminders in Apple Reminders via the memo CLI. Use this when the user asks about their todo list, what's on their plate, what's due, or wants to add/complete/delete a task.
allowed-tools: Bash
---

Use the `memo rem` CLI to interact with the user's Apple Reminders.

## CLI reference

```
memo rem [OPTIONS]
  (no flags)     List all reminders
  -a, --add      Add a new reminder (interactive)
  -c, --complete Mark a reminder as completed (interactive)
  -d, --delete   Delete a reminder (interactive)
  -e, --edit     Edit a reminder (interactive)
```

## Common patterns

**List all reminders / "what's on the todo today":**
```
memo rem
```

**Add a reminder / "add this to my todo":**
```
memo rem -a
```
Prompts for title, notes, and due date.

**Mark complete / "mark X as done":**
```
memo rem -c
```

**Delete a reminder:**
```
memo rem -d
```

**Edit a reminder:**
```
memo rem -e
```

## Notes

- "todo", "todos", "tasks", "reminders", "what's on my plate" all refer to Apple Reminders
- When the user says "what's due today" or "what's on the todo today", list reminders and highlight any due today or overdue
- Due dates are shown in the list output — today's date is available in context
- All mutating operations are interactive; run the command and follow the prompts
