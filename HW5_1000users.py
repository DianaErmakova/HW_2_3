import random
import psycopg2

femnames = ["Anna", "Diana", "Liya", "Alina", "Yaroslava"]
malenames = ["Egor", "Andrey", "Oleg", "Timur", "Ilnaz"]
femsurnames = ["Ivanova", "Petrova", "Sidorova", "Smirnova", "Kuznetsova"]
malesurnames = ["Ivanov", "Petrov", "Sidorov", "Smirnov", "Kuznetsov"]
fempatronymics = ["Olegovna", "Mikhailovna", "Aleksandrovna", "Sergeevna", "Andreevna"]
malepatronymics = ["Olegovich", "Mikhailovich", "Aleksandrovich", "Sergeevich", "Andreevich"]

def namefunc(variant):
    if variant == 1:
        res = random.choice(femnames)
        return res
    else:
        res = random.choice(malenames)
        return res

def lastfunc(variant):
    if variant == 1:
        res = random.choice(femsurnames)
        return res
    else:
        res = random.choice(malesurnames)
        return res

def patronymicfunc(variant):
    if variant == 1:
        res = random.choice(fempatronymics)
        return res
    else:
        res = random.choice(malepatronymics)
        return res

def birthdayf():
    day = random.randint(1, 31)
    month = random.randint(1, 12)
    year = random.randint(1900, 2023)

    if month == 2:
        if (year % 4 == 0 and year % 100 != 0) or (year % 400 == 0):
            day = random.randint(1, 29)
        else:
            day = random.randint(1, 28)
    elif month in [4, 6, 9, 11]:
        day = random.randint(1, 30)

    res = f"{year}-{month:02d}-{day:02d}"
    return res

professions = ["student", "artist", "programmist", "doctor", "scientist", "teacher", "barista", "waiter", "translator", "director"]
nationalities = ["Tatar", "English", "French", "Spanish", "Italian", "German", "Russian", "Chinese", "Japanese", "Indian"]

def phonenumbers():
    res = ""
    for i in range(12):
        x = random.randint(0, 10)
        res += str(x)
    return res

def generate_and_insert_data(num_records):
    connection = psycopg2.connect(
        database='HW5',
        user='postgres',
        password='060923',
        host='localhost',
        port='5432'
    )

    cursor = connection.cursor()

    cursor.execute('''
        CREATE TABLE IF NOT EXISTS Users (
            UserID SERIAL PRIMARY KEY,
            Surname VARCHAR(30) NOT NULL,
            UserName VARCHAR(30) NOT NULL,
            Patronymic VARCHAR(30),
            Birthday DATE,
            Profession VARCHAR(30),
            Nationality VARCHAR(100),
            PhoneNumber VARCHAR(20) NOT NULL,
            Email VARCHAR(50) UNIQUE NOT NULL
        );
    ''')
    connection.commit()

    email_counter = 0
    for _ in range(num_records):
        first_name = namefunc(random.randint(1, 2))
        last_name = lastfunc(random.randint(1, 2))
        patronymic = patronymicfunc(random.randint(1, 2))
        birthday = birthdayf()
        profession = random.choice(professions)
        nationality = random.choice(nationalities)
        phoneNumber = phonenumbers()
        email = f'{first_name.lower()}_{last_name.lower()}{email_counter}@example.com'
        email_counter += 1
        cursor.execute('''
            INSERT INTO Users (Surname, UserName, Patronymic, Birthday, Profession, Nationality, PhoneNumber, Email)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s);
        ''', (last_name, first_name, patronymic, birthday, profession, nationality, phoneNumber, email))

    connection.commit()

    cursor.close()
    connection.close()

generate_and_insert_data(1000)

