#!/usr/bin/env bash
# courtery of https://github.com/janoamaral/tokyo-night-tmux/
format_number() {
  local number format
  echo "Argument: $1" >> /tmp/debug.log
  number=$(($1))
  echo "Number $number" >> /tmp/debug.log
  format=$2

  if [ "$format" = "-d" ]; then
    case $number in
      0) echo "🯰";;
      1) echo "🯱";;
      2) echo "🯲";;
      3) echo "🯳";;
      4) echo "🯴";;
      5) echo "🯵";;
      6) echo "🯶";;
      7) echo "🯷";;
      8) echo "🯸";;
      9) echo "🯹";;
      *) echo "$number";;
    esac
  fi

  if [ "$format" = "-s" ]; then
    case $number in
      0) echo "󰎡";;
      1) echo "󰎤";;
      2) echo "󰎧";;
      3) echo "󰎪";;
      4) echo "󰎭";;
      5) echo "󰎱";;
      6) echo "󰎳";;
      7) echo "󰎶";;
      8) echo "󰎹";;
      9) echo "󰎼";;
      *) echo "$number";;
    esac
  fi

  if [ "$format" = "-o" ]; then
    case $number in
      0) echo "󰎣";;
      1) echo "󰎦";;
      2) echo "󰎩";;
      3) echo "󰎬";;
      4) echo "󰎮";;
      5) echo "󰎰";;
      6) echo "󰎵";;
      7) echo "󰎸";;
      8) echo "󰎻";;
      9) echo "󰎾";;
      *) echo "$number";;
    esac
  fi

  if [ "$format" = "-O" ]; then
    case $number in
      0) echo "󰎢";;
      1) echo "󰎥";;
      2) echo "󰎨";;
      3) echo "󰎫";;
      4) echo "󰎲";;
      5) echo "󰎯";;
      6) echo "󰎴";;
      7) echo "󰎷";;
      8) echo "󰎺";;
      9) echo "󰎽";;
      *) echo "$number";;
    esac
  fi

  if [ "$format" = "-r" ]; then
    case $number in
      0) echo " ";;
      1) echo "󱂈";;
      2) echo "󱂉";;
      3) echo "󱂊";;
      4) echo "󱂋";;
      5) echo "󱂌";;
      6) echo "󱂍";;
      7) echo "󱂎";;
      8) echo "󱂏";;
      9) echo "󱂐";;
      *) echo "$number";;
    esac
  fi

  if [ "$format" = "-S" ]; then
    case $number in
      0) echo "⁰";;
      1) echo "¹";;
      2) echo "²";;
      3) echo "³";;
      4) echo "⁴";;
      5) echo "⁵";;
      6) echo "⁶";;
      7) echo "⁷";;
      8) echo "⁸";;
      9) echo "⁹";;
      *) echo "$number";;
    esac
  fi
}

format_number "$1" "$2"
