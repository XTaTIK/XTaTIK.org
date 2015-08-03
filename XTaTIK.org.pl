#!/usr/bin/env perl

use Mojolicious::Lite;
app->secrets([rand]);
plugin 'AssetPack';
plugin 'bootstrap3' => (
  theme => {xtatik => "/CSS/_variables.scss"}
);

app->config(hypnotoad => {listen => ['http://*:8081']});

app->asset('app.js' => qw{
    /JS/jquery.min.js
    /JS/ie10-viewport-bug-workaround.js
});
app->asset('app.css' => qw{
    sprites:///s/
    /CSS/main.scss
});

require 'data.html';
push @{ app->renderer->classes }, 'Fake';

#### ROUTES

get '/' => 'index';

any '/sitemap.xml' => sub {
    my $c = shift;
    $c->stash( format => 'xml' );
} => 'sitemap';

app->start;
