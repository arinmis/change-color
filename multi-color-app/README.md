# To run flutter app on your android device
1. Connect your phone and computer with USB
	```flutter run```

**NOTE:** Make sure you have opened 'USB debugging' on your android device. All the avaliable devices can be check with this command: 
	```flutter devices```

## To connect flask server from android device
1. Connect *mobile hotspot* of your phone with your laptop
2. Connect with USB cable within debug mode to laptop
3. Run these command:
	```adb reverse tcp:5000 tcp:5000```
- *https://localhost:5000/* will start to serve in the android device
**NOTE:** Port number must be same with flask server.
