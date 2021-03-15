file = open('f2.txt', 'r')
lines = file.readlines()
for line in lines:
	word = line.split(',')
	f11 = int(word[0])			# contains the edx value for starting time
	f12 = int(word[1])			# contains the eax value for starting time
	f21 = int(word[3])			# contains the edx value for ending time
	f22 = int(word[4])			# contains the eax value for ending time

	if f12<0:
		f12 = 2**32 + f12		# converting signed to unsigned value

	if f22<0:
		f22 = 2**32 + f22		# converting signed to unsigned value

	start = f11*(2**32)+f12			# find the 64 bit starting time stamp
	end = f21*(2**32)+f22			# find the 64 bit ending time stamp
	
	print(end-start)
	
