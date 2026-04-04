---
name: apple-notes
description: Read, search, add, or edit notes in Apple Notes via the memo CLI. Use this when the user references their notes, asks to "add to a note", "check a note", "search notes", etc.
allowed-tools: Bash
---

Use the `memo notes` CLI to interact with the user's Apple Notes.

## CLI reference

```
memo notes [OPTIONS]
  -f, --folder TEXT   Filter by folder name
  -fl, --flist        List all folders and subfolders
  -s, --search        Fuzzy search notes (interactive)
  -v N, --view N      Display content of note N from the list
  -a, --add           Add a new note (use with -f to specify folder)
  -e, --edit          Edit a note (use with -f to specify folder)
  -d, --delete        Delete a note
  -m, --move          Move a note to a different folder
  -nc, --no-cache     Bypass cache and fetch fresh data
  -ex, --export       Export notes to Desktop
```

## Markdown handling

`memo` automatically converts Apple Notes content to markdown when viewing — headings, bold, lists, etc. are rendered as markdown in the output. When adding or editing notes, write content in markdown and `memo` will convert it to the Apple Notes native format automatically.

## Common patterns

**List all notes:**
```
memo notes
```

**List notes in a specific folder:**
```
memo notes -f "Folder Name"
```

**View a specific note (by index from the list):**
```
memo notes -v 1
```

**List all folders:**
```
memo notes --flist
```

**Add a new note to a folder:**
```
memo notes -a -f "Folder Name"
```

**Edit a note:**
```
memo notes -e -f "Folder Name"
```

## Workflow notes

- The default folder is "Notes"
- When the user references a note by name, list notes first and find the closest match, then view it
- When adding content to an existing note, view it first, then edit with the combined (original + new) content written in markdown
- Use `-nc` if content seems stale or recently changed outside this session
