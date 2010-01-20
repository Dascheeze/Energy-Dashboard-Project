#!/usr/bin/env python

# This function transforms the input file into an array list dictionary, removing all commas from the file.
# returns an array list dictionary
# this is a comment added for a commit

def out_to_array(filename):
	# Open file, reads the first line
	# and instantiates the two array lists
	FILE = open(filename, "r")
	line = FILE.readline()
	variables = []
	dictionary_list = []

	# Splits up the words in the first line of
	# the file
	for word in line.rsplit(","):
		variables.append(word)

	# Loops until EOF
	while ( line != "" ):
		# Clears the dictionary variable
		dictionary = {}

		# Splits up the values in the read line
		words = line.rsplit(",")

		# Loops to assign the dictionary words and values
		for place in range(0,len(words)-1):
			dictionary[variables[place]] = words[place]

		# Read the newline so the break condition works
		line = FILE.readline()

		# Appends the new dictionary to the array list of dicts
		dictionary_list.append(dictionary)

	# Returns the ArrayList of dictionaries.
	return dictionary_list

out_to_array("test.csv")
