import pandas as pd

print("Getting data from spreadsheet...")
sheet_id = "1YQ5sRGze8MS6edGRFEHMjyDEnrYjvst5Hdy9HB5eQ_o"
df = pd.read_csv(f"https://docs.google.com/spreadsheets/d/{sheet_id}/export?format=csv")

sql_template = f'INSERT INTO "challenge" (prompt, suggestion, twist, date, source, rating, image) VALUES'

print("Forming Sql...")
#I do not know pandas well, so this is what I did. Also I know this is bad but itll work for now
for row in df.itertuples():
    #Each index of the row coresponds to the column that it is in in the spreadsheet
    
    prompt = str(row[1]).replace("'","")
    description = str(row[2]).replace("'","")
    twist = str(row[3]).replace("'","")
    date = f"NOW() + interval '{row[0]} days'" #The index is the ammount of days past now that the date is being made
    source = str(row[5]).replace("'","")
    rating = 0
    image = str(row[7]).replace("'","")

    sql_template += f"\n  ('{prompt}', '{description}', '{twist}', {date}, '{source}', {rating}, '{image}'),"

sql_template = sql_template.rstrip(",") + ";"

print("Writing SQL to file...")
with open("./db/challenges.sql", "w") as file:
    file.write(sql_template)

print("Complete...")