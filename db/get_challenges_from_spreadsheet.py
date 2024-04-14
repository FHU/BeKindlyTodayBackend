import pandas as pd

sheet_id = "1YQ5sRGze8MS6edGRFEHMjyDEnrYjvst5Hdy9HB5eQ_o"

df = pd.read_csv(f"https://docs.google.com/spreadsheets/d/{sheet_id}/export?format=csv")

def make_values(prompt, description, twist, date, source, rating, image):
    return f"\n  ('{prompt}', '{description}', '{twist}', '{date}', '{source}', '{rating}', '{image}'),"

values = ""

for row in df.itertuples():
    values += make_values(row[1], row[2], row[3], row[4], row[5], row[6], row[7])

sql_template = f'INSERT INTO "challenge" (prompt, suggestion, date, source, image) VALUES{values}'.rstrip(",") + ";"

with open("./db/challenges.sql", "w") as file:
    file.write(sql_template)