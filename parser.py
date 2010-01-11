#!/usr/bin/env python

# This function transforms the input file into an array list dictionary, removing all commas from the file.
# returns an array list dictionary

def out_to_array(filename):
	FILE = open(filename, "r")
	line = FILE.readline()
	variables = []
#	dictionary = {}
	dictionary_list = []

	for word in line.rsplit(","):
		variables.append(word)

	while ( line != "" ):
		dictionary = {}
		words = line.rsplit(",")
		print words
		for place in range(0,len(words)-1):
			dictionary[variables[place]] = words[place]
		line = FILE.readline()
		dictionary_list.append(dictionary)

	for list in dictionary_list:
		print list

out_to_array("test.csv")
