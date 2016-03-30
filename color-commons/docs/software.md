# Controlling lights with text messages #

## Receiving text messages with Twilio ##

### Setting up Twilio ###

Make an account with [Twilio](http://twilio.com). You get charged $0.01 for each text message, but the first 3000 are free. Our installation on the Greenway in downtown Boston averaged 1000 messages per month ($10.00/month) over 4 months. If you are installing this system for someone else, I would recommend making them set up the account from the start so that you don't have to worry about switching the account to their credit card at the end.

### Testing that Twilio works ###

You can check that Twilio is receiving messages by logging into the Twilio dashboard and looking in the SMS logs. You can check that Twilio is properly sending POSTs to your webserver by SSHing into your webserver and looking at the log files with something like `tail -f /var/log/nginx/access.log`.

## Dealing with a firewall ##

Normally, most internet connections, like the cable or DSL modem in your house, have a built-in firewall that protects your computer from crap on the internet. They work by blocking everything except responses to requests that you initiate. It's like if you order a pizza from Aaron Burr's Delicious Pizza, and then a few minutes later, a dude shows up outside your house wearing a shirt that says "Aaron Burr's Delicious Pizza", you think, "Ah, right, Aaron Burr's. This is the pizza I ordered. I'll open the door." On the other hand, if you are awoken in the night by a man in a cloak ringing the doorbell, and he's holding a handwritten sign saying "Real cheap pizza", I don't think it would be a good idea to open the door.

The interesting bit is that once you open the door and start talking to the (legitimate) pizza guy, the conversation can continue as long as you want. That's how this technique works. Your light controller starts a conversation with a remote server. (Strictly speaking, it is a TCP connection encrypted using the SSH protocol.) After the conversation is started, both the light controller and the remote server can continue the conversation. You configure the server to pass all traffic along to your controller, which allows it to function like it is outside the firewall.

### Making the connection more reliable ###

Because the light controller is connecting across the internet, you want it to make an attempt to recover if the connection drops out temporarily. I use Autossh. Autossh uses the SSH (Secure Shell) program to connect to a remote server, as mentioned earlier. Autossh also establishes a second connection in parallel for the purposes of monitoring the state of the connection. Every 10 minutes, Autossh checks that the connection is still up. If the connection drops, it attempts to restart the connection immediately. If that fails, it tries repeatedly, but at ever-increasing intervals.
