require 'pp'

module TextSteganography
  def self.hide what, where
    string = (0x1337.to_s(2) + "\n" + what.unpack('c' * what.size).map do |e|
      e.to_s(2) + "\n"
    end.join("")).gsub(/1/, "\t").gsub(/0/, " ")
    File.open(where, "r+") do |out|
      out.read
      out.print string
    end
  end

  def self.seek where
    sign = 0x1337.to_s(2)
    tmp = File.read(where).scan(/[\t\n\s]/).join("").gsub(/\t/, "1").gsub(
      /\n/, "#").gsub(/\s/, "0").scan(/#{sign}[1,0,#]+/).first.split('#')
    tmp.delete_at 0
    tmp.map do |e|
      e.to_i(2).chr
    end.join("")
  end
end
