#!/usr/bin/perl

# Elian Script Converter
# Version 1.1
# Written by dirt_hack_seven with the assistance of ChatGPT
# Very special thanks to C.C. Elian for the thoughtful creation of this lovely alphabet.
# https://www.github.com/drtac7/elian

use strict;
use warnings;
use utf8;
use Term::ReadKey;  # Add the Term::ReadKey module

use Encode;

use Exporter 'import';
our @EXPORT_OK = qw(convert_english_to_elian);

sub convert_english_to_elian {
    my $english_text = shift;

    my %char_map = (
        "a" => "𠃍",
        "b" => "コ",
        "c" => "┘",
        "d" => "冂",
        "e" => "口",
        "f" => "凵",
        "g" => "厂",
        "h" => "匚",
        "i" => "𠃊",
        "j" => "ᒣ",
        "k" => "ᓗ",
        "l" => "ᒧ",
        "m" => "ᒉ",
        "n" => "ᑲ",
        "o" => "ᘂ",
        "p" => "ᒥ",
        "q" => "ᓕ",
        "r" => "ᒪ",
        "s" => "ᒭ",
        "t" => "ᓘ",
        "u" => "ᒨ",
        "v" => "ᒕ",
        "w" => "ᑰ",
        "x" => "ᒎ",
        "y" => "ᒕ",
        "z" => "ᓛ",
        " " => "  "
    );

    $english_text = lc($english_text);

    my @elian_chars = map { $char_map{$_} // $_ } split //, $english_text;
    my $elian_text = join(' ', @elian_chars);

    return $elian_text;
}

sub interactive_mode {
    ReadMode('cbreak');
    my $english_input = '';
    while (1) {
        my $key = ReadKey(0);
        last if ord($key) == 3;  # Ctrl-C to exit
        if ($key eq "\n" || $key eq "\r") {  # Newline or carriage return key
            print "\n";
            $english_input = '';  # Clear the input buffer on new line or carriage return
        } elsif (ord($key) == 127) {  # Backspace key
            if (length($english_input) > 0) {
                print "\b \b";  # Move cursor back, overwrite, and move cursor back again
                chop($english_input);
            }
        } else {
            $english_input .= $key;
        }
        my $elian_text = convert_english_to_elian($english_input);
        print "\r$elian_text";
    }
    ReadMode('normal');
    print "\n";
}

sub regular_mode {
    my $english_text = _prompt_for_input("Enter English text: ");
    my $elian_text = convert_english_to_elian($english_text);
    print "Elian: $elian_text\n";
}

sub _prompt_for_input {
    my ($prompt) = @_;
    print $prompt;
    my $input = <STDIN>;
    chomp($input);
    return $input;
}

# Main script starts here
binmode STDOUT, ":utf8";  # Set terminal output to UTF-8

if (@ARGV && $ARGV[0] eq "i") {
    interactive_mode();
} else {
    regular_mode();
}

exit;