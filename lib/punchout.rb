#!/usr/bin/env ruby

require 'open3'
require 'json'
require_relative 'player'
require_relative 'move_code'
require_relative 'move'
require_relative 'outcome'
require_relative 'turn'

$p1 = nil
$p2 = nil

# def do_rounds(round, p_in1, p_out1, p_in2, p_out2)
#   1.upto(round) do |i|
#     puts "< turn"
#     p_in1.puts "turn"
#     p_in2.puts "turn"
#
#     i1 = p_out1.gets.chomp
#     puts "p1 > #{i1}"
#
#     i2 = p_out2.gets.chomp
#     puts "p2 > #{i2}"
#
#     p_in1.puts i2
#     p_in2.puts i1
#
#
#     if (i1 == "C" && i2 == "C")
#       $p1_pts += 2
#       $p2_pts += 2
#       $all_sab1 = false
#       $all_sab2 = false
#     elsif (i1 == "S" && i2 == "S")
#       $p1_pts += 1
#       $p2_pts += 1
#     elsif (i1 == "C")
#       $p2_pts += 3
#       $p1_pts += 0
#       $all_sab1 = false
#     else
#       $p2_pts += 0
#       $p1_pts += 3
#       $all_sab2 = false
#     end
#   end
# end

puts "Punchout Driver Program"

if (ARGV.length != 4)
  puts "usage: punchout.rb command1 name1 command2 name2"
  exit
end

$p1 = Player.new "#{ARGV[1]}"
$p2 = Player.new "#{ARGV[2]}"

json_test = "#{$p1.to_json}"
puts "#{json_test}"
$p1 = $p1.from_json! json_test
json_test = "#{$p1.to_json}"
puts "#{json_test}"

$p1_move = Move.new MoveCode::DODGE_LEFT
$p2_move = Move.new MoveCode::DODGE_RIGHT
$p1_outcome = Outcome.new -1, -1, 0, false, 0, false, 'NONE'
$p2_outcome = Outcome.new -2, -2, 0, false, 0, false, 'NONE'
json_test =  "#{$p1_outcome.to_json}"
puts "#{json_test}"
$turn = Turn.new $p1_move, $p2_move, $p1_outcome, $p2_outcome
json_test =  "#{$turn.to_json}"
puts "#{json_test}"
$turn = Turn.new
$turn.from_json! json_test
json_test =  "#{$turn.to_json}"
puts "#{json_test}"

#
# puts "Starting program #{ARGV[0]} #{ARGV[3]}"
# Open3.popen3("#{ARGV[0]} #{ARGV[3]}") do |p_in1, p_out1, p_err1|
#   puts "Starting program #{ARGV[2]} #{ARGV[1]}"
#   Open3.popen3("#{ARGV[2]} #{ARGV[1]}") do |p_in2, p_out2, p_err2|
#     round = rand(25..75)
#     puts "Running #{round} rounds"
#     do_rounds(round, p_in1, p_out1, p_in2, p_out2)
#
#     puts "#{ARGV[1]} Program scored #{$p1_pts}"
#     puts "#{ARGV[3]} Program scored #{$p2_pts}"
#
#     while (($p1_pts == $p2_pts) and ($tie_breaker_rounds < 3))
#       round = rand(10..20)
#       puts "Tie game - Tie breaker - #{round} rounds"
#       $all_sab = true
#       do_rounds(round, p_in1, p_out1, p_in2, p_out2)
#
#       puts "#{ARGV[1]} Program scored #{$p1_pts}"
#       puts "#{ARGV[3]} Program scored #{$p2_pts}"
#
#       if ($all_sab1)
#         puts "#{ARGV[1]} program sabotaged ALL tie rounds."
#         $p1_pts = 0
#       end
#       if ($all_sab2)
#         puts "#{ARGV[3]} program sabotaged ALL tie rounds."
#         $p2_pts = 0
#       end
#       $tie_breaker_rounds = $tie_breaker_rounds + 1
#     end
#     p_in1.puts "quit"
#     p_in2.puts "quit"
#
#     if (($p1_pts == 0 and $p2_pts == 0) or (($p1_pts == $p2_pts) and $tie_breaker_rounds >= 3))
#       puts "Both lose"
#     elsif ($p1_pts > $p2_pts)
#       puts "#{ARGV[1]} program wins."
#     else
#       puts "#{ARGV[3]} program wins."
#     end
#   end
# end
