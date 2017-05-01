use strict;
use warnings;
use lib 'lib';

use Jobeet::Schema;

my $schema = Jobeet::Schema->connect('dbi:SQLite:./test.db');
my $category_rs = $schema->resultset('Category');

my $category = $category_rs->create({ name => 'my category' });
print $category_rs->count;

my $new_rs = $category_rs->search({ name => 'my category' });

print $new_rs;
