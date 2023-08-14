#!/usr/bin/perl

# Written by dirt_hack_seven with the assistance of ChatGPT
# Very special thanks to C.C. Elian for the thoughtful creation of this lovely alphabet.
# https://www.github.com/drtac7/elian

use strict;
use warnings;
use utf8;

use Encode;  # Add the Encode module

use Exporter 'import';
our @EXPORT_OK = qw(convert_english_to_elian);

sub convert_english_to_elian 
{
    my $english_text = shift;

    my %char_map =
    (
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

    if (!defined $english_text || $english_text eq '') {
        $english_text = _prompt_for_input("Enter English text: ");
    }

    $english_text = lc($english_text);

    my @elian_chars = map { $char_map{$_} // $_ } split //, $english_text;
    my $elian_text = join(' ', @elian_chars);  # Add a space between characters

    return $elian_text;
}

sub _prompt_for_input 
{
    my ($prompt) = @_;
    print $prompt;
    my $input = <STDIN>;
    chomp($input);
    return $input;
}

# Main script starts here
binmode STDOUT, ":utf8";  # Set terminal output to UTF-8

my $english_text = join(' ', @ARGV);  # Join command-line arguments into a single string
my $elian_text = convert_english_to_elian($english_text);

print "Elian: $elian_text\n";

exit;
