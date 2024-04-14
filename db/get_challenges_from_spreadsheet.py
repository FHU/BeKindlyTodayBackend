import pandas as pd


def make_values(prompt, description, twist, date, source, rating, image):
    return f"\n  ('{prompt}', '{description}', '{twist}', NOW() + interval '{date} day', '{source}', 0, '{image}'),"


print("Getting data from spreadsheet...")
sheet_id = "1YQ5sRGze8MS6edGRFEHMjyDEnrYjvst5Hdy9HB5eQ_o"
df = pd.read_csv(f"https://docs.google.com/spreadsheets/d/{sheet_id}/export?format=csv")

values = ""

print("Forming Sql...")
#I do not know pandas well, so this is what I did. Also I know this is bad but itll work for now
for row in df.itertuples():
    #Each index of the row coresponds to the column that it is in in the spreadsheet. I am using the index for the day from the date this script is run.
    values += make_values(str(row[1]).replace("'",""), str(row[2]).replace("'",""), str(row[3]).replace("'",""), row[0], str(row[5]).replace("'",""), str(row[6]).replace("'",""), str(row[7]).replace("'",""))

sql_template = f'INSERT INTO "challenge" (prompt, suggestion, twist, date, source, rating, image) VALUES{values}'.rstrip(",") + ";"

print("Writing SQL to file...")
with open("./db/challenges.sql", "w") as file:
    file.write(sql_template)

print("Complete...")