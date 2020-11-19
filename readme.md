# Hackery

## How does this work?

Install docker-compose first. Once it has installed you should be able to run this at the root of the project. It can take a while.

```
$ docker-compose up -d --build
```

At the moment the machine will run for a day or something, check the sleep function in main.go.

To stop it:

```
$ docker kill sushi
```

## Sound?

When the docker image has finished building, the last thing it does is map the 'config/asound.conf' file to '/etc/asound.conf'. So we can change it without having to ssh into the box. Sadly, we still need to ssh into the box to find out what sound card we want...

If it all worked, you should be able to run something like this:

```
$ docker exec -ti sushi aplay -l
```

My output looks like this:

```
user@computer:~$ docker exec -ti sushi aplay -l
**** List of PLAYBACK Hardware Devices ****
card 0: PCH [HDA Intel PCH], device 0: ALC1220 Analog [ALC1220 Analog]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: USB [Scarlett 2i2 USB], device 0: USB Audio [USB Audio]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 2: NVidia [HDA NVidia], device 3: HDMI 0 [HDMI 0]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
```

I set asound.conf (copy asound.conf.example to asound.conf) to card '1' so that my soundcard is targeted. This may be a different number for you.

```
defaults.pcm.card 1
```

You can run this command to play sound from inside docker:

```
$ docker exec -ti sushi bash -c "cd /code && make onetwo"
```
