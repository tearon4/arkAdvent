package Jobeet::Controller::Category;
use Ark 'Controller';
use Jobeet::Models;

sub show :Path :Args(1) {
    my ($self, $c, $category_name) = @_;

    # Category検索
    my $category = models('Schema::Category')->find({ slug => $category_name })
        or $c->detach('/default');
    # 検索したCategoryが見つかればそれをテンプレ送り
    $c->stash->{category} = $category;
    # jobsとしてResultSetをテンプレ送り
    $c->stash->{jobs} = $category->get_active_jobs({
        rows => models('conf')->{max_jobs_on_category},
        page => $c->req->parameters->{page} || 1,
    });
}

1;