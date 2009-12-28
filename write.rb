#!/usr/bin/env ruby19

require 'graphic_steganography'

string = gets
GraphicSteganography.hide string, "container.bmp"