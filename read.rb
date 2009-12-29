#!/usr/bin/env ruby19

require 'rubygems'
require 'graphic_steganography'

str = " " * 256
GraphicSteganography.seek "container.bmp", str
str.strip!
puts str