import pyodbc

conn = pyodbc.connect('DRIVER={SQL Server};'
                      'SERVER=localhost;' 
                      'DATABASE=class2;' 
                      'Trusted_Connection=yes;')  

cursor = conn.cursor()

cursor.execute("SELECT photo FROM photos WHERE id = 1") 
photo = cursor.fetchone()[0]

with open('retrieved_image.jpg', 'wb') as f:
    f.write(photo)

print("Image has been saved as 'retrieved_image.jpg'")

cursor.close()
conn.close()
