#!/data/data/com.termux/files/usr/bin/bash

set -e
# Default settings
if [ -x /data/data/com.termux/files/usr/libexec/termux/command-not-found ]; then
        command_not_found_handle() {
                echo ""
                /data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"
        }
fi

function check_command() {
        command -v "$@" >/dev/null 2>&1
}

# Animate
function loading() {
  char="\ | / -"
  times=1
  while (( $times <= 40 )); do
    for txt in $char; do
      printf "\r                  \r"
      printf "\r\033[1;92m[\033[1;97m!\033[1;92m] \033[1;97mPlease wait $txt "
      sleep 0.1
      ((times++))
    done
  done
}

function banner() {
  printf "\033[1;94m██████████████████████████████████████████████\n\033[1;96m     ┏━╸┏━┓┏┳┓┏━╸┏━┓   ╺┳╸┏━╸┏━┓┏┳┓╻ ╻╻ ╻\n     ┃╺┓┣━┫┃┃┃┣╸ ┗━┓╺━╸ ┃ ┣╸ ┣┳┛┃┃┃┃ ┃┏╋┛\n     ┗━┛╹ ╹╹ ╹┗━╸┗━┛    ╹ ┗━╸╹┗╸╹ ╹┗━┛╹ ╹\n\033[1;94m██████████████████████████████████████████████\n\033[1;93m ✠ \033[1;97mAuthor : Fajar Kim\n\033[1;93m ✠ \033[1;97mVersion: v1.0.0\n\033[1;93m ✠ \033[1;97mGithub : \033[4mhttps://github.com/FajarKim\033[m\n\033[1;94m──────────────────────────────────────────────\033[m\n"
}

function list_menu() {
  printf "\033[0;92m 1. \033[1;97m0verkill            \033[0;92m11.\033[1;97m Moon Buggy
\033[0;92m 2. \033[1;97m2048                \033[0;92m12.\033[1;97m Moria
\033[0;92m 3. \033[1;97mBrogue              \033[0;92m13.\033[1;97m Nethack
\033[0;92m 4. \033[1;97mCavez of Phear      \033[0;92m14.\033[1;97m Npush
\033[0;92m 5. \033[1;97mSolitaire \033[92m(\033[97m1\033[92m)       \033[0;92m15.\033[1;97m Snake
\033[0;92m 6. \033[1;97mSolitaire \033[92m(\033[97m2\033[92m)       \033[0;92m16.\033[1;97m Sudoku
\033[0;92m 7. \033[1;97mDopewars            \033[0;92m17.\033[1;97m Pacman \033[92m(\033[97m1\033[92m)
\033[0;92m 8. \033[1;97mCurse of War        \033[0;92m18.\033[1;97m Pacman \033[92m(\033[97m2\033[92m)
\033[0;92m 9. \033[1;97mSki                 \033[0;92m19.\033[1;97m Go
\033[0;92m10. \033[1;97mGreed               \033[0;92m20.\033[1;97m Robot finds Kitten
\033[1;94m──────────────────────────────────────────────
\033[3;97mFor \033[91mexit\033[97m, type 0 or Ctrl+C\033[m
\033[1;94m──────────────────────────────────────────────\033[m\n"
}

# Select games
function select_games() {
  function overkill() {
    # Check command 0verkill
    check_command 0verkill || command_not_found_handle 0verkill
    # Playing games
    clear
    0verkill
  }

  function games_2048() {
    # Check command 2048
    check_command 2048 || command_not_found_handle 2048
    # Playing games
    clear
    2048
  }

  function brogue_games() {
    # Check command brogue
    check_command brogue || command_not_found_handle brogue
    # Playing games
    clear
    brogue
  }

  function cavez_of_phear() {
    # Check command phear
    check_command phear || command_not_found_handle phear
    # Playing games
    clear
    phear
  }

  function solitaire_1() {
    # Check command csol
    check_command csol || command_not_found_handle csol
    # Playing games
    clear
    csol
  }

  function solitaire_2() {
    # Check command ttysolitaire
    check_command ttysolitaire || command_not_found_handle ttysolitaire
    # Playing games
    clear
    ttysolitaire
  }

  function curse_of_war() {
    # Check command curseofwar
    check_command curseofwar || command_not_found_handle curseofwar
    # Playing games
    clear
    curseofwar
  }

  function dopewars_games() {
    # Check command dopewars
    check_command dopewars || command_not_found_handle dopewars
    # Playing games
    clear
    dopewars
  }

  function go() {
    # Check command gnugo
    check_command gnugo || command_not_found_handle gnugo
    # Playing games
    clear
    gnugo
  }

  function ski() {
    # Check command gnuski
    check_command gnuski || command_not_found_handle gnuski
    # Playing games
    clear
    gnuski
  }

  function greed_games() {
    # Check command greed
    check_command greed || command_not_found_handle greed
    # Playing games
    clear
    greed
  }

  function moon_buggy() {
    # Check command moon-buggy
    check_command moon-buggy || command_not_found_handle moon-buggy
    # Playing games
    clear
    moon-buggy
  }

  function moria_games() {
    # Check command moria
    check_command moria || command_not_found_handle moria
    # Playing games
    clear
    moria
  }

  function nethack_games() {
    # Check command nethack
    check_command nethack || command_not_found_handle nethack
    # Playing games
    clear
    nethack
  }

  function npush_games() {
    # Check command npush
    check_command npush || command_not_found_handle npush
    # Playibg games
    clear
    npush
  }

  function snake() {
    # Check command nsnake
    check_command nsnake || command_not_found_handle nsnake
    # Playing games
    clear
    nsnake
  }

  function sudoku() {
    # Check command nudoku
    check_command nudoku || command_not_found_handle nudoku
    # Playing games
    clear
    nudoku
  }

  function pacman_1() {
    # Check command pacmanplay
    check_command pacmanplay || command_not_found_handle pacmanplay
    # Playing games
    clear
    pacmanplay
  }

  function pacman_2() {
    # Check command myman
    check_command myman || command_not_found_handle myman
    # Playing games
    clear
    myman
  }

  function robot_finds_kitten() {
    # Check command robotfindskitten
    check_command robotfindskitten || command_not_found_handle robotfindskitten
    # Playing games
    clear
    robotfindskitten
  }
}

# Main menu
function main_menu() {
  clear
  banner
  list_menu
  printf "\033[1;92m[\033[1;97m?\033[1;92m]\033[1;97m Select:\033[m "
  read -p '' input
  select_games
  case $input in
    0 | 00 | 000) exit 0;;
    1 | 01 | 001) loading; sleep 1.5; overkill;;
    2 | 02 | 002) loading; sleep 1.5; games_2048;;
    3 | 03 | 003) loading; sleep 1.5; brogue_games;;
    4 | 04 | 004) loading; sleep 1.5; cavez_of_phear;;
    5 | 05 | 005) loading; sleep 1.5; solitaire_1;;
    6 | 06 | 006) loading; sleep 1.5; solitaire_2;;
    7 | 07 | 007) loading; sleep 1.5; dopewars_games;;
    8 | 08 | 008) loading; sleep 1.5; curse_of_war;;
    9 | 09 | 009) loading; sleep 1.5; ski;;
    10 | 010) loading; sleep 1.5; greed_games;;
    11 | 011) loading; sleep 1.5; moon_buggy;;
    12 | 012) loading; sleep 1.5; moria_games;;
    13 | 013) loading; sleep 1.5; nethack_games;;
    14 | 014) loading; sleep 1.5; npush_games;;
    15 | 015) loading; sleep 1.5; snake;;
    16 | 016) loading; sleep 1.5; sudoku;;
    17 | 017) loading; sleep 1.5; pacman_1;;
    18 | 018) loading; sleep 1.5; pacman_2;;
    19 | 019) loading; sleep 1.5; go;;
    20 | 020) loading; sleep 1.5; robot_finds_kitten;;
    "" | " ") printf "\033[1;91m[\033[1;97m!\033[1;91m] Please choose your input!\033[m\n"; exit 1;;
    *) printf "\033[1;91m[\033[1;97m!\033[1;91m] Invalid option your input \`$input'!\033[m\n"; exit 1;;
  esac
}

main_menu
