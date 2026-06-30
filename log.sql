-- Keep a log of any SQL queries you execute as you solve the mystery.
-- Theft occured: July 28th on Humphrey St.

SELECT description FROM crime_scene_reports WHERE month = 7 AND day = 28 AND street = 'Humphrey Street';
-- I want to access the description of the crime scene where and when the crime took place.
-- Notes:
    -- Theft occured at 10:15 AM.
    -- Three present witnesses' interview transcripts mention the bakery.
    -- Littering took place at 16:36 but there were no known witnesses

SELECT activity FROM bakery_security_logs WHERE month = 7 AND day = 28 AND HOUR = 16 AND minute = 36;
-- I figured I might as well investigate the bakery next but this query turned out to be fruitless
SELECT license_plate FROM bakery_security_logs WHERE month = 7 AND day = 28 AND hour = 16 AND minute = 36;

SELECT name from people;
-- All I learned from this query is that there is an absurd amount of suspects.
-- I need to go through the interviews but I want to narrow the search down first because all the transcripts together are TOO MUCH to fit in my terminal.

SELECT activity FROM bakery_security_logs WHERE month = 7 AND day = 28 AND hour = 10 AND minute = 15;
-- Got nothing from this query either.
SELECT license_plate FROM bakery_security_logs WHERE month = 7 AND day = 28 AND hour = 10 AND minute = 15;

SELECT transcript FROM interviews WHERE month = 7 AND day = 28;
-- Within 10 minutes of the theft, the thief got into a car in the bakery parking lot and drove away.
-- Thief was at ATM on Leggett St. earlier in the morning withdrawing money.
-- While leaving the bakery, the thief, planning to take the earliest flight out of Fiftyville tomorrow, asked the person on the other end of their phone call to purchase a ticket.

SELECT activity FROM bakery_security_logs WHERE month = 7 AND day = 28 AND hour = 10;
-- 9 cars left during the 10th hour
SELECT activity FROM bakery_security_logs WHERE month = 7 AND day = 28 AND hour = 10 AND minute = 16;
-- 1 car exited
SELECT activity FROM bakery_security_logs WHERE month = 7 AND day = 28 AND hour = 10 AND minute = 18;
-- 2 cars exited
SELECT activity FROM bakery_security_logs WHERE month = 7 AND day = 28 AND hour = 10 AND minute = 19;
-- 1 car exited
SELECT activity FROM bakery_security_logs WHERE month = 7 AND day = 28 AND hour = 10 AND minute = 20;
-- 1 car exited
SELECT activity FROM bakery_security_logs WHERE month = 7 AND day = 28 AND hour = 10 AND minute = 21;
-- 1 car exited
SELECT activity FROM bakery_security_logs WHERE month = 7 AND day = 28 AND hour = 10 AND minute = 23;
-- 2 cars exited
-- NARROWED DOWN TO 8 POTENTIAL CARS THE THIEF COULD BE IN

SELECT license_plate FROM bakery_security_logs WHERE month = 7 AND day = 28 AND hour = 10 AND minute = 16;
-- 5P2BI95
SELECT license_plate FROM bakery_security_logs WHERE month = 7 AND day = 28 AND hour = 10 AND minute = 18;
-- 94KL13X
-- 6P58WS2
SELECT license_plate FROM bakery_security_logs WHERE month = 7 AND day = 28 AND hour = 10 AND minute = 19;
-- 4328GD8
SELECT license_plate FROM bakery_security_logs WHERE month = 7 AND day = 28 AND hour = 10 AND minute = 20;
-- G412CB7
SELECT license_plate FROM bakery_security_logs WHERE month = 7 AND day = 28 AND hour = 10 AND minute = 21;
-- L93JTIZ
SELECT license_plate FROM bakery_security_logs WHERE month = 7 AND day = 28 AND hour = 10 AND minute = 23;
-- 322W7JE
-- 0NTHK55

SELECT transaction_type FROM atm_transactions WHERE month = 7 AND day = 28 AND atm_location = 'Leggett Street';
-- 5 withdrawals, 1 deposit, 3 withdrawals
-- 9 total actions
SELECT account_number FROM atm_transactions WHERE month = 7 AND day = 28 AND atm_location = 'Leggett Street';
-- 28500762
-- 28296815
-- 76054385
-- 49610011
-- 16153065
-- 86363979 -- NOT THIS ONE
-- 25506511
-- 81061156
-- 26013199
-- 9 total actions (6th is withdrawal)
SELECT amount FROM atm_transactions WHERE month = 7 AND day = 28 AND atm_location = 'Leggett Street';
-- 48
-- 20
-- 60
-- 50
-- 80
-- 10 -- NOT THIS ONE
-- 20
-- 30
-- 35
-- 9 total actions (6th is withdrawal)

SELECT name FROM people WHERE license_plate = '5P2BI95';
SELECT name FROM people WHERE license_plate = '94KL13X';
SELECT name FROM people WHERE license_plate = '6P58WS2';
SELECT name FROM people WHERE license_plate = '4328GD8';
SELECT name FROM people WHERE license_plate = 'G412CB7';
SELECT name FROM people WHERE license_plate = 'L93JTIZ';
SELECT name FROM people WHERE license_plate = '322W7JE';
SELECT name FROM people WHERE license_plate = '0NTHK55';
-- | Vanessa     | 5P2BI95       |
-- | Bruce       | 94KL13X       |
-- | Barry       | 6P58WS2       |
-- | Luca        | 4328GD8       |
-- | Sofia       | G412CB7       |
-- | Iman        | L93JTIZ       |
-- | Diana       | 322W7JE       |
-- | Kelsey      | 0NTHK55       |

SELECT name, phone_number FROM people WHERE license_plate = '5P2BI95';
SELECT name, phone_number FROM people WHERE license_plate = '94KL13X';
SELECT name, phone_number FROM people WHERE license_plate = '6P58WS2';
SELECT name, phone_number FROM people WHERE license_plate = '4328GD8';
SELECT name, phone_number FROM people WHERE license_plate = 'G412CB7';
SELECT name, phone_number FROM people WHERE license_plate = 'L93JTIZ';
SELECT name, phone_number FROM people WHERE license_plate = '322W7JE';
SELECT name, phone_number FROM people WHERE license_plate = '0NTHK55';
-- | Vanessa | (725) 555-4692 |
-- | Bruce | (367) 555-5533 |
-- | Barry | (301) 555-4174 |
-- | Luca | (389) 555-5198 |
-- | Sofia | (130) 555-0289 |
-- | Iman | (829) 555-5269 |
-- | Diana | (770) 555-1861 |
-- | Kelsey | (499) 555-9472 |
-- THESE ARE THE SUSPECTED THIEVES

SELECT receiver FROM phone_calls WHERE month = 7 AND day = 28 AND caller = '(725) 555-4692';
-- Vanessa called: (821) 555-5262
SELECT receiver FROM phone_calls WHERE month = 7 AND day = 28 AND caller = '(367) 555-5533';
-- Bruce called: (375) 555-8161
-- Bruce called: (344) 555-9601
-- Bruce called: (022) 555-4052
-- Bruce called: (704) 555-5790
SELECT receiver FROM phone_calls WHERE month = 7 AND day = 28 AND caller = '(301) 555-4174';
-- Barry called: (711) 555-3007
SELECT receiver FROM phone_calls WHERE month = 7 AND day = 28 AND caller = '(389) 555-5198';
-- Luca called NOBODY
SELECT receiver FROM phone_calls WHERE month = 7 AND day = 28 AND caller = '(130) 555-0289';
-- Sofia called: (996) 555-8899
SELECT receiver FROM phone_calls WHERE month = 7 AND day = 28 AND caller = '(829) 555-5269';
-- Iman called: NOBODY
SELECT receiver FROM phone_calls WHERE month = 7 AND day = 28 AND caller = '(770) 555-1861';
-- Diana called: (725) 555-3243
SELECT receiver FROM phone_calls WHERE month = 7 AND day = 28 AND caller = '(499) 555-9472';
-- Kelsey called: (892) 555-8872
-- Kelsey called: (717) 555-1342

SELECT name FROM people WHERE phone_number = '(821) 555-5262';
-- Vanessa called Amanda
SELECT name FROM people WHERE phone_number = '(375) 555-8161';
-- Bruce called Robin
SELECT name FROM people WHERE phone_number = '(344) 555-9601';
-- Bruce called Deborah
SELECT name FROM people WHERE phone_number = '(022) 555-4052';
-- Bruce called Gregory
SELECT name FROM people WHERE phone_number = '(704) 555-5790';
-- Bruce called Carl
SELECT name FROM people WHERE phone_number = '(711) 555-3007';
-- Barry called Joan
SELECT name FROM people WHERE phone_number = '(996) 555-8899';
-- Sofia called Jack
SELECT name FROM people WHERE phone_number = '(725) 555-3243';
-- Diana called Philip
SELECT name FROM people WHERE phone_number = '(892) 555-8872';
-- Kelsey called Larry
SELECT name FROM people WHERE phone_number = '(717) 555-1342';
-- Kelsey called
-- POTENTIAL ACCOMPLICES FOUND (LUCA AND IMAN ELIMINATED FROM SUSPECT LIST SINCE THEY MADE NO CALLS)

SELECT account_number, amount FROM atm_transactions WHERE month = 7 AND day = 28 AND atm_location = 'Leggett Street' AND transaction_type = 'withdraw';
-- +----------------+--------+
-- | account_number | amount |
-- +----------------+--------+
-- | 28500762       | 48     |
-- | 28296815       | 20     |
-- | 76054385       | 60     |
-- | 49610011       | 50     |
-- | 16153065       | 80     |
-- | 25506511       | 20     |
-- | 81061156       | 30     |
-- | 26013199       | 35     |
-- +----------------+--------+
SELECT person_id FROM bank_accounts WHERE account_number = '28500762';
-- 467400
SELECT person_id FROM bank_accounts WHERE account_number = '28296815';
-- 395717
SELECT person_id FROM bank_accounts WHERE account_number = '76054385';
-- 449774
SELECT person_id FROM bank_accounts WHERE account_number = '49610011';
-- 686048
SELECT person_id FROM bank_accounts WHERE account_number = '16153065';
-- 458378
SELECT person_id FROM bank_accounts WHERE account_number = '25506511';
-- 396669
SELECT person_id FROM bank_accounts WHERE account_number = '81061156';
-- 438727
SELECT person_id FROM bank_accounts WHERE account_number = '26013199';
-- 514354

SELECT name FROM people WHERE id = '467400';
-- Luca
SELECT name FROM people WHERE id = '395717';
-- Kenny (not a suspect)
SELECT name FROM people WHERE id = '449774';
-- Taylor
SELECT name FROM people WHERE id = '686048';
-- Bruce
SELECT name FROM people WHERE id = '458378';
-- Brooke
SELECT name FROM people WHERE id = '396669';
-- Iman
SELECT name FROM people WHERE id = '438727';
-- Benista
SELECT name FROM people WHERE id = '514354';
-- Diana
-- MAIN SUSPECTS ARE NOW BRUCE AND DIANA
-- MAIN ACCOMPLICE SUSPECTS ARE ROBIN, DEBORAH, GREGORY, AND CARL FOR BRUCE AND PHILIP FOR DIANA

SELECT name, passport_number FROM people WHERE name = 'Bruce';
-- Bruce | 5773159633
SELECT name, passport_number FROM people WHERE name = 'Diana';
-- Diana | 3592750733
-- I'm going to check if either of these are flying tomorrow
SELECT flight_id FROM passengers WHERE passport_number = '5773159633';
-- Bruce is scheduled for flight_id 36
SELECT flight_id FROM passengers WHERE passport_number = '3592750733';
-- Diana is scheduled for flight_id 18, 24, and 54
SELECT origin_airport_id, destination_airport_id, year, month, day, hour, minute FROM flights WHERE id = '36';
-- BRUCE FLIGHT 36: 8 (origin airport id) | 4 (destination airport id) | 2023 (year) | 7 (month) | 29 (day) | 8 (hour) | 20 (min)
SELECT origin_airport_id, destination_airport_id, year, month, day, hour, minute FROM flights WHERE id = '18';
SELECT origin_airport_id, destination_airport_id, year, month, day, hour, minute FROM flights WHERE id = '24';
SELECT origin_airport_id, destination_airport_id, year, month, day, hour, minute FROM flights WHERE id = '54';
-- DIANA FLIGHT 18: 8 (origin airport id) | 6 (destination airport id) | 2023 (year) | 7 (month) | 29 (day) | 16 (hour) | 0 (min)
-- DIANA FLIGHT 24: 7 (origin airport id) | 8 (destination airport id) | 2023 (year) | 7 (month) | 30 (day) | 16 (hour) | 27 (min)
-- DIANA FLIGHT 54: 8 (origin airport id) | 5 (destination airport id) | 2023 (year) | 7 (month) | 30 (day) | 10 (hour) | 19 (min)
-- Diana's flight is too late, meaning Bruce is the THIEF, meaning the accomplice is either Robin, Deborah, Gregory, or Carl

SELECT city FROM airports WHERE id = '4';
-- Bruce escaped to NYC

SELECT name, transcript FROM interviews WHERE name = 'Robin' ;
-- No interview transcript which is SUS
SELECT name, transcript FROM interviews WHERE name = 'Deborah';
-- “Our quest is practically finished. I shall call with the King to-morrow, and with you, if you care to come with us.
-- We will be shown into the sitting-room to wait for the lady, but it is probable that when she comes she may
-- find neither us nor the photograph. It might be a satisfaction to his Majesty to regain it with his own hands.”
SELECT name, transcript FROM interviews WHERE name = 'Gregory';
-- The solemn Mr. Merryweather perched himself upon a crate, with a very injured expression upon his face,
-- while Holmes fell upon his knees upon the floor and, with the lantern and a magnifying lens,
-- began to examine minutely the cracks between the stones. A few seconds sufficed to satisfy him,
-- for he sprang to his feet again and put his glass in his pocket.
SELECT name, transcript FROM interviews WHERE name = 'Carl';
-- What a time it seemed! From comparing notes afterwards it was but an hour and a quarter,
-- yet it appeared to me that the night must have almost gone, and the dawn be breaking above us.
-- My limbs were weary and stiff, for I feared to change my position; yet my nerves were worked up to the highest pitch of tension,
-- and my hearing was so acute that I could not only hear the gentle breathing of my companions,
-- but I could distinguish the deeper, heavier in-breath of the bulky Jones from the thin, sighing note of the bank director.
-- From my position I could look over the case in the direction of the floor. Suddenly my eyes caught the glint of a light.
-- I FIGURED OUT NOTHING FROM THESE INTERVIEW TRANSCRIPTS

SELECT duration FROM phone_calls WHERE caller = '(367) 555-5533' AND receiver = '(375) 555-8161';
-- duration of call with Robin = 45
SELECT duration FROM phone_calls WHERE caller = '(367) 555-5533' AND receiver = '(344) 555-9601';
-- duration of call with Deborah = 120
SELECT duration FROM phone_calls WHERE caller = '(367) 555-5533' AND receiver = '(022) 555-4052';
-- duration of call with Gregory = 241
SELECT duration FROM phone_calls WHERE caller = '(367) 555-5533' AND receiver = '(704) 555-5790';
-- duration of call with Carl = 75
-- I am so tempted to start guessing I have no idea where to go from here now because neither phone nor anything plane related is giving anything
-- The only thing I know about the accomplice is that they bought Bruce's plane ticket over the phone ~10:15
-- I'm going to guess Robin because Robin has no interview transcript which is suspicious in of itself
-- Wow I was right
