# LXC Playground

This provides a virtualbox and vagrant basebox containing all the tools for
starting up LXC instances inside a virtualbox vm running ubuntu 13.04.

## Requirements

Install the following requirements to use this repo:

* [Packer](http://packer.io)
* [Vagrant](http://vagrantup.com)
* [Virtualbox](http://virtualbox.org)

## Usage

With the above requirements installed, run the following to build the vm
containing lxc tools:

    packer build playground.json

After a couple minutes, packer should build an ovf and box file in the
output-virtualbox directory. From here you can add the box to vagrant and create
a new vagrant file or open virtualbox and import the ovf file.

## TODO

The tasks below are driven by [this blog post](http://taoofmac.com/space/HOWTO/Vagrant):

* ~~Packer provisions base ubuntu 13.04 instance without user interaction.~~
* Setup provisioner to install lxc requirements.
* Setup provisioner to install vagrant-lxc
