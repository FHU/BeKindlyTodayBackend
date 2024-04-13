import pandas as pd

sheet_id = "1YQ5sRGze8MS6edGRFEHMjyDEnrYjvst5Hdy9HB5eQ_o"

df = pd.read_csv(f"https://docs.google.com/spreadsheets/d/{sheet_id}/export=?format=csv")

print(df)