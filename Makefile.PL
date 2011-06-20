use inc::Module::Install;

name "Catalyst-View-CSV";
all_from "lib/Catalyst/View/CSV.pm";
license "perl";
build_requires "Test::More";
build_requires "Test::Exception";
build_requires "Catalyst::Test";
build_requires "FindBin";

requires "Catalyst::View";
requires "Text::CSV";
requires "URI";

WriteAll;
