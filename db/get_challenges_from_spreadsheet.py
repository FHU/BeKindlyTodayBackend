import pandas as pd

print("Getting data from spreadsheet...")
sheet_id = "1YQ5sRGze8MS6edGRFEHMjyDEnrYjvst5Hdy9HB5eQ_o"
df = pd.read_csv(f"https://docs.google.com/spreadsheets/d/{sheet_id}/export?format=csv")

sql_template = f'INSERT INTO "challenges" (prompt, spanish_prompt, suggestion, twist, spanish_twist, date, source, rating, image) VALUES'

print("Forming Sql...")
#I do not know pandas well, so this is what I did. Also I know this is bad but itll work for now
for row in df.itertuples():
    #Each index of the row coresponds to the column that it is in in the spreadsheet
    
    #The replaces here is to remove ' which breaks the way the sql is written. In future iterations, the sql should be changed to not need this
    #but for now its fine.
    prompt = str(row[1]).replace("'","")
    spanish_prompt = str(row[2]).replace("'","")
    description = str(row[3]).replace("'","")
    twist = str(row[4]).replace("'","")
    spanish_twist = str(row[5]).replace("'","")
    date = f"DATE_TRUNC('day', NOW() + interval '{row[0]} days')" #The index is the ammount of days past now that the date is being made
    source = str(row[6]).replace("'","")
    rating = 0
    image = str(row[8]).replace("'","")

    sql_template += f"\n  ('{prompt}', '{spanish_prompt}', '{description}', '{twist}', '{spanish_twist}', {date}, '{source}', '{rating}', '{image}'),"

sql_template = sql_template.rstrip(",") + '''

ON Conflict(prompt)
DO UPDATE SET
    spanish_prompt = EXCLUDED.spanish_prompt,
    suggestion = EXCLUDED.suggestion,
    twist = EXCLUDED.twist,
    spanish_twist = EXCLUDED.spanish_twist,
    date = EXCLUDED.date,
    image = EXCLUDED.image;
''' 
#I chose to add the new dates since were not really launched till a further date. Once we really launch we should change that.

print("Writing SQL to file...")
with open("./db/challenges_upsert.sql", "w") as file:
    file.write(sql_template)

print("Complete...")