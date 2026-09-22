# Skills checklist – M3W226703 Group Project

Static page (single `index.html`) hosted on GitHub Pages. Each team member fills in the
skills checklist, clicks **Save as CSV** and uploads the file to Microsoft Teams.
Nothing is sent anywhere – the file is created in the browser.

- The file is named after the person: `Jan Kowalski` → `Jan_Kowalski.csv`
  (Polish letters become plain ones: `Łukasz Żółć` → `Lukasz_Zolc.csv`).
- One row per person, one column per skill – all CSVs from Teams can be combined in Excel
  (Data → Get Data → From Folder).
- Step-by-step upload instructions are shown at the top of the page and again after saving.

## Team summary – `summary.html`

Open `https://<organisation-name>.github.io/skills-checklist/summary.html`.

1. In Teams → **Files**, select all the CSV files → **Download** (you get a .zip – unzip it).
2. Drop all the CSV files onto the summary page (or click **Choose CSV files**).
3. You get, for every skill: who can do it, who needs help, who wants to learn, who didn't answer,
   plus **GAP** flags (nobody can do it) and everyone's free-text answers.
4. **Print / Save as PDF** for the final summary, or **Download combined CSV** for one Excel file.

Files are processed only in the browser – nothing is uploaded. If the same person's file is
loaded twice, the later one replaces the earlier one. The summary page is not linked from the
form, so team members won't stumble on it (share the link if you want them to see it).

## Settings (top of the `<script>` in `index.html`)

```js
const TEAMS_LOCATION = "the project team";  // where to upload, e.g. "M3W226703 Group Project → General"
const TEAMS_URL = "";                        // optional link to the Teams Files folder
```

To get the link: in Teams open the channel → **Files** → **Copy link** (or open the folder
in SharePoint and copy the address).

Skill lists: `SECTIONS` in the same script – each section has a `key`, `title`, `skills` and
number of `other` rows. Add or remove skills freely; don't rename a section `key` after people
have submitted (it is part of the CSV column names). If you add a new section, also add its title
to `SECTION_TITLES` in `summary.html`.

## Updating answers

On the form, **Load my CSV** fills the form from a previously saved file. The person changes what
they need (including any newly added skills), clicks **Save as CSV** and uploads it to Teams again,
choosing **Replace**. Older CSVs (before new sections were added) load fine – new lines are just blank.

## Deploy in the GitHub organisation

1. In the organisation: **New repository** → e.g. `skills-checklist`, **Public**
   (Pages on private repos in an organisation needs GitHub Team/Enterprise).
2. **Add file → Upload files** → `index.html` and `README.md` → **Commit changes**.
3. **Settings → Pages → Source: Deploy from a branch**, branch `main`, folder `/ (root)` → **Save**.
4. After ~1 minute: `https://<organisation-name>.github.io/skills-checklist/`.
