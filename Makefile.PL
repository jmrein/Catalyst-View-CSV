use inc::Module::Install;

name "Catalyst-View-CSV";
all_from "lib/Catalyst/View/CSV.pm";
license "perl";
build_requires "Test::More";
build_requires "Test::Exception";

requires "Catalyst";
requires "Text::CSV";

WriteAll;
