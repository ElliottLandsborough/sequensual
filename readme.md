# Sequensual

Sushi (elk-audio) + Docker

## How does this work?

Install docker-compose first, make sure docker is installed too. Once it has installed you should be able to run this at the root of the project. It can take a while.

```
$ make dockerbuild
```

At the moment the machine will run for a day or something, check the sleep function in main.go.

To stop it:

```
$ make kill
```

## Let me in!

To ssh into the running docker image run this command:

```
$ make ssh
```

Any changes made will disappear if you kill the image or restart the computer. See 'Dockerfile' for steps that are taken to get it to the point that it is now.

## Sound?

When the docker image has finished building the last thing it does is map the 'config/asound.conf' file to '/etc/asound.conf'. We can change it without having to ssh into the box. Sadly, we still need to ssh into the box to find out what sound card we want...

```
$ make devices
```

My output looks like this:

```
user@computer:~$ make devices
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
$ make soundcheck
```

If you made a change, you may need to restart the docker container:

```
$ make restart
```

# AppImage

* Copy `example/mda-vst3.vst3` to home dir (or root if you are logged in as root)
* run `make runappimage`

To do: Test with the v0.11 AppImage. Currently not working as expected in Ubuntu Studio 20.04