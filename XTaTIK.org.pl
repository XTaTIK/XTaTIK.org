#!/usr/bin/env perl

use Mojolicious::Lite;
plugin 'AssetPack';

app->secrets([42]);
app->config(hypnotoad => {listen => ['http://*:8081']});
app->asset('app.css' => qw{/main.scss  sprites:///s/} );


require 'data.html';
push @{ app->renderer->classes }, 'Fake';

#### ROUTES

get '/' => 'index';

any '/sitemap.xml' => sub {
    my $c = shift;
    $c->stash( format => 'xml' );
} => 'sitemap';

app->start;