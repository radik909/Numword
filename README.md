# Numword

This project will convert the given 10 digit phone number into the list of words.
https://github.com/vid2010/PhoneDictonary

## Description

Given a 10 digit phone number, you must return all possible words or combination of words from the provided dictionary, that can be mapped back as a whole to the number.
- With this we can generate numbers like 1-800-motortruck which is easier to remember then 1-800-6686787825.
- The phone numbers will never contain a 0 or 1.
- Words have to be at least 3 characters.
- The conversion of a 10 digit phone number should be performed within 1000ms.
- The phone number mapping to letters is as follows:

```
2 = a b c
3 = d e f
4 = g h i
5 = j k l
6 = m n o
7 = p q r s
8 = t u v
9 = w x y z
```

## Test cases

To get give you an initial verification, the following must be true:

- 6686787825 should return the following list [["MOTOR", "TRUCK"]], [["MOTOR", "USUAL"]], [["NOUN", "STRUCK"], ["NOUNS", "TRUCK"]], [["NOUNS", "USUAL"]], [["ONTO", "STRUCK"]]

- 2282668687 should return the following list [["ACT", "AMOUNTS"], ["ACTA", "MOUNTS"]], [["ACT", "CONTOUR"]], [["BAT", "AMOUNTS"]], [["BAT", "CONTOUR"]], [["CAT", "AMOUNTS"]], [["CAT", "CONTOUR"]]
