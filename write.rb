#!/usr/bin/env ruby19

require 'rubygems'
require 'graphic_steganography'

string = gets
GraphicSteganography.hide "container.bmp", string