package Jobeet::Controller::Job;
use Ark 'Controller';

use Jobeet::Models;

sub auto :Private {
    1;
}

sub index :Path :Args(0) {
    my ($self, $c) = @_;
    $c->stash->{jobs} = models('Schema::Job');
}

# __PACKAGE__->meta->make_immutable;

