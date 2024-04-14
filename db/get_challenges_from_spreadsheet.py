import pandas as pd

sheet_id = "1YQ5sRGze8MS6edGRFEHMjyDEnrYjvst5Hdy9HB5eQ_o"

df = pd.read_csv(f"https://docs.google.com/spreadsheets/d/{sheet_id}/export=?format=csv")

def make_values(prompt, description, twist, date, source, image):
    return f"\n('{prompt}', '{description}', '{date}', '{source}', '{image}'),"

test =""

sql_template = f'INSERT INTO "challenge" (prompt, suggestion, date, source, image) VALUES{test}'.rstrip(",") + ";"

with open("./challenges.sql", "w") as file:
