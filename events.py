import sched, time
import requests 

s = sched.scheduler(time.time, time.sleep)
def do_something(sc):
	print ("Doing stuff...")
	r = requests.get(url = 'http://itcodium.tech/copynews.php')
	print(r.text)
	s.enter(15, 1, do_something, (sc,))

s.enter(15, 1, do_something, (s,))
s.run()