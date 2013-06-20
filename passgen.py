#!/usr/bin/python
import os
import sys
import random
import string
from signal import signal, SIGPIPE, SIG_DFL

signal(SIGPIPE, SIG_DFL)

alpha = string.letters + string.digits
min = 6
max = 10

if len(os.sys.argv) > 1:
	min = max = int(os.sys.argv[1])

while True:
	n = random.randint(min, max)
	p = ''.join(random.choice(alpha) for x in xrange(n))
	try:
		print p
	except KeyboardInterrupt:
		sys.exit(0)
	except:
		sys.exit(1)
